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
				<li><a href="name_xz.php">选择域名</a></li>
				<li>></li>
				<li class="li1">填写域名信息</li>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="w1200 nametx_div">
			<h1><span>域名：<em>baga123.top</em></span><span>注册人：<em>千佰特</em></span><span class="span1"><i>*</i>为必填项</span></h1>
			<div class="namexx_div">
				<div class="div1">
					组织或单位（中文） <i>*</i>
				</div>
				<input type="text" class="input_ty input_1">
				<div class="div1">
					组织或单位（英文） <i>*</i>
				</div>
				<input type="text" class="input_ty input_1">
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					姓名（中文） <i>*</i>
				</div>
				<input type="text" class="input_ty">
				<div class="div1">
					姓名（英文） <i>*</i>
				</div>
				<input type="text" class="input_ty">
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					所在地 <i>*</i>
				</div>
				<select name="" class="inse_xl">
                	<option>国家</option>
                	<option>中国</option>
                	<option>日本</option>
                	<option>美国</option>
                </select>
				<select name="" class="inse_xl">
                	<option>省份</option>
                	<option>广东省</option>
                	<option>湖南省</option>
                	<option>四川省</option>
                </select>
                <select name="" class="inse_xl">
                	<option>城市</option>
                	<option>广州市</option>
                	<option>深圳市</option>
                	<option>揭阳市</option>
                </select>
				<div class="div1">
					邮政编码 <i>*</i>
				</div>
				<input type="text" class="input_ty">
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					邮箱地址 <i>*</i>
				</div>
				<input type="text" class="input_ty input_1">				
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					街道（中文） <i>*</i>
				</div>
				<input type="text" class="input_ty input_2">				
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					街道（英文） <i>*</i>
				</div>
				<input type="text" class="input_ty input_2">				
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					电话/手机 <i>*</i>
				</div>
				<div class="div2">
					<input type="text" class="input_ty input_1">
					<div class="clear"></div>
					<p>（如: +86.13531512345或+86.020-88649000-分机号(分机号可选, 不能为0）</p>
				</div>												
				<div class="clear"></div>
			</div>
			<div class="namexx_div">
				<div class="div1">
					传真 <i>*</i>
				</div>
				<div class="div2">
					<input type="text" class="input_ty input_1">
					<div class="clear"></div>
					<p>（格式是+86.020-88881234或+86.13570476481（小数点后面的数字长度为大于等于7，小于等于12）</p>
				</div>				
				<div class="clear"></div>
			</div>
			<div class="namexx_div1">
				<ul>
					<li>
						<input name="radio-1-set" id="checkbox-1-2" class="regular-checkbox" type="radio">
						<label class="label_1" for="checkbox-1-2"></label>
						<span>管理联系人信息与注册联系人一致</span>
					</li>
					<li>
						<input name="radio-1-set" id="checkbox-1-3" class="regular-checkbox" type="radio">
						<label class="label_1" for="checkbox-1-3"></label>
						<span>技术联系人与注册联系人一致</span>
					</li>
					<li>
						<input name="radio-1-set" id="checkbox-1-4" class="regular-checkbox" type="radio">
						<label class="label_1" for="checkbox-1-4"></label>
						<span>付费联系人与注册联系人一致</span>
					</li>
					<li class="li1"><a href="">确定购买</a></li>
					<li class="li2">
						<input id="checkbox-1-1" class="regular-checkbox" checked="" type="checkbox">
						<label class="label_1" for="checkbox-1-1"></label>
						<span>购买协议</span>
					</li>
				</ul>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<?php require_once('bottom.php'); ?>
</body>
</html>