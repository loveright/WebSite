<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html style="100%;">
<head>
<title>我的生活</title>
<link rel="icon" href="Img/by.ico" type="image/x-icon"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="Js/MyWork.js" type="text/javascript"></script>
<script type="text/javascript" src="Js/jquery-1.8.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="Js/bootstrap.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="Css/MyWork.css"/>
<link rel="stylesheet" type="text/css" href="Css/musicplayer.css"/>
<link rel="stylesheet" href="Css/main.css" />
</head>
<body>
<div  class="container-fluid" style="padding-left:0px;padding-right:0px;">
	<div id="head">
		<div id="my_title" class="text-center">MY LIFE</div>
		<div id="subtitle">
			<ul id="sub_ul" class="row">
				<li class="col-xs-1 col-md-2"></li>
				<li class="col-xs-1 col-md-2 sub_li"><a id="sub_li_a" href="javascript:void(0)" style="margin-left:32px;">首页</a></li>
				<li class="col-xs-1 col-md-2 sub_li"><a href="http://www.ricoh.com.cn/RCN/sites/www.ricoh.com.cn/files/%E5%A4%8D%E5%8D%B0%E9%A1%B5%E7%A0%81%E6%99%BA%E8%83%BD%E7%94%9F%E6%88%90%E4%BD%BF%E7%94%A8%E6%89%8B%E5%86%8C.pdf">项目地址</a></li>
				<li class="col-xs-1 col-md-2 sub_li"><a href="javascript:void(0)" id="ClickMe">联系方式</a></li>
				<li class="col-xs-1 col-md-2 sub_li"><a href="MessageBoard.jsp" target="_blank">给我留言</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<ul class="row">	
			<li class="col-md-4 content_li">				
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
						<div class="content_div " ><img class="content_li img-responsive center-block" src="Img/mei-pro6-2-1.jpg" /></div>
						<div class="content_ul_li"><a>爱 商 务</a></div>
						<div class="content_ul_lii"><a>Love Business</a></div>
					</div>
				</div>
			</li>
			<li class="col-md-4 content_li">
				<div class="row">	
					<div class="col-md-1 "></div>				
					<div class="col-md-10">												
						<div class="content_div"><img class="content_div content_li img-responsive center-block" src="Img/template-one.jpg"/></div>
						<div class="content_ul_li"><a>爱 音 乐</a></div>
						<div class="content_ul_lii"><a>Love Music</a></div>																	
					</div>
					<div class="col-md-1"></div>
				</div>				
			</li>
			<li class="col-md-4 content_li">						
				<div class="row">					
					<div class="col-md-9">
						<div class="content_div"><img class="content_div content_li img-responsive center-block" src="Img/web-two.jpg"/></div>
						<div class="content_ul_li"><a>爱 编 程</a></div>
						<div class="content_ul_lii"><a>Love Programming</a></div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</li>	
			<li class="col-md-4 content_li ">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
						<div class="content_div"><img class="content_li img-responsive center-block" src="Img/by3-1.jpg"/></div>
						<div class="content_ul_li"><a>爱 健 身</a></div>
						<div class="content_ul_lii"><a>Love Fitness</a></div>
					</div>
				</div>				
			</li>
			<li class="col-md-4  content_li">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="content_div"><img class="content_li img-responsive center-block" src="Img/by2-1.jpg"/></div>
						<div class="content_ul_li"><a>爱 读 书</a></div>
						<div class="content_ul_lii"><a>Love Reading</a></div>
					</div>				
					<div class="col-md-1"></div>
				</div>				
			</li>
			<li class="col-md-4  content_li">
				<div class="row">
					<div class="col-md-9">
						<div class="content_div"><img class="content_li img-responsive center-block" src="Img/by1-2.jpg"/></div>
						<div class="content_ul_li"><a>爱 臭 美</a></div>
						<div class="content_ul_lii"><a>Love Boast</a></div>
					</div>				
					<div class="col-md-3"></div>
				</div>				
			</li>
		</ul>		
		<div class="c_div1_3">Copyrights © 2020 <a href="http://www.loveright.cn" >周博洋个人网站</a> www.loveright.cn, All rights reserved.ICP备案证书号:<a href="http://icp.chinaz.com/info?q=loveright.cn" >湘ICP备16019053号</a></div>
	
	</div>
</div>

<div id="">
	
</div>

<div id="goodcover"></div>
	
<div id="code">
  <div class="close1"><a href="javascript:void(0)" id="closebt"><img src="Img/close.gif"></a></div>
  <div class="goodtxt">
    <p>微信扫一扫</p>
    <p>让我们成为好朋友</p>
    <p>手机：15173386755</p>
    <p>QQ:2423623805</p>
  </div>
  <div class="code-img"><img id="ewmsrc"  src="Img/code1.jpg"></div>
</div>
<script src="Js/MyWorkJQ.js" type="text/javascript"></script>
<script type="text/javascript">
window.addEventListener("popstate", function(e) { 
	window.history.back(-1); 
}, false);
</script>
</body>
</html>
