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
	<link href="css/style2.css" rel="stylesheet" type="text/css" /><!-- 表单美化 -->
	<link href="css/default/style.css" rel="stylesheet" /><!-- 右边滚动 -->
	<link rel="stylesheet" type="text/css" href="css/default/default.css"><!-- 右边滚动 -->
	<script src="js/stickySidebar.js"></script>
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="virtual_lx_div">
		<div class="w1200 mbs_div">
			<ul>
				<li><a href="index.php">首页</a></li>
				<li>></li>
				<li><a href="virtual.php">虚拟主机</a></li>
				<li>></li>
				<li><a href="virtual_lx.php">基础型空间</a></li>
				<li>></li>
				<li class="li1">基础型空间 - 飓风2（S）</li>
			</ul>
			<div class="clear"></div>
		</div>
		<main class="clearfix">
			<div class="w1200 virgm_div">

				<div class="vir_w870 fl main_content" id="content">
					<h1><i></i>基础型空间 - 飓风2（S）<span><em>*</em> 为必填项</span></h1>
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="vir_ta">
					  <tr>
					    <td class="td1" valign="top">选择购买时限：</td>
					    <td colspan="3" class="td2">
						    <ul>
						    	<li><a class="a1" href="">240.00元 / 1年</a></li>
						    	<li><a href="">240.00元 / 2年</a></li>
						    	<li><a href="">240.00元 / 3年</a></li>
						    	<li><a href="">240.00元 / 4年</a></li>
						    	<li><a href="">240.00元 / 5年</a></li>
						    	<li><a href="">240.00元 / 6年</a></li>
						    	<li><a href="">240.00元 / 7年</a></li>
						    	<li><a href="">240.00元 / 8年</a></li>
						    	<li><a href="">240.00元 / 9年</a></li>
						    	<li><a href="">240.00元 / 10年</a></li>
						    </ul>
					    </td>
					  </tr>
					  <tr>
					    <td class="td1" valign="top"><em>*</em> 绑定域名：</td>
					    <td colspan="3" class="td3">
							<input type="text" class="inp_1">
							<p>请不要加'www'前缀, 我们在建站时会自动为您绑定www子域名</p>
					    </td>
					  </tr>
					  <tr>
					    <td class="td1" valign="top"><em>*</em> 主机类型：</td>
					    <td colspan="3" class="td4">
							<ul>
								<li><a class="a1" href="">PHP5主机</a></li>
								<li><a href="">ASP主机</a></li>
							</ul>
					    </td>
					  </tr>
					  <tr>
					    <td class="td1" valign="top"><em>*</em> 线路：</td>
					    <td colspan="3" class="td5"><input type="checkbox" id="checkbox-1-1" class="regular-checkbox" checked/><label class="label_1" for="checkbox-1-1"></label>独立双线</td>
					  </tr>
					  <tr>
					    <td class="td1" valign="top">管理账号：</td>
					    <td class="td5" width="35%">webmaster@yourdomain</td>
					    <td class="td1" valign="top">管理密码：</td>
					    <td class="td5">系统自动生成</td>
					  </tr>
					</table>
				</div>
				<div class="virgm_poa">
					<aside id="sidebar">
						<div class="vir_w300">
							<h1>已选配置</h1>
			                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="vir_ta1">
							  <tr>
							    <td class="td1">产品名称：</td>
							    <td><p>飓风2（S）</p></td>
							  </tr>
							  <tr>
							    <td class="td1">绑定域名：</td>
							    <td><p>www.baidu.com</p></td>
							  </tr>
							  <tr>
							    <td class="td1">主机类型：</td>
							    <td><p>PHP5</p></td>
							  </tr>
							  <tr>
							    <td class="td1">线路：</td>
							    <td><p>独立双线</p></td>
							  </tr>
							  <tr>
							    <td class="td1">购买年限：</td>
							    <td><p>6（年）</p></td>
							  </tr>
							  <tr>
							    <td class="td1 td_pa">费用总计：</td>
							    <td class="td_pa "><h4>￥1,440.00</h4></td>
							  </tr>
							</table>
							<p class="p1">
							<input type="checkbox" id="checkbox-2-1" class="regular-checkbox" checked/><label class="label_1" for="checkbox-2-1"></label>
							我已阅读并接受  <a href="">购买协议</a>
							</p>
							<div class="div_a">
								<a href="">确定购买</a>
							</div>
						</div>
					</aside>
				</div>
				<div class="clear"></div>
			</div>
		</main>
	</div>
		<script>
			$(document).ready(function() {
		
				$('#sidebar').stickySidebar({
					sidebarTopMargin: 20,
					footerThreshold: 60
				});
			
			});
		</script>

	<?php require_once('bottom.php'); ?>
</body>
</html>