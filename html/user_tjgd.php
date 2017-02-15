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
	<link href="css/upload-zy/zyUpload.css" rel="stylesheet"><!-- 9.0 Upload上传 -->
	<script src="js/upload-zy/zyFile.js"></script><!-- 9.0 Upload上传 -->
	<script src="js/upload-zy/zyUpload.js"></script><!-- 9.0 Upload上传 -->
	<script src="js/upload-zy/upload.js"></script><!-- 9.0 Upload上传 -->

</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="user_index">
		<div class="w1200">
			<?php require_once('user_daoh.php'); ?>
			<div class="user_fr_bank user_fr_bank_1">
				<h2>提交工单</h2>
				<div class="div_bank">
					<div class="user_div">
	                    <form action="" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="user_tjgd_ta">
							  <tr>
							    <td class="td1">工单标题：</td>
							    <td><input name="" type="text" class="tjgd_inp"></td>
							  </tr>
							  <tr>
							    <td class="td1" valign="top">问题描述：</td>
							    <td><textarea name="" cols="" rows="" class="tjgd_text"></textarea></td>
							  </tr>
							  <tr>
							    <td class="td1" valign="top">问题附件：</td>
							    <td><div id="demo" class="demo"></div></td>
							  </tr>
							  <tr>
							    <td>&nbsp;</td>
							    <td><input name="" type="submit" class="tjgd_button" value="提交工单"></td>
							  </tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	

	<?php require_once('bottom.php'); ?>
</body>
</html>