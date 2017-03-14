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
  	<script src="css/sfq/js/index.js"></script><!-- 手风琴 -->
	<link href="css/sfq/css/font-awesome.min.css" rel="stylesheet"><!-- 手风琴 -->
    <link href="css/sfq/css/style.css" rel="stylesheet" media="screen" type="text/css" /><!-- 手风琴 -->
	<link href="css/style2.css" rel="stylesheet" type="text/css" /><!-- 表单美化 -->
	<link href="css/reveal/reveal.css" rel="stylesheet"><!-- 8.0 三种弹出效果 -->
	<script src="js/reveal/jquery.reveal.js"></script><!-- 8.0 三种弹出效果 -->
	<script type="text/javascript" src="js/jquery-rl.js"></script><!-- 日历 -->
	<script type="text/javascript" src="js/jquery.date_input.pack.js"></script> <!-- 日历 end --> 
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="user_index">
		<div class="w1200">
			<?php require_once('user_daoh.php'); ?> 
			<div class="user_fr_bank user_fr_bank_1">
				<h2>充 值</h2>
				<div class="div_bank">
                	<form action="" method="post">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="recharge_ta">
						  <tr>
							    <td class="td1">当前账户余额：</td>
							    <td class="td2"><span>1250.00 元</span></td>
						  </tr>
						  <tr>
							    <td class="td1">充值金额：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入金额" style="width:150px;" type="text"> <em>元</em></td>
						  </tr>
						  <tr>
							    <td class="td1">充值备注：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入备注" style="width:700px;" type="text"></td>
						  </tr>
						  <tr>
							    <td class="td1">充值方式：</td>
							    <td class="td2 zf_td">
							    	<a href="#" data-reveal-id="myModal" data-animation="none">
							    		<img src="images/zf_wx.png" alt="微信支付" title="微信支付">
							    		微信支付
							    	</a>
							    	<a href="#" data-reveal-id="myModal_zf" data-animation="none">
							    		<img src="images/zf_zfb.png" alt="支付宝支付" title="支付宝支付">
							    		支付宝支付
							    	</a>
							    	<a href="#" data-reveal-id="myModal_zf" data-animation="none">
							    		<img src="images/zf_yl.png" alt="银联支付" title="银联支付">
							    		银联支付
							    	</a>
							    </td>
						  </tr>
						  <!-- <tr>
							    <td></td>
							    <td><input name="" value="提交" class="bank_sub" type="submit"></td>
						  </tr> -->
						</table>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- 微信支付弹窗 -->
	<div id="myModal" class="reveal-modal wxzf_div">
		<img src="images/ewm.png" alt="">
		<p>扫描二维码进行微信支付</p>
		<a class="close-reveal-modal">&#215;</a>
	</div>
	<!-- 支付宝、银联弹窗 -->
	<div id="myModal_zf" class="reveal-modal zf_div">
		<h2>请您在新打开的网上银行页面进行支付，支付完成前请不要关闭该窗口。</h2>
		<div class="div1">
			<a class="a1 fl" href="">已完成支付</a>
			<a class="a2 fr" href="">更换支付方式</a>
			<div class="clear"></div>
		</div>
		<p><a href="">支付遇到问题？</a></p>
		<a class="close-reveal-modal">&#215;</a>
	</div>
	<?php require_once('bottom.php'); ?>
</body>
</html>