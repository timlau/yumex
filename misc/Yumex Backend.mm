<map version="0.8.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1223275614571" ID="Freemind_Link_217257617" MODIFIED="1223277578919" TEXT="Yumex Backend">
<node CREATED="1223277130069" ID="Freemind_Link_1015244167" MODIFIED="1223277136520" POSITION="right" TEXT="Const">
<node CREATED="1223277139720" ID="Freemind_Link_889994634" MODIFIED="1223277159585" TEXT="PKG_TYPE">
<node CREATED="1223277159536" ID="Freemind_Link_157082045" MODIFIED="1223277230875" TEXT="PKG_TYPE_AVAILABLE"/>
<node CREATED="1223277204852" ID="Freemind_Link_187927586" MODIFIED="1223277211929" TEXT="PKG_TYPE_INSTALLED"/>
<node CREATED="1223277212469" ID="Freemind_Link_1603488241" MODIFIED="1223277224330" TEXT="PKG_TYPE_UPDATE"/>
<node CREATED="1223277232043" ID="Freemind_Link_1247739747" MODIFIED="1223277241312" TEXT="PKG_TYPE_OBSOLETE"/>
</node>
<node CREATED="1223277253871" ID="Freemind_Link_637565065" MODIFIED="1223277266108" TEXT="FILTER">
<node CREATED="1223277266053" ID="Freemind_Link_1046906049" MODIFIED="1223277272141" TEXT="FILTER_INSTALLED"/>
<node CREATED="1223277273908" ID="Freemind_Link_921899465" MODIFIED="1223277303302" TEXT="FILTER_AVAILABLE"/>
<node CREATED="1223277364791" ID="Freemind_Link_1706503532" MODIFIED="1223296616889" TEXT="FILTER_UPDATES"/>
<node CREATED="1223277369588" ID="Freemind_Link_612755469" MODIFIED="1223277374663" TEXT="FILTER_OBSOLETES"/>
<node CREATED="1223277375255" ID="Freemind_Link_1233038260" MODIFIED="1223277386086" TEXT="FILTER_ALL"/>
</node>
<node CREATED="1223277829747" ID="Freemind_Link_1354421787" MODIFIED="1223277833180" TEXT="SEARCH">
<node CREATED="1223277834417" ID="Freemind_Link_1201572488" MODIFIED="1223277858787" TEXT="SEARCH_NAME"/>
<node CREATED="1223277859279" ID="Freemind_Link_623032126" MODIFIED="1223277864867" TEXT="SEARCH_SUMMARY"/>
<node CREATED="1223277865451" ID="Freemind_Link_1518156881" MODIFIED="1223277879739" TEXT="SEARCH_DESCRIPTION"/>
<node CREATED="1223277903073" ID="Freemind_Link_1026950347" MODIFIED="1223277906947" TEXT="SEARCH_ARCH"/>
<node CREATED="1223277907491" ID="Freemind_Link_960827170" MODIFIED="1223277919661" TEXT="SEARCH_FULLVER"/>
<node CREATED="1223277920138" ID="Freemind_Link_921524243" MODIFIED="1223277941147" TEXT="SEARCH_REPO"/>
</node>
<node CREATED="1223278183651" ID="Freemind_Link_114921185" MODIFIED="1223278193013" TEXT="GROUP">
<node CREATED="1223278192953" ID="Freemind_Link_468038401" MODIFIED="1223278282326" TEXT="GROUP_MINIMUM"/>
<node CREATED="1223278219644" ID="Freemind_Link_459135538" MODIFIED="1223278246583" TEXT="GROUP_ALL"/>
</node>
<node CREATED="1223279033452" ID="Freemind_Link_147138912" MODIFIED="1223279044695" TEXT="STATE">
<node CREATED="1223279044641" ID="Freemind_Link_1280481843" MODIFIED="1223279056577" TEXT="STATE_INIT"/>
<node CREATED="1223279057721" ID="Freemind_Link_45137596" MODIFIED="1223279084490" TEXT="STATE_DNL_META"/>
<node CREATED="1223279084874" ID="Freemind_Link_852454669" MODIFIED="1223279095755" TEXT="STATE_DNL_PKG"/>
<node CREATED="1223279096431" ID="Freemind_Link_1882414942" MODIFIED="1223279123932" TEXT="STATE_INST"/>
<node CREATED="1223279124777" ID="Freemind_Link_983320564" MODIFIED="1223279130496" TEXT="STATE_UPDATE"/>
<node CREATED="1223279130884" ID="Freemind_Link_368436628" MODIFIED="1223279136071" TEXT="STATE_REMOVE"/>
<node CREATED="1223279136754" ID="Freemind_Link_1632596355" MODIFIED="1223279164501" TEXT="STATE_CLEANUP"/>
</node>
</node>
<node CREATED="1223275632702" ID="_" MODIFIED="1223275647973" POSITION="right" TEXT="YumexBackendBase">
<node CREATED="1223275675276" ID="Freemind_Link_749187618" MODIFIED="1223279608020" TEXT="setup()">
<node CREATED="1223277582552" ID="Freemind_Link_832367336" MODIFIED="1223279591084" TEXT="Setup the backend">
<arrowlink DESTINATION="Freemind_Link_22112521" ENDARROW="Default" ENDINCLINATION="282;0;" ID="Freemind_Arrow_Link_28432453" STARTARROW="None" STARTINCLINATION="282;0;"/>
<arrowlink DESTINATION="Freemind_Link_376027656" ENDARROW="Default" ENDINCLINATION="269;0;" ID="Freemind_Arrow_Link_215981544" STARTARROW="None" STARTINCLINATION="269;0;"/>
</node>
</node>
<node CREATED="1223275691421" ID="Freemind_Link_1062344117" MODIFIED="1223277962740" TEXT="get_packages(pkg_filter)">
<node CREATED="1223277641771" ID="Freemind_Link_681690386" MODIFIED="1223277978392" TEXT="get list of packages based on filter (FILTER_)"/>
</node>
<node CREATED="1223276237323" ID="Freemind_Link_1639395846" MODIFIED="1223276251977" TEXT="get_repos()">
<node CREATED="1223277672095" ID="Freemind_Link_652255933" MODIFIED="1223277688786" TEXT="Get the definded repos on the system"/>
</node>
<node CREATED="1223276207236" ID="Freemind_Link_1891069437" MODIFIED="1223276236743" TEXT="set_repo(repoid,enabled)">
<node CREATED="1223277706301" ID="Freemind_Link_1344212759" MODIFIED="1223277717865" TEXT="The the enable state of a repo"/>
</node>
<node CREATED="1223275766471" ID="Freemind_Link_1903476761" MODIFIED="1223278014519" TEXT="search(keys,sch_filters)">
<node CREATED="1223278014451" ID="Freemind_Link_100415387" MODIFIED="1223278051365" TEXT="seach packages for keys based on filter (SEARCH_)"/>
</node>
<node CREATED="1223276374363" ID="Freemind_Link_1203924914" MODIFIED="1223276456549" TEXT="get_categories()">
<node CREATED="1223278075766" ID="Freemind_Link_1785868157" MODIFIED="1223278097120" TEXT="Get Group categories"/>
</node>
<node CREATED="1223276380594" ID="Freemind_Link_1806185633" MODIFIED="1223278117692" TEXT="get_groups(category)">
<node CREATED="1223278119208" ID="Freemind_Link_1645442383" MODIFIED="1223278146682" TEXT="Get groups in a category, None = alle categories"/>
</node>
<node CREATED="1223276412197" ID="Freemind_Link_282806995" MODIFIED="1223276443236" TEXT="get_group_packages(filter)">
<node CREATED="1223278153417" ID="Freemind_Link_625113763" MODIFIED="1223278179955" TEXT="Get packages in a group based on filter"/>
</node>
<node CREATED="1223275687909" ID="Freemind_Link_976703993" MODIFIED="1223276256522" TEXT="reset()">
<node CREATED="1223277613592" ID="Freemind_Link_1336905175" MODIFIED="1223282509340" TEXT="Reset the backend, so we can setup again"/>
</node>
</node>
<node CREATED="1223275648623" ID="Freemind_Link_205358626" MODIFIED="1223275661061" POSITION="right" TEXT="YumexFrontendBase">
<node CREATED="1223275829772" ID="Freemind_Link_376027656" MODIFIED="1223279502117" TEXT="status(state,msg)">
<node CREATED="1223282512061" ID="Freemind_Link_539720986" MODIFIED="1223282553008" TEXT="set the state for the current process (downloading, installing, updating etc)"/>
</node>
<node CREATED="1223283330604" ID="Freemind_Link_485623072" MODIFIED="1223283345041" TEXT="get_progress()">
<node CREATED="1223283344980" ID="Freemind_Link_1735785042" MODIFIED="1223283367025" TEXT="The the current progress object"/>
</node>
<node COLOR="#990000" CREATED="1223275839867" ID="Freemind_Link_22112521" MODIFIED="1223282636900" TEXT="progress(progress)">
<node CREATED="1223283164265" ID="Freemind_Link_484054059" MODIFIED="1223283172458" TEXT="update the current progress"/>
</node>
<node CREATED="1223276571923" ID="Freemind_Link_572723731" MODIFIED="1223279608021" TEXT="confrim_transaction(transaction)">
<node CREATED="1223283183862" ID="Freemind_Link_42028162" MODIFIED="1223283210607" TEXT="confirm the current transaction to be processed"/>
</node>
<node CREATED="1223275826127" ID="Freemind_Link_1508410065" MODIFIED="1223276267792" TEXT="reset()">
<node CREATED="1223283223261" ID="Freemind_Link_361214942" MODIFIED="1223283233898" TEXT="reset state and progress"/>
</node>
</node>
<node CREATED="1223282640439" ID="Freemind_Link_1015750598" MODIFIED="1223282646351" POSITION="right" TEXT="YumexProgress">
<node CREATED="1223282647947" ID="Freemind_Link_1777301608" MODIFIED="1223282651026" TEXT="name">
<node CREATED="1223282767796" ID="Freemind_Link_1861773002" MODIFIED="1223282785162" TEXT="filename/package name being worked on"/>
</node>
<node CREATED="1223282651783" ID="Freemind_Link_230813631" MODIFIED="1223282660748" TEXT="pct">
<node CREATED="1223282820745" ID="Freemind_Link_986577587" MODIFIED="1223282863222" TEXT="% of whole transaction"/>
</node>
<node CREATED="1223282661445" ID="Freemind_Link_545825958" MODIFIED="1223282664379" TEXT="sub_pct">
<node CREATED="1223282843099" ID="Freemind_Link_666954907" MODIFIED="1223282853863" TEXT="% of current file"/>
</node>
<node CREATED="1223282665022" ID="Freemind_Link_177536991" MODIFIED="1223282991292" TEXT="downloaded">
<node CREATED="1223282868813" ID="Freemind_Link_1140868619" MODIFIED="1223282888649" TEXT="KB download of current file"/>
</node>
<node CREATED="1223282708883" ID="Freemind_Link_1473811914" MODIFIED="1223282942666" TEXT="size">
<node CREATED="1223282902631" ID="Freemind_Link_1196282520" MODIFIED="1223282933164" TEXT="Size current file"/>
</node>
<node CREATED="1223282718115" ID="Freemind_Link_444992873" MODIFIED="1223283004701" TEXT="total_size">
<node CREATED="1223283014112" ID="Freemind_Link_401373468" MODIFIED="1223283028986" TEXT="Size of total download"/>
</node>
<node CREATED="1223282693956" ID="Freemind_Link_814840312" MODIFIED="1223282748960" TEXT="cur_ETA">
<node CREATED="1223283105977" ID="Freemind_Link_229806844" MODIFIED="1223283113476" TEXT="ETA of current file"/>
</node>
<node CREATED="1223282749500" ID="Freemind_Link_605577650" MODIFIED="1223282754595" TEXT="total_ETA">
<node CREATED="1223283118426" ID="Freemind_Link_540547869" MODIFIED="1223283125543" TEXT="ETA for all files"/>
</node>
<node CREATED="1223282755213" ID="Freemind_Link_146751468" MODIFIED="1223282762227" TEXT="speed">
<node CREATED="1223283127567" ID="Freemind_Link_663252934" MODIFIED="1223283144764" TEXT="current dnl speed in KB/s"/>
</node>
</node>
</node>
</map>
