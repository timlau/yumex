#!/usr/bin/python -tt
# -*- coding: iso-8859-1 -*-
#    Yum Exteder (yumex) - A GUI for yum
#    Copyright (C) 2008 Tim Lauridsen < tim<AT>yum-extender<DOT>org >
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

# Constants

import sys
import pickle
import base64

import pexpect
from yumexbase import *
from yumexbackend import YumexBackendBase, YumexPackageBase, YumexTransactionBase

class YumPackage:
    def __init__(self,base,args):
        self.base = base
        self.name   = args[0]
        self.epoch  = args[1]
        self.ver    = args[2]
        self.rel    = args[3]
        self.arch   = args[4]
        self.repoid = args[5]
        self.summary= args[6]
        
    def __str__(self):
        if self.epoch == '0':
            return '%s-%s-%s.%s' % (self.name,self.ver,self.rel,self.arch)
        else:
            return '%s:%s-%s-%s.%s' % (self.epoch,self.name,self.ver,self.rel,self.arch)

    @property        
    def id(self):        
        return '%s\t%s\t%s\t%s\t%s\t%s' % (self.name,self.epoch,self.ver,self.rel,self.arch,self.repoid)

    def get_attribute(self,attr):
        return self.base._get_attribute(self.id,attr)
           
class YumexBackendYum(YumexBackendBase):
    ''' Yumex Backend Yume class

    This is the base class to interact with yum
    '''

    def __init__(self, frontend):
        transaction = YumexTransactionYum(self,frontend)
        YumexBackendBase.__init__(self, frontend,transaction)
        
    def _send_command(self,cmd,args):
        line = "%s\t%s" % (cmd,"\t".join(args))
        self.child.expect(':ready')        
        self.child.sendline(line)

    def _parse_command(self,line):
        if line.startswith(':'):
            parts = line.split('\t')
            cmd = parts[0]
            if len(parts) > 1:
                args = parts[1:]
            else:
                args = []
            return cmd,args
        else:
            return None,line
        
    def _check_for_message(self,cmd,args):
        if cmd == ':error':
            self.frontend.error(args[0])    
        elif cmd == ':info':
            self.frontend.info(args[0])    
        elif cmd == ':debug':
            self.frontend.debug(args[0])    
        elif cmd == ':warning':
            self.frontend.warning(args[0])
        elif cmd == ':exception':
            self.frontend.exception(args[0])
        else:
            return False # not a message
        return True    
        
    def _get_list(self):
        pkgs = []
        cnt = 0L
        while True:
            line = self.child.readline()
            if line.startswith(':end'):
                break
            cmd,args = self._parse_command(line)
            if cmd:
                if not self._check_for_message(cmd, args):
                    if cmd == ':pkg':
                        p = YumexPackageYum(YumPackage(self,args))
                        pkgs.append(p)
        return pkgs

    def _get_result(self,result_cmd):
        cnt = 0L
        while True:
            line = self.child.readline()
            cmd,args = self._parse_command(line)
            if cmd:
                if not self._check_for_message(cmd, args):
                    if cmd == result_cmd:
                        return args
                    else:
                        self.frontend.warning("unexpected command : %s (%s)" % (cmd,args))
    
    def _close(self):        
        self.child.close(force=True)
        
    def _get_packages(self,pkg_filter):    
        self._send_command('get-packages',[str(pkg_filter)])
        pkgs = self._get_list()
        return pkgs

    def _get_attribute(self,id,attr):    
        self._send_command('get-attribute',[id,attr])
        args = self._get_result(':attr')
        if args:
            return pickle.loads(base64.b64decode(args[0]))
        else:
            return None
        

    def setup(self):
        ''' Setup the backend'''
        self.frontend.debug('Setup yum backend')
        self.child = pexpect.spawn('./yum_server.py')
        self.child.setecho(False)

    def reset(self):
        ''' Reset the backend, so it can be setup again'''
        self.frontend.debug('Reset yum backend')
        self._close()

    def get_packages(self, pkg_filter):
        ''' 
        get packages based on filter 
        @param pkg_filer: package list filter (Enum FILTER)
        @return: a list of packages
        '''
        self.frontend.debug('Get %s packages' % pkg_filter)
        return self._get_packages(pkg_filter)

    def get_repositories(self):
        ''' 
        get repositories 
        @return: a list of repositories
        '''
        self.frontend.debug('Getting repository information')

    def enable_repository(self, repoid, enabled=True):
        ''' 
        set repository enable state
        @param repoid: repo id to change
        @param enabled: repo enable state
        '''
        self.frontend.debug('Setting repository %s (Enabled = %s)' % (repoid, enabled))

    def get_groups(self):
        ''' 
        get groups 
        @return: a list of groups
        '''
        self.frontend.debug('Getting Group information')

    def get_group_packages(self, group, grp_filter):
        ''' 
        get packages in a group 
        @param group: group id to get packages from
        @param grp_filter: group filters (Enum GROUP)
        '''
        self.frontend.debug('Getting packages in group : %s (FILTER = %s)' % (group, grp_filter))

    def search(self, keys, sch_filters):
        ''' 
        get packages matching keys
        @param keys: list of keys to seach for
        @param sch_filters: list of search filter (Enum SEARCH)
        '''
        self.frontend.debug('Seaching for %s in %s ' % (keys, sch_filters))




class YumexPackageYum(YumexPackageBase):
    '''
    Yumex Package Base class

    This is an abstract package object for a package in the package system
    '''

    def __init__(self, pkg):
        YumexPackageBase.__init__(self, pkg)
        
    def __str__(self):
        return self.id

    @property
    def name(self):
        return self._pkg.name

    @property
    def version(self):
        return self._pkg.ver

    @property
    def release(self):
        return self._pkg.rel

    @property
    def epoch(self):
        return self._pkg.epoch

    @property
    def arch(self):
        return self._pkg.arch

    @property
    def repoid(self):
        return self._pkg.repoid

    @property
    def summary(self):
        return self._pkg.summary

    @property
    def description(self):
        return self._pkg.get_attribute('description')

    @property
    def changelog(self):
        return self._pkg.get_attribute('changelog')

    @property
    def filelist(self):
        return self._pkg.get_attribute('filelist')

    @property
    def id(self):
        return "%s-%s.%s.%s" % (self.name, self.version, self.release, self.arch)

    @property
    def filename(self):
        return "%s-%s.%s.%s.rpm" % (self.name, self.version, self.release, self.arch)

class YumexTransactionYum(YumexTransactionBase):
    '''
    Yumex Transaction Base class

    This is a abstract transaction queue for storing unprocessed changes
    to the system and to process the transaction on the system.
    '''

    def __init__(self, backend, frontend):
        '''
        initialize the transaction queue
        @param backend: The current YumexBackend
        @param frontend: the current YumexFrontend
        '''
        YumexTransactionBase.__init__(self, backend, frontend)

    def add(self, po):
        '''
        add a package to the queue
        @param po: package to add to the queue
        '''
        pass

    def remove(self, po):
        '''
        remove a package from the queue
        @param po: package to remove from the queue
        '''
        pass

    def has_item(self, po):
        '''
        check if a package is already in the queue
        @param po: package to check for
        '''
        pass

    def add_group(self, grp):
        '''
        Add a group to the queue
        @param grp: group to add to queue
        '''
        pass

    def remove_group(self, grp):
        '''
        Remove a group from the queue
        @param grp: group to add to queue
        '''
        pass

    def has_group(self, grp):
        '''
        Check if a group is in the  queue
        @param grp: group to check for
        '''
        pass
    
    def process_transaction(self):
        '''
        Process the packages and groups in the queue
        '''

    def get_transaction_packages(self):
        '''
        Get the current packages in the transaction queue
        '''
