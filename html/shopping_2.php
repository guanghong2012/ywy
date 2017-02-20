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
	<link href="css/selectpick/cui.css" rel="stylesheet" type="text/css"><!-- 2.2 selectpick美化下拉框插件 -->
	<SCRIPT>
		function show(c_Str)
		{
		if(document.all(c_Str).style.display=='none')
		{document.all(c_Str).style.display='block'}
		else{document.all(c_Str).style.display='none'}
		}
	</SCRIPT>
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="shopping_div">
		<div class="w1200">
			<div class="shop_div1" style="background:url(images/b4_2.png) no-repeat right center">
				<h2>结算</h2>
				<div class="clear"></div>
			</div>
			<div class="shop_div7">
				<h2><img src="images/g4.png" alt="">余额支付</h2>
				<div class="div1">
					<h1>订单金额：<span>240.00 元</span></h1>
					<p>【账户余额：1234.00元】-240元</p>
				</div>
			</div>
			<div class="shop_div6">
				<a class="a2" href="">确定支付</a>
				<a class="a1" href="shopping_1.php">上一步</a>
			</div>
		</div>
	</div>
	<div class="blank50"></div>
	<?php require_once('bottom.php'); ?>
</body>
</html>