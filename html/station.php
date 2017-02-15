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
	<link href="css/selectpick/cui.css" rel="stylesheet" type="text/css"><!-- 2.2 selectpick美化下拉框插件 -->
</head>
<body>
	<?php require_once('top.php'); ?>
	<div class="ban_div"><a href=""><img src="images/a6.jpg" width="100%" alt=""></a></div>
	<div class="station_div">
		<div class="w1200">
			<ul>
				<li><a class="a1" href="station.php"><span class="span1">PC</span><i><img src="images/j5.png" alt=""></i></a></li>
				<li><a href=""><span class="span2">手机</span><i><img src="images/j5.png" alt=""></i></a></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<div class="station_div1">
		<div class="station_div1_1 w1200">
			<div class="nice-select" name="nice-select">
				<input type="text" value="模板类型" readonly>
				<ul>
					<li data-value="1">模板类型1</li>
					<li data-value="2">模板类型2</li>
					<li data-value="3">模板类型3</li>
					<li data-value="4">模板类型4</li>
				</ul>
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
			<div class="yans_div">
				<ul>
					<li class="li1">颜色</li>
					<li><a href=""><img src="images/y1.png" alt=""></a></li>
					<li><a href="" class="a1" style="background:#fe0000"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#ff6300"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#fae242"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#80d031"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#26e0d2"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#198ede"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#fe68ff"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#979797"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#000000"><i><img src="images/yes.png" alt=""></i></a></li>
					<li><a href="" class="" style="background:#990099"><i><img src="images/yes.png" alt=""></i></a></li>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="station_div1_2 w1220">
			<ul>
				<?php for($i=0;$i<4;$i++){?> 
				<li>
					<div class="div1">
						<img src="images/c1.jpg" alt="">
						<a href=""></a>
					</div>
					<div class="div2">
						<div class="div2_1">
							<p>模板ID: 7278</p>
							<p>模板价格: <span>¥180元</span></p>
						</div>
						<div class="div2_2">
							<a href="">购 买</a>
						</div>
					</div>
				</li>
				<li>
					<div class="div1">
						<img src="images/c2.jpg" alt="">
						<a href=""></a>
					</div>
					<div class="div2">
						<div class="div2_1">
							<p>模板ID: 7278</p>
							<p>模板价格: <span>¥180元</span></p>
						</div>
						<div class="div2_2">
							<a href="">购 买</a>
						</div>
					</div>
				</li>
				<li>
					<div class="div1">
						<img src="images/c3.jpg" alt="">
						<a href=""></a>
					</div>
					<div class="div2">
						<div class="div2_1">
							<p>模板ID: 7278</p>
							<p>模板价格: <span>¥180元</span></p>
						</div>
						<div class="div2_2">
							<a href="">购 买</a>
						</div>
					</div>
				</li>
				<li>
					<div class="div1">
						<img src="images/c1.jpg" alt="">
						<a href=""></a>
					</div>
					<div class="div2">
						<div class="div2_1">
							<p>模板ID: 7278</p>
							<p>模板价格: <span>¥180元</span></p>
						</div>
						<div class="div2_2">
							<a href="">购 买</a>
						</div>
					</div>
				</li>
				<?php }?>
			</ul>
			<div class="clear"></div>
		</div>
	<?php require_once('page.php'); ?>
	</div>
	<?php require_once('bottom.php'); ?>
</body>
</html>