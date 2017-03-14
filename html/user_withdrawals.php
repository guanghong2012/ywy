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
				<h2>提 现</h2>
				<div class="div_bank">
                	<form action="" method="post">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="recharge_ta">
						  <tr>
							    <td class="td1">当前账户余额：</td>
							    <td class="td2"><span>1250.00 元</span></td>
						  </tr>
						  <tr>
							    <td class="td1">提现金额：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入金额" style="width:150px;" type="text"> <em>元</em></td>
						  </tr>
						  <tr>
							    <td class="td1">开户银行：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入开户银行" type="text"></td>
						  </tr>
						  <tr>
							    <td class="td1">开户人姓名：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入开户人姓名" type="text"></td>
						  </tr>
						  <tr>
							    <td class="td1">银行卡号：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入银行卡号" type="text"></td>
						  </tr>
						  <tr>
							    <td class="td1">开户支行：</td>
							    <td class="td2"><input class="bank_inp" placeholder="请输入开户支行" type="text"></td>
						  </tr>
						  <tr>
							    <td></td>
							    <td><input name="" value="提交" class="bank_sub" type="submit"></td>
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