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
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="sign_div">
		<div class="w1200 sign_div_1">
			<div class="sign_div_fl">
				<div class="sign_div_ewm">
					<img src="images/ewm_1.jpg" alt="">
					<p>扫一扫，关注亿维云网，随时随地获取产品最新资讯</p>
				</div>
			</div>
			<div class="sign_div_fr">
				<h2>亿维云网帐中心会员登录</h2>
                <form action="user_index.php" method="post">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sign_ta">
				  <tr>
				    <td width="120" class="td1"><i>*</i>登录名：</td>
				    <td><input type="text" class="sign_inp"></td>
				  </tr>
				  <tr>
				    <td class="td1"><i>*</i>登录密码：</td>
				    <td><input type="text" class="sign_inp"></td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				    <td>
					    <input type="text" class="sign_inp1">
					    <a class="sign_a1" href=""><img src="images/yzm1.jpg" alt=""></a>
				    </td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				    <td><input class="sign_submit1" name="" type="submit" value="登 录"></td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				    <td><a class="a_txt" href="">忘记密码？</a></td>
				  </tr>
				</table>
				</form>
			</div>	
			<div class="clear"></div>
		</div>
	</div>
	<?php require_once('bottom.php'); ?>
</body>
</html>