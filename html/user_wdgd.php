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
				<h2>我的工单</h2>
				<div class="div_bank">
					<div class="user_div">
						<div class="riq_ss fl">
							<input type="text" class="date_picker" placeholder="请选择时间段">
							<input type="text" class="date_picker" placeholder="请选择时间段">
						</div>
						<script type="text/javascript">
							$(function(){
								$('.date_picker').date_input();
								})
						</script>
						<div class="gjc_ss fl">
						  	<form action="" method="post">
	                        	<input name="" type="text" class="gjc_inp" placeholder="输入关键词搜索">
	                          	<input name="" type="submit" value="" class="gjc_anv">
	                        </form>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ymgl_ta">
					  <tr>
						    <th width="">工单编号</th>
						    <th width="">工单标题</th>
						    <th width="">提交时间</th>
						    <th width="">状态</th>
						    <th width="">操作</th>
					  </tr>
					  <tr>
							<td>GD170104458</td>
							<td>重启一下服务器</td>
							<td>2017-01-04</td>
							<td>处理中</td>
							<td><a href="user_gdxq.php">查看</a></td>
					  </tr>
					  <tr>
							<td>GD170103568</td>
							<td>域名转入怎么做？</td>
							<td>2017-01-04</td>
							<td>已解决</td>
							<td><a href="user_gdxq.php">查看</a></td>
					  </tr>
					  <tr>
							<td>GD170104458</td>
							<td>重启一下服务器</td>
							<td>2017-01-04</td>
							<td>处理中</td>
							<td><a href="user_gdxq.php">查看</a></td>
					  </tr>
					</table>
					<?php require_once('page.php'); ?>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- <div id="myModal" class="reveal-modal">
		<h1>www.qbt8.com</h1>
	  	<form action="" method="post">
        	<input name="" type="text" class="rev_inp" placeholder="请输入要修改的密码">
        	<input name="" type="submit" value="提交" class="rev_sub">
        </form>
		<a class="close-reveal-modal">&#215;</a>
	</div> -->

	<?php require_once('bottom.php'); ?>
</body>
</html>