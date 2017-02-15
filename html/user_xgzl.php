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
						    <td width="100" align="right">姓名：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入姓名"></td>
						  </tr>
						  <tr>
						    <td width="100" align="right">性别：</td>
						    <td>
						    	<label for=""><input type="radio" id="checkbox-1-1" class="regular-checkbox" name="radio-1-set"/><label for="checkbox-1-1"></label> 男</label>
						    	<label for=""><input type="radio" id="checkbox-1-2" class="regular-checkbox" name="radio-1-set"/><label for="checkbox-1-2"></label> 女</label>
						    </td>
						  </tr>
						  <tr>
						    <td align="right">邮箱：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入邮箱"></td>
						  </tr>
						  <tr>
						    <td align="right">手机：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入手机号码"></td>
						  </tr>
						  <tr>
						    <td align="right">QQ：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入QQ"></td>
						  </tr>
						  <tr>
						    <td align="right">居住地址：</td>
						    <td><input type="text" class="bank_inp" placeholder="请输入居住地址" style="width:500px;"></td>
						  </tr>
						  <tr>
						    <td>&nbsp;</td>
						    <td><input name="" type="submit" value="保存" class="bank_sub"></td>
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