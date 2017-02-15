<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="keywords" content="wsg,hth">
	<meta name="description" content="ASW">       
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />   
	<meta name="keywords" content="亿维云网">
	<Meta name="description" Content="亿维云网">
	<title>亿维云网</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.js"></script><!-- 统一调用js -->
	<script src="js/SuperSlide/jquery.superslide.2.1.1.js"></script><!-- 切换 -->
<!-- 云服务器 -->
	<!-- 1. 全局基础样式 -->
    <link rel="stylesheet" href="server/css/global.css">
    <!-- 2. 全局常用UI模块样式 -->
    <link rel="stylesheet" href="server/css/common.css">
    <!--[ CSS LINKS PLACEHOLDER ]-->
    <link rel="stylesheet" href="server/css/wjf-1.css">
    <link rel="stylesheet" href="server/css/pjList.css">
    <link rel="stylesheet" href="server/css/cloudhost.css">
		<script language="javascript" src="jscripts/kf/login.js"></script>
    <!-- 全局依赖插件 -->     
    <link rel="stylesheet" href="server/css/layer.css" id="layui_layer_skinlayercss" style="">
    <link rel="stylesheet" href="server/css/west.css" type="text/css">
    </head>
<!-- 云服务器 end-->

<body>
	<?php require_once('top.php'); ?>
	<div class="ban_div"><img src="images/a0.jpg" width="100%" alt=""></div>
	<div class="server_div">
		<div class="w1200 server_div1" id="J_cloudhostBanner">
			<ul>
				<li class="li1">
					<h2>大牌支持信赖</h2>
					<p>戴尔、英特尔、三星、希捷等顶尖硬件供应商</p>
				</li>
				<li class="li2">
					<h2>高度稳定表现</h2>
					<p>运营商电信、联通一级真宽带，BGP多线认证星级机房</p>
				</li>
				<li class="li3">
					<h2>自助灵活选配</h2>
					<p>根据您的需要，完全自助灵活选配，即买即用</p>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
		<!-- banner 结束 -->
        
<script type="text/javascript">
//========= 以下变量信息 由ASP填充
var cpucount=6;
var ramcount=12;
var paytimestr="1月:1,3月:3,6月:6,1年:12,2年:24,3年:36,5年:60";
var paytestprice=18;
var username="";
var userlevel="";
var useripmsg="电信";
var sharefluxroom="36,41,43";
var loginsuccess="";
</script>

<!-- 内容区域 开始 -->
<div id="content">
    <!-- 弹性云主机+套餐云主机 开始 -->
    <div class="host-content">
        <div class="wide1190">
            <!-- 选项卡 -->
            <ul class="wjf-ui-tab-style2 cl" id="J_cloudhostTabDom">
                <li><a class="active" href="javascript:void(0);" data-target="J_txHostDom">弹性云主机</a></li>
                <li><a href="javascript:void(0);" class="" data-target="J_tcHostDom">套餐云主机</a></li>
            </ul>
            <div class="host-config cl">
                <!-- 弹性云主机 开始 -->
                <div class="wjf-ui-tab-content active pos-r" id="J_txHostDom">
                    <!-- 当前配置 开始 -->
                    <div class="current-config" id="J_currentConfigDom">
                        <span class="config-title">当前配置</span>
                        <!-- 集群ID 隐藏域 -->
                        <input type="hidden" name="setebsid" id="J_setebsidHiddenDom">
                        <ul class="config-list cl" id="J_productConfigListContainer">
                            <li>
                                <label class="">产品类型：</label><span class="">商务型</span></li>
                            <li>
                                <label class="">CPU：</label><span class="">4核</span></li>
                            <li>
                                <label class="">内存：</label><span class="">4G</span></li>
                            <li>
                                <label class="">硬盘：</label><span class="">100G</span></li>
                            <li>
                                <label class="">带宽：</label><span class="">4Mbps</span></li>
                            <li>
                                <label class="f-l">操作系统：</label><span style="display:block;overflow:hidden">--</span></li>
                            <li>
                                <label class="">线路：</label><span class="">--</span></li>
                            <li>
                                <label class="">存储模式：</label><span class="">分布式集群存储</span></li>
                            <li>
                                <label class="">服务标准：</label><span class="">铜牌服务</span></li>
                            <li>
                                <label class="">购买量：</label><span class="">--</span></li>
                            <li>
                                <label class="">集群ID：</label><span class="">随机分配</span></li>
                            <li>
                                <label for="">费用总计：</label>
                            </li>
                        </ul>
                        <!--    <div class="config-price">费用总计：</div> -->
                        <div class="font24 orange" id="J_configPriceDom">--</div>
                        <!-- 价格优惠信息描述 -->
                        <div id="priceDiscountDesc"></div>
                        <div id="agreement_container" class="cl">
                            <label for="J_agreement" class="dis-ib checked" id="J_agreement_label">
                            </label>
                            <div style="overflow:hidden">
                                我已阅读并同意
                                <br>
                                <a href="/customercenter/yunxiyi.asp" target="_blank">亿维云云服务器租用协议</a>
                            </div>
                        </div>
                        <div id="J_buyBtnsContainer"><a class="config-btn btn_buy" href="javascript:void(0);">立即购买</a>
                            <a class="config-btn btn_try" href="javascript:void(0);">试用配置</a></div>
                    </div>
                    <!-- 产品配置模板 -->
                    <script id="J_productonfigListContainerTpl" type="text/x-jsrender">
                        <li>
                            <label class="">产品类型：</label><span class="">{{:productTypeDesc}}</span></li>
                        <li>
                            <label class="">CPU：</label><span class="">{{:cpuCount}}核</span></li>
                        <li>
                            <label class="">内存：</label><span class="">{{:ramCount}}G</span></li>
                        <li>
                            <label class="">硬盘：</label><span class="">{{:dataCount}}G</span></li>
                        <li>
                            <label class="">带宽：</label><span class="">{{:fluxCount}}Mbps</span></li>
                        <li>
                            <label class="f-l">操作系统：</label><span class="" style="display:block;overflow:hidden">{{:CHOICE_OSDesc}}</span></li>
                        <li>
                            <label class="">线路：</label><span class="">{{:roomDesc}}</span></li>
                        <li>
                            <label class="">存储模式：</label><span class="">{{:disktypeDesc}}</span></li>
                        <li>
                            <label class="">服务标准：</label><span class="">{{:servicetypeDesc}}</span></li>
                        <li>
                            <label class="">购买量：</label><span class="">{{:renewTimeDesc}}x {{:buycount}}台</span></li>
                        <li>
                            <label class=""style="color: #fe7402;">赠送时长：</label><span class="" style="color: #fe7402;font-weight: bold;">
                            {{if giftTime}}
                            {{:giftTime}}
                            {{else}}
                            无
                            {{/if}}
                            </span>
                        </li>
                        <li>
                            <label class="">集群ID：</label><span class="">
                            {{if setebsid}}
                            {{:setebsid}}
                            {{else}}
                            随机分配
                            {{/if}}
                            </span></li>
                    </script>
                    <!-- 当前配置 结束 -->
                    <div class="tx-host">
                        <div class="tuijian-config" id="J_tuijianBtnsDom">
                            <a class="pos-r" href="javascript:void(0);" data-value="basic" data-type="tejia">入门型
                                <div class="manager-tip">适用于中小企业展示型网站<i></i></div>
                            </a>
                            <a class="pos-r" href="javascript:void(0);" data-value="standard" data-type="biaozhun">标准型
                                <div class="manager-tip">适用于企业官方网站、个人站长<i></i></div>
                            </a>
                            <a class="pos-r" href="javascript:void(0);" data-value="business" data-type="shangwu">商务型
                                <div class="manager-tip">适用于地方/行业门户网站<i></i></div>
                            </a>
                            <a class="pos-r" href="javascript:void(0);" data-value="comfortable">舒适型
                                <div class="manager-tip">适用于网上商城、团购网站等<i></i></div>
                            </a>
                            <a class="pos-r" href="javascript:void(0);" data-value="enterprise">企业型
                                <div class="manager-tip" style="width: 204px;">适用于社区SNS/论坛/ERP/OACRM等<i></i></div>
                            </a>
                            <a class="pos-r" href="javascript:void(0);" data-value="luxury">豪华型
                                <div class="manager-tip">适用于网络游戏，其它高端应用等<i></i></div>
                            </a>
                        </div>
                        <div class="config-box cl">
                            <label for="">CPU:</label>

                            <div class="right-side cl">
                                <div class="low-config-tip" id="J_cpuLowTip">
                                    建议至少用双核，单核在很多情况下容易发生CPU100%占用影响性能!
                                </div>
                                <span class="config-modify config-minus" data-target="cpu"></span>
                                <input type="text" data-orig-type="range" name="cpu" id="cpuRange" class="range hide" onfocus="this.blur();">
                                <span class="config-modify config-plus" data-target="cpu"></span>
                                <span class="config-count dis-ib" id="cpuCount">4核</span>
                                <ul class="range-desc cl" id="J_cpuRangeDesc">
                                    <li data-index="1"><a href="javascript:void(0);">1核</a></li>
                                    <li data-index="2"><a href="javascript:void(0);">2核</a></li>
                                    <li data-index="3"><a href="javascript:void(0);">4核</a></li>
                                    <li data-index="4"><a href="javascript:void(0);">8核</a></li>
                                    <li data-index="5"><a href="javascript:void(0);">12核</a></li>
                                    <li data-index="6" class="last"><a href="javascript:void(0);">16核</a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="position:absolute;margin-top:-60px;margin-left:115px;">
                            <a class="pos-r" href="javascript:void(0);">
                                <span class="icon-question"></span>
                                <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; z-index: 100;">
                                    CPU越多，计算速度越快。
                                    <br />对网站访问量较大的网站，推荐使用4核或8核CPU！
                                    <i></i>
                                </div>
                            </a>
                        </div>
                        <div class="config-box cl">
                            <label for="">内存:</label>

                            <div class="right-side cl">
                                <div class="low-config-tip" id="J_ramLowTip">
                                    建议选择1G以上内存以获得更好的服务体验！
                                </div>
                                <span class="config-modify config-minus" data-target="ram"></span>
                                <input type="text" data-orig-type="range" name="ram" id="ramRange" class="range hide" onfocus="this.blur();">
                                <span class="config-modify config-plus" data-target="ram"></span>
                                <span class="config-count dis-ib" id="ramCount">4G</span>
                                <ul class="range-desc cl" id="J_ramRangeDesc">
                                    <li data-index="1"><a href="javascript:void(0);">0.5G</a></li>
                                    <li data-index="2"><a href="javascript:void(0);">1G</a></li>
                                    <li data-index="3"><a href="javascript:void(0);">2G</a></li>
                                    <li data-index="4"><a href="javascript:void(0);">3G</a></li>
                                    <li data-index="5"><a href="javascript:void(0);">4G</a></li>
                                    <li data-index="6"><a href="javascript:void(0);">6G</a></li>
                                    <li data-index="7"><a href="javascript:void(0);">8G</a></li>
                                    <li data-index="8"><a href="javascript:void(0);">12G</a></li>
                                    <li data-index="9"><a href="javascript:void(0);">16G</a></li>
                                    <li data-index="10"><a href="javascript:void(0);">32G</a></li>
                                    <li data-index="11"><a href="javascript:void(0);">64G</a></li>
                                    <li data-index="12" class="last"><a href="javascript:void(0);">128G</a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="position:absolute;margin-top:-60px;margin-left:115px;">
                            <a class="pos-r" href="javascript:void(0);">
                                <span class="icon-question"></span>
                                <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; z-index: 100;">
                                    内存越大，速度越快；
                                    <br />为保证良好的体验，512M内存不提供windows操作系统。
                                    <i></i>
                                </div>
                            </a>
                        </div>
                        <div class="config-box cl">
                            <label for="">硬盘:</label>
                            <div class="right-side cl">
                                <span class="config-modify config-minus" data-target="data"></span>
                                <input type="text" data-orig-type="range" name="data" id="dataRange" class="range" >
                                <span class="config-modify config-plus" data-target="data"></span>
                                <span class="config-count-unit">G</span>
                                <ul class="range-desc cl" id="J_dataRangeDesc">
                                    <li data-index="50" class="first"><a href="javascript:void(0);">50G</a></li>
                                    <li data-index="1000" class="last"><a href="javascript:void(0);">1000G</a></li>
                                </ul>
                                <p class="system-disk-size-tip">系统盘分配大小为30G</p>
                            </div>
                        </div>
                        <div style="position:absolute;margin-top:-60px;margin-left:115px">
                            <a class="pos-r" href="javascript:void(0);">
                                <span class="icon-question"></span>
                                <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; ">
                                    最低50G硬盘，其中系统盘分配大小为30GB(可在开通后升级扩容系统盘)；
                                    <br />数据盘默认为20GB，数据盘以10G递增。
                                    <i></i>
                                </div>
                            </a>
                        </div>
                        <div class="config-box cl">
                            <label for="">带宽:</label>
                            <div class="right-side cl flux-container">
                                <div class="low-config-tip" id="J_fluxLowTip">选择0M带宽不能访问公网（不分配公网IP），且后期亦不能升级带宽！</div>
                                <span class="config-modify config-minus" data-target="flux"></span>
                                <input type="text" data-orig-type="range" name="flux" id="fluxRange" class="range" >
                                <span class="config-modify config-plus" data-target="flux"></span>
                                <span class="config-count-unit">M</span>
                                <ul class="range-desc cl" id="J_fluxRangeDesc">
                                    <li data-index="0" class="first"><a href="javascript:void(0);">0M</a></li>
                                    <li data-index="100" class="last"><a href="javascript:void(0);">100M</a></li>
                                </ul>
                            </div>
                        </div>
                        <div style="position:absolute;margin-top:-60px;margin-left:115px;">
                            <a class="pos-r" href="javascript:void(0);">
                                <span class="icon-question"></span>
                                <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; ">
                                    带宽越大，速度越快、支持的同时访问人数更多。
                                    <br />1M带宽仅适合于测试、挂机等应用，网站应用至少2M，推荐3M以上带宽！
                                    <i></i>
                                </div>
                            </a>
                        </div>
                        <div class="config-box cl" style="zoom: 1; overflow:visible;">
                            <label>操作系统：</label>
                            <div class="right-side">
                                <span class="wjf-ui-select-wrapper"><span class="wjf-ui-select" id="systemTypeDom"></span></span>
                                <span class="wjf-ui-select-wrapper">
                                <span class="wjf-ui-select" id="systemSubTypeDom"></span>
                                <ul class="wjf-ui-select-container" id="systemSubTypeContainer">
                                </ul>
                                </span>
                            </div>
                            <!-- 操作系统子项 window与linux子项分别渲染-->
                            <ul class="hide" id="windowSubItems">
<li class="item selected first" data-value="">请选择相关版本<i class="trangle-arrow pngFix"></i></li><li class="item" data-value="win_2008_64"><i class="icon-type windows"></i>Win2008 64位(预装php+sql2008等网站集成环境,3G或以上内存)[强烈推荐]<i class="icon-ver icon-64"></i></li><li class="item" data-value="win_2008"><i class="icon-type windows"></i>Win2008 64位(纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="win2008_en_clean"><i class="icon-type windows"></i>Win2008 64位(英文纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="win_2012_mssql2012"><i class="icon-type windows"></i>win2012 64位(预装sqlserver2012)<i class="icon-ver icon-64"></i></li><li class="item" data-value="win_2012_clean"><i class="icon-type windows"></i>Win2012 64位(纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="win"><i class="icon-type windows"></i>Win2003 32位(预装sqlserver2000及常用软件)[官方停止安全更新,不推荐]<i class="icon-ver icon-32"></i></li><li class="item" data-value="win_2005"><i class="icon-type windows"></i>Win2003 32位(预装sqlserver2005及常用软件)[官方停止安全更新,不推荐]<i class="icon-ver icon-32"></i></li><li class="item" data-value="win_clean"><i class="icon-type windows"></i>Win2003 32位(纯净版)[官方停止安全更新,不推荐]<i class="icon-ver icon-32"></i></li><li class="item" data-value="win_64"><i class="icon-type windows"></i>Win2003 64位(纯净版)[官方停止安全更新,不推荐]<i class="icon-ver icon-64"></i></li></ul>
<ul class="hide" id="linuxSubItems">
<li class="item selected first" data-value="">请选择相关版本<i class="trangle-arrow pngFix"></i></li><li class="item" data-value="linux_wd"><i class="icon-type linux"></i>Linux 32位(CentOS6.2,预装wd控制面板)<i class="icon-ver icon-32"></i></li><li class="item" data-value="linux_64"><i class="icon-type linux"></i>Linux 64位(CentOS6.2,预装wd控制面板)<i class="icon-ver icon-64"></i></li><li class="item" data-value="linux_6.4"><i class="icon-type linux"></i>Linux 64位(CentOS6.4,纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="linux_centos7"><i class="icon-type linux"></i>Linux 64位(CentOS7.0,纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="linux_debian64"><i class="icon-type linux"></i>Linux 64位(Debian 7.0 纯净版)<i class="icon-ver icon-64"></i></li><li class="item" data-value="linux_ubuntu"><i class="icon-type linux"></i>Linux 32位(ubuntu-14.04-server)<i class="icon-ver icon-32"></i></li><li class="item" data-value="linux_ubuntu_64"><i class="icon-type linux"></i>Linux 64位(ubuntu-14.04-server)<i class="icon-ver icon-64"></i></li></ul>
<ul class="hide" id="customSubItems">
<li class="item selected first" data-value="">请选择相关版本<i class="trangle-arrow pngFix"></i></li></ul>
                        </div>
                        <div style="position:absolute;margin-top:-35px;margin-left:113px;">
                                <a class="pos-r" href="javascript:void(0);">
                                    <span class="icon-question"></span>
                                    <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; z-index: 9999;">
                                        为了保证良好的性能体验，512M内存不提供windows操作系统
                                        <br />Sqlserver2000至少需要1G内存
                                        <br />Sqlserver2005至少需要2G内存
                                        <br />Sqlserver2008至少需要3G内存
                                        <br />Windows Server 2008 至少需要2G内存
                                        <br />Windows server2012至少需要3G内存
                                        <br />若您想要其他系统，可以开通成功后自己上传ISO文件安装！
                                        <i></i>
                                    </div>
                                </a>
                        </div>
                        <div style="position:absolute;margin-top:40px;margin-left:113px;z-index: 1000;">
                            <a class="pos-r" href="" target="_blank">
                                <span class="icon-question"></span>
                                <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; z-index: 100;">
                                    电信线路适合主要客户群分布在电信网络的客户。<br />如果需要互联互通，联通用户也要求访问较快请选择智能多线。<br>若需要美国、香港等机房，请选择套餐云服务器。<br>联通用户建议选择BGP线路。
                                    <i></i>
                                </div>
                            </a>
                        </div>
                        <div class="config-box cl" style="overflow:visible;">
                            <label class="f-l">线路：</label>
                            <div class="config-room" id="J_roomsContainerDom">
                                 <span class="link-btn active" data-desc="智能多线" data-value="37">智能多线 <span class="btn-desc">推荐,免费提供一个独立IP <a href="/services/cloudhost/server_room_cloud.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span><span class="link-btn " data-desc="华中BGP" data-value="42">华中BGP <span class="btn-desc">性价比高！BGP多线云服务器,独立IP <a href="/services/Server/servr_room_info_hzbgp.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span><span class="link-btn " data-desc="电信线路" data-value="38">电信线路 <span class="btn-desc">性价比高，免费提供一个独立IP <a href="/services/cloudhost/server_room_cloud.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span><span class="link-btn " data-desc="华北BGP" data-value="39">华北BGP <span class="btn-desc">独立IP，只接企业客户 <a href="/services/Server/servr_room_info_bjsy.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span><span class="link-btn " data-desc="华南BGP" data-value="40">华南BGP <span class="btn-desc">暂时缺货 <a href="/services/Server/servr_room_info_hnbgp.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span><span class="link-btn " data-desc="亚洲数据中心" data-value="36">亚洲数据中心 <span class="btn-desc">电信+香港双IP，免备案,独享IP二个 <a href="/services/Server/servr_room_info_aisa_ebs.asp" target="_blank">机房详情>></a></span><i class="btn-desc-arrow"></i></span>
                                 <div class="pos-r">
                                  <div class="low-config-tip hide" style="position:static;opacity:1;width:588px;" id="J_roomTipDesc">您本地是非电信方式上网，建议选择BGP机房，否则在上传和远程桌面连接时可能比较卡。</div>
                                  <div class="low-config-tip hide" style="position:static;opacity:1;z-index:999;background-image: none;color:#6a6a6a;padding-left:0;" id="J_roomDDOSTipDesc">
                                    <img src="/images2016/cloudhost/ddos_wall-2.png" alt="" class="mr-5 va-t">
                                    亿维云免费提供2Gbps的恶意流量攻击防护，超过还可选购DDoS高防服务。
                                    <a class="blue-link" href="/services/cloudhost/ddos.asp" target="_blank">了解更多&gt;&gt;
                                    </a>
                                    </div>
                                 </div>
                            </div>
                        </div>
                        <div class="config-box cl" id="J_diskTypeContainerDom">
                            <label>存储模式：</label>
                            <a class="link-btn active ml-15" href="javascript:void(0);" data-value="ebs">分布式集群存储</a>
                            <a class="link-btn" href="javascript:void(0);" data-value="ssd">SSD固态硬盘</a>
                        </div>
                         <div style="position:absolute;margin-top:-54px;margin-left:112px;"><a class="pos-r" href="" target="_blank">
                                   <span class="icon-question"></span>
                                       <div class="manager-tip" style=" top: 30px;left: -16px; width: 264px; z-index: 100;">
                     <strong>分布式存储:</strong><br />每份数据保留4份，安全性和稳定性更高，支持热迁移。适合对稳定性、安全性要求很高的应用。<br /><strong>SSD固态硬盘：</strong><br />采用Intel企业级高端SSD硬盘，形成Raid阵列，拥有极高的随机读写IOPS。价格较贵，适合对IO要求特别高的应用。
                                          <i></i>
                                       </div>
                              </a></div>

                        <div class="count-info">
                            <p class="title">购买量</p>
                            <div class="config-box cl" id="J_buyCountContainerDom">
                                <label>购买数量：</label>
                                <span class="count">
                                <a href="javascript:void(0);" class="link-btn cSubtract ">-</a>
                                <input type="text" value="1" class="number_input" id="J_buyCountDom">
                                <a href="javascript:void(0);" class="link-btn  cAdd">+</a>
                            </span>
                            </div>
  <div class="config-box cl" style="overflow: initial;">
                                <label>服务标准：</label>
                                <dl class="config-service cl" id="J_serviceTypeContainerDom">
                                    <dt data-value="亿维云基础服务">
                                        <div class="service-content">
                                            <p>基础服务</p>
                                            <div class="config-service-txt">免费</div>
                                            <div class="config-service-desc">服务器内部问题单项收费</div>
                                        </div>
                                    </dt>
                                    <dt class="active" data-value="亿维云铜牌服务">
                                        <div class="service-content">
                                            <p>铜牌服务</p>
                                            <div class="config-service-txt">30元/月</div>
                                            <div class="config-service-desc">提供标准技术支持</div>
                                        </div>
                                    </dt>
                                    <dt data-value="亿维云银牌服务">
                                        <div class="service-content">
                                            <p>银牌服务</p>
                                            <div class="config-service-txt">88元/月</div>
                                            <div class="config-service-desc">提供优先技术支持</div>
                                        </div>
                                    </dt>
                                    <dt style="border-right: none;" data-value="亿维云金牌服务">
                                        <div class="service-content">
                                            <p>金牌服务</p>
                                            <div class="config-service-txt">188元/月</div>
                                            <div class="config-service-desc">提供全方位技术支持</div>
                                        </div>
                                    </dt>
                                </dl>
                                <a class="blue-link" href="/services/Server/vip_vps.asp" target="_blank">《查看服务标准》</a>
                            </div>
                            <div class="config-box cl" style="overflow: visible;">
                                <label>购买时长：</label>
                                <dl class="config-time cl" id="J_renewTimeContainerDom">
                                    <dt data-value="1" data-desc="1个月" data-gift="" class="active">1个月
                                        <span class="btn-desc" style="min-width:138px;" id="J_firstMonthDesc">
                                         ...
                                         </span>
                                        <i class="btn-desc-arrow"></i></dt>
                                    <dt data-value="2" data-desc="3个月" data-gift="">3个月
                                    </dt>
                                    <dt data-value="3" class="gift" data-desc="6个月" data-gift="半个月">6个月
                                        <span class="btn-desc">
                                        赠送半月
                                         </span>
                                        <i class="btn-desc-arrow"></i>
                                    </dt>
                                    <dt data-value="4" class="gift" data-desc="1年" data-gift="2个月">1年<span class="btn-desc">
                                        赠送2月
                                         </span>
                                        <i class="btn-desc-arrow"></i></dt>
                                    <dt data-value="5" class="gift turn-back" data-desc="2年" data-gift="8个月">2年<span class="btn-desc">
                                        赠送8月
                                         </span>
                                        <i class="btn-desc-arrow"></i></dt>
                                    <dt data-value="6" class="gift turn-back" data-desc="3年" data-gift="15个月">3年<span class="btn-desc">
                                        赠送15月
                                         </span>
                                        <i class="btn-desc-arrow"></i></dt>
                                    <dt data-value="7" class="gift turn-back" style="border-right: none;" data-desc="5年" data-gift="30个月">5年<span class="btn-desc">
                                        赠送30月
                                         </span>
                                        <i class="btn-desc-arrow"></i></dt>
                                </dl>
                            </div>

                            <div class="tip-warn">
                               <div class="tip-inner" id="J_tipInner">
                                <a class="expand " style="background-color:#fbfeff" href="javascript:void(0);">更多&gt;&gt;</a>
                                 <i class="tw-icon"></i>
                                说明：我司所有国内主机客户都采用白名单措施，每个国内IP默认支持60个域名（增加20元/个），主机开通后需要在管理中心提交白名单，务必保证已经通过备案的域名才可以访问。严禁一切私服、外挂、色情、传播病毒等非法网站，严禁利用服务器资源进行流量穿透、扫描肉机、架设私服、翻墙破网类等非法应用,对于成人用品、伟哥类、空包网站、丰胸减肥、性用品、刷钻刷信誉、医疗网站等高风险容易受攻击的网站，只允许购买电信线路并需要开通360网站卫士或百度云加速进行安全防护。<span style="color: #f60000;">我司有严格的监控措施，一经发现违规网站/非法应用，立即永久关闭，不退余款。</span>可能受攻击的网站请在控制面板中开启“360网站卫士”安全防护！
                                非CPU密集型线路节点，不能用于比特币计算、网格计算等长时间CPU100%占用等高CPU应用，否则会被系统自动关闭或对CPU频率进行限制！
                                <a class="expand expanded hide" style="background-color:#fbfeff" href="javascript:void(0);">收起&gt;&gt;</a>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 购买表单数据提交 -->
                <form action="/services/cloudhost/Default.asp" method="post" id="J_buyOrTryForm" class="hide"></form>
                <!-- 弹性云主机 结束 -->
                <!-- 套餐云主机 开始 -->
                <div class="tc-host wjf-ui-tab-content " id="J_tcHostDom">
                    <ul class="taocan-list cl horizontal-center" id="J_taocanListDom">
                        <!-- 套餐A -->
                        <li class="taocan-item border-bottom border-right">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudA">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="2GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="200G SAS硬盘+200G SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="创业型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudA_vr_roomDom">
                                <div class="column-top">
                                    <p>创业型云服务器<em class="icon hot">热销</em></p>
                                    <span>适用于企业官方网站/个人站长</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(四核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>2GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>200G SAS硬盘+200G SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudA_flux">3M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudA_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudA_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudA_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span> 四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudA_container">
                                    <div class="ppl" id="vpsromprice_xcloudA_1"><span><span class="price">253</span>元首月,</span><span><span class="price">920</span>元/季,</span><span><span class="price">1680</span>元/半年,</span><span><span class="price">2980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudA_2"><span><span class="price">304</span>元首月,</span><span><span class="price">1080</span>元/季,</span><span><span class="price">1980</span>元/半年,</span><span><span class="price">3580</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudA_3"><span><span class="price">389</span>元首月,</span><span><span class="price">1380</span>元/季,</span><span><span class="price">2680</span>元/半年,</span><span><span class="price">4580</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudA_4"><span><span class="price">338</span>元首月,</span><span><span class="price">1200</span>元/季,</span><span><span class="price">2350</span>元/半年,</span><span><span class="price">3980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudA_5"><span><span class="price">474</span>元首月,</span><span><span class="price">1600</span>元/季,</span><span><span class="price">3060</span>元/半年,</span><span><span class="price">5580</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudA_6"><span><span class="price">423</span>元首月,</span><span><span class="price">1490</span>元/季,</span><span><span class="price">2800</span>元/半年,</span><span><span class="price">4980</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                        <!-- 套餐B -->
                        <li class="taocan-item border-bottom border-right">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudB">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="3GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="300G SAS硬盘+300G SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="发展型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudB_vr_roomDom">
                                <div class="column-top">
                                    <p>发展型云服务器</p>
                                    <span>适用于地方/行业门户网站</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(四核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>3GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>300G SAS硬盘+300G SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudB_flux">5M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudB_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudB_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudB_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span>四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudB_container">
                                    <div class="ppl" id="vpsromprice_xcloudB_1"><span><span class="price">287</span>元首月,</span><span><span class="price">998</span>元/季,</span><span><span class="price">1999</span>元/半年,</span><span><span class="price">3380</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudB_2"><span><span class="price">338</span>元首月,</span><span><span class="price">1200</span>元/季,</span><span><span class="price">2380</span>元/半年,</span><span><span class="price">3980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudB_3"><span><span class="price">466</span>元首月,</span><span><span class="price">1580</span>元/季,</span><span><span class="price">2980</span>元/半年,</span><span><span class="price">5480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudB_4"><span><span class="price">389</span>元首月,</span><span><span class="price">1300</span>元/季,</span><span><span class="price">2600</span>元/半年,</span><span><span class="price">4580</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudB_5"><span><span class="price">508</span>元首月,</span><span><span class="price">1790</span>元/季,</span><span><span class="price">3380</span>元/半年,</span><span><span class="price">5980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudB_6"><span><span class="price">508</span>元首月,</span><span><span class="price">1790</span>元/季,</span><span><span class="price">3480</span>元/半年,</span><span><span class="price">5980</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                        <!-- 套餐C -->
                        <li class="taocan-item border-bottom">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudC">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="4GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="500G SAS硬盘+500G SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="舒适型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudC_vr_roomDom">
                                <div class="column-top">
                                    <p>舒适型云服务器<em class="icon recommend">推荐</em></p>
                                    <span>适用于网上商城、团购网站等</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(四核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>4GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>500G SAS硬盘+500G SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudC_flux">5M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudC_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudC_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudC_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span>四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudC_container">
                                    <div class="ppl" id="vpsromprice_xcloudC_1"><span><span class="price">321</span>元首月,</span><span><span class="price">1130</span>元/季,</span><span><span class="price">2180</span>元/半年,</span><span><span class="price">3780</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudC_2"><span><span class="price">381</span>元首月,</span><span><span class="price">1340</span>元/季,</span><span><span class="price">2580</span>元/半年,</span><span><span class="price">4480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudC_3"><span><span class="price">559</span>元首月,</span><span><span class="price">1980</span>元/季,</span><span><span class="price">3800</span>元/半年,</span><span><span class="price">6580</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudC_4"><span><span class="price">423</span>元首月,</span><span><span class="price">1490</span>元/季,</span><span><span class="price">2800</span>元/半年,</span><span><span class="price">4980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudC_5"><span><span class="price">568</span>元首月,</span><span><span class="price">1990</span>元/季,</span><span><span class="price">3880</span>元/半年,</span><span><span class="price">6680</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudC_6"><span><span class="price">578</span>元首月,</span><span><span class="price">2040</span>元/季,</span><span><span class="price">3900</span>元/半年,</span><span><span class="price">6800</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                        <!-- 套餐D -->
                        <li class="taocan-item border-right">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudD">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="6GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="800G SAS硬盘+800G SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="增强型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudD_vr_roomDom">
                                <div class="column-top">
                                    <p>增强型云服务器</p>
                                    <span>适用于社区SNS/论坛/ERP/OACRM等</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(四核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>6GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>800G SAS硬盘+800G SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudD_flux">5M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudD_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudD_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudD_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span>四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudD_container">
                                    <div class="ppl" id="vpsromprice_xcloudD_1"><span><span class="price">541</span>元首月,</span><span><span class="price">1870</span>元/季,</span><span><span class="price">3650</span>元/半年,</span><span><span class="price">6360</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudD_2"><span><span class="price">636</span>元首月,</span><span><span class="price">2200</span>元/季,</span><span><span class="price">4300</span>元/半年,</span><span><span class="price">7480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudD_3"><span><span class="price">848</span>元首月,</span><span><span class="price">2980</span>元/季,</span><span><span class="price">5680</span>元/半年,</span><span><span class="price">9980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudD_4"><span><span class="price">748</span>元首月,</span><span><span class="price">2700</span>元/季,</span><span><span class="price">4980</span>元/半年,</span><span><span class="price">8800</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudD_5"><span><span class="price">848</span>元首月,</span><span><span class="price">2980</span>元/季,</span><span><span class="price">5680</span>元/半年,</span><span><span class="price">9980</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudD_6"><span><span class="price">833</span>元首月,</span><span><span class="price">2940</span>元/季,</span><span><span class="price">5780</span>元/半年,</span><span><span class="price">9800</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                        <!-- 套餐E -->
                        <li class="taocan-item border-right">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudE">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="8GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="1T SAS硬盘+1T SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="企业型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudE_vr_roomDom">
                                <div class="column-top">
                                    <p>企业型云服务器</p>
                                    <span>适用于网络游戏，其它高端应用等</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(四核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>8GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>1T SAS硬盘+1T SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudE_flux">5M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudE_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudE_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudE_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span>四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudE_container">
                                    <div class="ppl" id="vpsromprice_xcloudE_1"><span><span class="price">636</span>元首月,</span><span><span class="price">2210</span>元/季,</span><span><span class="price">4230</span>元/半年,</span><span><span class="price">7480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudE_2"><span><span class="price">748</span>元首月,</span><span><span class="price">2600</span>元/季,</span><span><span class="price">4980</span>元/半年,</span><span><span class="price">8800</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudE_3"><span><span class="price">1088</span>元首月,</span><span><span class="price">3840</span>元/季,</span><span><span class="price">7600</span>元/半年,</span><span><span class="price">12800</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudE_4"><span><span class="price">935</span>元首月,</span><span><span class="price">3300</span>元/季,</span><span><span class="price">6280</span>元/半年,</span><span><span class="price">11000</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudE_5"><span><span class="price">1088</span>元首月,</span><span><span class="price">3840</span>元/季,</span><span><span class="price">7600</span>元/半年,</span><span><span class="price">12800</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudE_6"><span><span class="price">1088</span>元首月,</span><span><span class="price">3840</span>元/季,</span><span><span class="price">7600</span>元/半年,</span><span><span class="price">12800</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                        <!-- 套餐F -->
                        <li class="taocan-item">
                            <form class="column" action="/services/cloudhost/Order.asp">
                                <input type="hidden" data-xxxx='1' name="productid" value="xcloudF">
                                <input type="hidden" data-xxxx='1' name="CPU" value="IntelXeon E5-2620/5645*4 (四核心)">
                                <input type="hidden" data-xxxx='1' name="Memory" value="1.5GB">
                                <input type="hidden" data-xxxx='1' name="HardDisk" value="150G SAS硬盘+150G SATA(智能备份)">
                                <input type="hidden" data-xxxx='1' name="HostID" value="普及型云服务器">
                                <input type="hidden" data-xxxx='1' name="vps" value="okay">
                                <input type="hidden" data-xxxx='1' name="vr_room" value="8" id="J_xcloudF_vr_roomDom">
                                <div class="column-top">
                                    <p>普及型云服务器</p>
                                    <span>适用于中小企业展示型网站</span>
                                </div>
                                <dl class="column-config cl">
                                    <dt>处理器:</dt>
                                    <dd>IntelXeon E5-2620/5645*4<span>(双核心)</span></dd>
                                    <dt>内存:</dt>
                                    <dd>1.5GB</dd>
                                    <dt>硬盘:</dt>
                                    <dd>150G SAS硬盘+150G SATA<span>(智能备份)</span></dd>
                                    <dt>带宽:</dt>
                                    <dd id="radio_xcloudF_flux">5M独享</dd>
                                    <dt>IP:</dt>
                                    <dd id="radio_xcloudF_IP">独享IP一个</dd>
                                </dl>
                                <div class="column-txt">默认根据销量高低和推荐级别排序</div>
                                <div class="server-room">
                                    <span class="wjf-ui-select" id="J_xcloudF_roomsDom"></span>
                                    <ul class="wjf-ui-select-container" id="J_xcloudF_containerDom">
                                        <li class="item selected first-item" data-index="1" data-value="8">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_cdtt.asp">机房详情</a></span>四川双线机房(推荐)
                                        </li>
                                        <li class="item" data-index="2" data-value="1">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_mydx.asp">机房详情</a></span>国内电信机房(高带宽)(无库存)</li>
                                        <li class="item" data-index="3" data-value="3">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_bjsy.asp">机房详情</a></span>北京BGP多线机房(智能BGP)</li>
                                        <li class="item" data-index="5" data-value="26">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_lsj.asp">机房详情</a></span>美国机房(免备案)</li>
                                        <li class="item" data-index="6" data-value="20">
                                            <span>---->><a target="blank" href="/services/Server/servr_room_info_xg.asp">机房详情</a></span>香港机房(免备案)</li>
                                    </ul>
                                </div>
                                <div class="column-price" id="J_vpsromprice_xcloudF_container">
                                    <div class="ppl" id="vpsromprice_xcloudF_1"><span><span class="price">211</span>元首月,</span><span><span class="price">760</span>元/季,</span><span><span class="price">1430</span>元/半年,</span><span><span class="price">2480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudF_2"><span><span class="price">254</span>元首月,</span><span><span class="price">897</span>元/季,</span><span><span class="price">1680</span>元/半年,</span><span><span class="price">2990</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudF_3"><span><span class="price">322</span>元首月,</span><span><span class="price">1137</span>元/季,</span><span><span class="price">2050</span>元/半年,</span><span><span class="price">3790</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudF_4"><span><span class="price">296</span>元首月,</span><span><span class="price">1040</span>元/季,</span><span><span class="price">1980</span>元/半年,</span><span><span class="price">3480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudF_5"><span><span class="price">381</span>元首月,</span><span><span class="price">1340</span>元/季,</span><span><span class="price">2480</span>元/半年,</span><span><span class="price">4480</span>元/年</span>
                                    </div>
                                    <div class="ppl" style="display:none;" id="vpsromprice_xcloudF_6"><span><span class="price">381</span>元首月,</span><span><span class="price">1340</span>元/季,</span><span><span class="price">2480</span>元/半年,</span><span><span class="price">4480</span>元/年</span>
                                    </div>
                                </div>
                                <div class="column-bottom">
                                    <button type="submit" class="column-btn">立即购买</button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
                <!--  <script id="tryTipTpl" type="text/x-jsrender"> -->
                <div id="tryTipTpl" class="hide">
                    <ol style="list-style-type: decimal;margin-left: 17px;">
                        <li>需要先通过邮箱和手机认证，若提供虚假信息，将不支持试用。</li>
                        <li>为防止滥用，<span class="try-tip-warn">试用需收费{{:paytestprice}}元</span></li>
                        <li>企业用户，可以申请免费试用的优惠，申请方法：将您注册的用户名，以及公司营业执照扫描件发到 infosec@west263.com，我们将在1个工作日内审核并回复您。</li>
                        <li>每位用户每天仅限试用一次，最多允许试用5次。</li>
                        <li><span class="try-tip-warn">试用期时间为6小时，6小时后自动删除</span>，转正前请勿放置正式数据。</li>
                        <li>试用主机仅做功能测试和速度测试用，不支持提交白名单。禁止用于攻击、刷排名、挂机、刷币等非法用途！</li>
                    </ol>
                </div>
                <!--  </script> -->
                <!-- 套餐云主机 结束 -->
            </div>
            </div>
    </div>
    <!-- 弹性云主机+套餐云主机 结束 -->
    </div>
<!-- 用户评价 模板 -->
<script id="pingjiaListTpl" type="text/x-jsrender">
    <div class="pingjia-top">
        <div class="rate">
            <p class="font18">总评</p>
            <i class="rate-icon"></i>
        </div>
        <div class="percent">
            <dl>
                <dt>访问速度 :</dt>
                <dd>
                    <div class="fill" style="width:{{:header.speedStarCount*100/5}}%;"></div>
                    <span>{{:header.speedStarCount}}</span></dd>
            </dl>
            <dl>
                <dt>性价比 :</dt>
                <dd>
                    <div class="fill" style="width:{{:header.priceStarCount*100/5}}%;"></div>
                    <span>{{:header.priceStarCount}}</span></dd>
            </dl>
            <dl>
                <dt>服务质量 :</dt>
                <dd>
                    <div class="fill" style="width:{{:header.serviceStarCount*100/5}}%;"></div>
                    <span>{{:header.serviceStarCount}}</span></dd>
            </dl>
            <dl>
                <dt>产品与描述相符 :</dt>
                <dd>
                    <div class="fill" style="width:{{:header.descStarCount*100/5}}%;"></div>
                    <span>{{:header.descStarCount}}</span></dd>
            </dl>
        </div>
    </div>
    {{for rows}}
    <div class="pingjia-list">
        <div class="pj-title">
            用户点评产品与客服 :
            <label>{{:#data.pjTitle}}</label>
        </div>
        <div class="pj-middle cl">
            <div class="user-icon">
                <p>{{:#data.username}}</p>
                <p>地区 : <span>{{if #data.area}}{{:#data.area}}{{else}}未知{{/if}}</span></p>
            </div>
            <div class="pj-middle-right">
                <dl>
                    <dt>访问速度 :</dt>
                    <dd>
                        <div class="yellow-star yellow-star-{{:#data.speedStarCount}}"></div>
                    </dd>
                </dl>
                <dl>
                    <dt>性价比 :</dt>
                    <dd>
                        <div class="yellow-star yellow-star-{{:#data.priceStarCount}}"></div>
                    </dd>
                </dl>
                <dl>
                    <dt>服务质量 :</dt>
                    <dd>
                        <div class="yellow-star yellow-star-{{:#data.serviceStarCount}}"></div>
                    </dd>
                </dl>
                <dl>
                    <dt>产品与描述相符 :</dt>
                    <dd>
                        <div class="yellow-star yellow-star-{{:#data.descStarCount}}"></div>
                    </dd>
                </dl>
            </div>
            <div class="pj-txt">
                <p>
                    <span class="orange font14"><b>[使用心得]</b></span>{{:#data.pjContent}}
                </p>
                <p class="pj-time">时间 : {{:#data.pjDate}}</p>
            </div>
        </div>
    </div>
    {{/for}}
</script>
<!-- 临时使用 用于客户评价 -->
<div id="J_customPJTemp" class="hide">
</div>
<!-- 内容区域 结束 -->
<!-- 公共JS -->
<script type="text/javascript" src="js2016/lib/wjf/js/wjf-1.0.0.js"></script>
<script type="text/javascript" src="js2016/lib/jqurey.tools/jquery.tools.rangeinput.min.js"></script>
<script type="text/javascript" src="js2016/lib/jsrender/jsrender.min.js"></script>
<script type="text/javascript" src="js2016/lib/layer/layer.js"></script>
<script type="text/javascript" src="js2016/lib/laypage/laypage.min.js"></script>

<script>
/**
 * Created by westyuangong on 2016/7/8.
 */
function seetitle(txt) {
    var   evt=evt||window.event;
    var x=0,y=0;
    //如果事件对象有pageX属性,对应firefox,opera,chrome,safari浏览器
    if(evt.pageX){
        x=evt.pageX;
        y=evt.pageY;
    }
    //如果对象有clientX属性,对应IE浏览器
    else if(evt.clientX){
        var offsetX=0,offsetY=0;
        //IE6及其以上版本
        if(document.documentElement.scrollLeft){
            offsetX=document.documentElement.scrollLeft;
            offsetY=document.documentElement.scrollTop;
        }
        //IE较旧的版本
        else if(document.body){
            offsetX=document.body.scrollLeft;
            offsetY=document.body.scrollTop;
        }
        x=evt.clientX+offsetX;
        y=evt.clientY+offsetY;
    }
    x=x+20;
    var oDiv=$("#texthelp")
    oDiv.html('<div>'+txt+'</div>');
    var y2=oDiv.height()/2-20;
    var y3=y2+2;
    y=y-y2
    oDiv.css("left",x+'px')  // 指定创建的DIV在文档中距离左侧的位置
    oDiv.css("top",y+'px');  // 指定创建的DIV在文档中距离顶部的位置
    oDiv.show();
    css('#texthelp:after{border-width: 8px;border-right-color: #fff;top: '+y3+'px;}');
    css('#texthelp:before{border-width: 10px;border-right-color: #ddd;top: '+y2+'px;}');
    return false;
}
function closetitlebox() {
    $("#texthelp").hide();
    $("#texthelp").html("")
}
var css=function(t,s){
    s=document.createElement('style');
    s.innerText=t;
    document.body.appendChild(s);
};
</script>
<script type="text/javascript" src="js2016/cloudhost/cloudhost2016.js"></script>
		<div class="w1200 server_div2">
        	<h2 class="h_tith">亿维云网解决方案</h2>
        	<p class="p_tith">专业技术为您搭建网站环</p>
        	<div class="blank20"></div>
			<div class="ser_fl ser_div">
				<h2>亿维云网网站环境搭建与系统加固</h2>
				<p>专业技术为您搭建网站环境，免除您安装环境的繁琐和困扰。<br> 
					支持热门语言和操作系统 支持热门语言和操作系统系统调优和加固 系统调优和加固<br> 
					适用系统环境：Windows/Linux <br> 
					可选择支持asp、asp.net、php、jsp、sql server、mysql等<br> 
				</p>
				<p><span>Windows： ¥100元/1次 </span><br><span>Linux： ¥100元/1</span></p>
				<div class="div1"><a href="">立即购买</a></div>
			</div>
			<div class="ser_fr ser_div">
				<h2>亿维云网网站环境搭建一条龙服务</h2>
				<p>专业技术为您搭建网站环境，免除您安装环境的繁琐和困扰。<br>
					支持热门语言和操作系统 支持热门语言和操作系统<br>
					系统调优和加固 系统调优和加固<br>
					适用系统环境：Windows/Linux 适用系统环境：Windows/Linux<br>
					可选择支持asp、asp.net、php、jsp、sql server、mysql等<br>
					网站数据的导入、数据库数据的导入 网站数据的导入、数据库数据的导入<br>
					网站程序调试 网站程序调试</p>
				<p><span>Windows： ¥100元/1次  立即购买</span><br><span>Linux： ¥100元/1</span></p>
				<div class="div1"><a href="">立即购买</a></div>
			</div>
        	<div class="clear"></div>
        </div>

	</div>

<!-- 页面通用滚动插件 -->
<script type="text/javascript" src="js2016/lib/jquery.SuperSlide/jquery.SuperSlide.2.1.1.x.js"></script>
<script type="text/javascript" src="js2016/root/jqinclude.js"></script>
<script type="text/javascript" src="jscripts/config/config.js"></script>

<script type="text/javascript">
function dynamicLoadScript(url) {
	var script = document.createElement("script");
	script.type = "text/javascript";
	script.async = true;
	script.src = url;
	document.getElementsByTagName("head")[0].appendChild(script);
}
// 临时隐藏
// G_SHOW_RIGHT_BAR=false;
// 导航、侧边栏代码
dynamicLoadScript('/js2016/common/menu.js?ver=20170117');
// 页面导航顶部Login js初始化
dynamicLoadScript('/js2016/topjs.asp');
</script>
	<?php require_once('bottom.php'); ?>
</body>
</html>