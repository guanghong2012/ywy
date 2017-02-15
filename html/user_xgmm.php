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
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="user_index">
		<div class="w1200">
			<?php require_once('user_daoh.php'); ?>
			<div class="user_fr_bank user_fr_bank_1">
				<h2>修改密码</h2>
				<div class="div_bank">
					<form action="" method="get">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bank_ta">
						  <tr>
						    <td width="100" align="right">原密码：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入原密码"></td>
						  </tr>
						  <tr>
						    <td align="right">新密码：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入新密码"></td>
						  </tr>
						  <tr>
						    <td align="right">确认密码：</td>
						    <td><input type="text" class="bank_inp" placeholder="请再一次输入新密码"></td>
						  </tr>
						  <tr>
						    <td>&nbsp;</td>
						    <td><input name="" type="submit" value="提交" class="bank_sub"></td>
						  </tr>
						</table>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<?php require_once('bottom.php'); ?>
</body>
</html>