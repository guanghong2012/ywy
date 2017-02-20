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
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="virtual_lx_div">
		<div class="w1200 mbs_div">
			<ul>
				<li><a href="index.php">首页</a></li>
				<li>></li>
				<li><a href="name.php">域名注册</a></li>
				<li>></li>
				<li class="li1">选择域名</li>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="w1200 namexz_div">
			<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#fff" class="name_ta">
			  <tr>
			    <th width="350">域名</th>
			    <th width="350">域名状态</th>
			    <th>价格信息</th>
			  </tr>
			</table>
			<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#e5e5e5" class="name_ta1">
			  <tr>
			    <td bgcolor="#ffffff" width="350" class="td1">baga123.top</td>
			    <td bgcolor="#ffffff" width="350" class="td2">未注册</td>
			    <td bgcolor="#ffffff" class="td3">			
				    <div class="nice-select" name="nice-select">
						<input type="text" value="￥5元/1年" readonly>
						<ul>
							<li data-value="1">￥5元/1年</li>
							<li data-value="2">￥10元/3年</li>
							<li data-value="3">￥20元/5年</li>
							<li data-value="4">￥50元/12年</li>
						</ul>
					</div>
					<label for="" class="label_xz">
						<input id="checkbox-1-1" class="regular-checkbox" checked="" type="checkbox"><label class="label_1" for="checkbox-1-1"></label>
						选择此域名
					</label>		
				</td>
			  </tr>
			  <tr>
			    <td bgcolor="#ffffff" class="td1">baga123.com</td>
			    <td bgcolor="#ffffff" class="td2">未注册</td>
			    <td bgcolor="#ffffff" class="td3">
				    <div class="nice-select" name="nice-select">
						<input type="text" value="￥5元/1年" readonly>
						<ul>
							<li data-value="1">￥5元/1年</li>
							<li data-value="2">￥10元/3年</li>
							<li data-value="3">￥20元/5年</li>
							<li data-value="4">￥50元/12年</li>
						</ul>
					</div>
					<label for="" class="label_xz">
						<input id="checkbox-2-1" class="regular-checkbox" checked="" type="checkbox"><label class="label_1" for="checkbox-2-1"></label>
						选择此域名
					</label>		
			    </td>
			  </tr>
			  <tr>
			    <td bgcolor="#ffffff" class="td1">baga123.cn</td>
			    <td bgcolor="#ffffff" class="td2">未注册</td>
			    <td bgcolor="#ffffff" class="td3">
				    <div class="nice-select" name="nice-select">
						<input type="text" value="￥5元/1年" readonly>
						<ul>
							<li data-value="1">￥5元/1年</li>
							<li data-value="2">￥10元/3年</li>
							<li data-value="3">￥20元/5年</li>
							<li data-value="4">￥50元/12年</li>
						</ul>
					</div>
					<label for="" class="label_xz">
						<input id="checkbox-3-1" class="regular-checkbox" checked="" type="checkbox"><label class="label_1" for="checkbox-3-1"></label>
						选择此域名
					</label>		
			    </td>
			  </tr>
			  <tr>
			    <td bgcolor="#ffffff" class="td1">baga123.net</td>
			    <td bgcolor="#ffffff" class="td2">未注册</td>
			    <td bgcolor="#ffffff" class="td3">
				    <div class="nice-select" name="nice-select">
						<input type="text" value="￥5元/1年" readonly>
						<ul>
							<li data-value="1">￥5元/1年</li>
							<li data-value="2">￥10元/3年</li>
							<li data-value="3">￥20元/5年</li>
							<li data-value="4">￥50元/12年</li>
						</ul>
					</div>
					<label for="" class="label_xz">
						<input id="checkbox-4-1" class="regular-checkbox" checked="" type="checkbox"><label class="label_1" for="checkbox-4-1"></label>
						选择此域名
					</label>		
			    </td>
			  </tr>
			</table>
			<div class="yxz_div">
				<p>已选择域名：<span>【baga123.top】</span> <a href="name_tx.php">确定购买</a></p>
			</div>
	  </div>
	</div>
	<script>
		$('[name="nice-select"]').click(function(e){
		    $('[name="nice-select"]').find('ul').hide();
		    $(this).find('ul').show();
			e.stopPropagation();
		});
		$('[name="nice-select"] li').hover(function(e){
			$(this).toggleClass('on');
			e.stopPropagation();
		});
		$('[name="nice-select"] li').click(function(e){
			var val = $(this).text();
			$(this).parents('[name="nice-select"]').find('input').val(val);
			$('[name="nice-select"] ul').hide();
			e.stopPropagation();
		});
		$(document).click(function(){
			$('[name="nice-select"] ul').hide();
		});
	</script>
	<?php require_once('bottom.php'); ?>
</body>
</html>