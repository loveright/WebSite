<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link rel="icon" href="Img/by.ico" type="image/x-icon"> 
<link rel="stylesheet" type="text/css" href="Css/musicplayer.css"/>
<link rel="stylesheet" type="text/css" href="Css/web1.css"/>
<script type="text/javascript" src="Js/jquery-1.8.2.min.js"></script>
<script src="Js/web1.js" language="javascript"></script>
<script src="Js/web1JQ.js" language="javascript"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div id="content1">
	<img id="head" src="Img/me3-1.jpg" /><br/>
	<div id="head1">
		<span id="w_span1">领略一种视野，放眼未来。</span><br />
		<span id="w_span2" class="w_span2_1">I'm glad that you visited my site where you can get to know </span>
		<br/>
		<span class="w_span2_1">me and my life.</span>
	</div>	
</div>
<div id="content2">
	<div class="c_div1">我的名字叫周博洋，从大二下开始学习JavaWeb技术栈，毕业时可以用SSH开发项目。</div>
	<div class="c_div1_1">我热爱互联网这种新奇的技术，希望未来可以成为一名架构师。</div>
	<div class="c_div1_1">我喜欢时尚的设计，喜欢听安静的钢琴曲也喜欢听劲爆的电音。</div>
	<div class="c_div1_1">除了代码我还喜欢健身和读书。在大学和工作期间我做了一些</div>
	<div class="c_div1_1">项目，在我的生活篇和邮箱中的简历中有详细的介绍，请点击</div>
	<div class="c_div1_1">上方头像进入生活篇。下面是我掌握的具体技能：</div>
	<div class="c_div1_2"></div>
	<div class="c_div1_1">具备Java语言基础，熟悉OOP编程思想，熟悉数据结构，理解MVC分层架构。</div>
	<div class="c_div1_1">熟练Java Web技术。如Jsp、Servlet、El、JSTL、XML约束及其解析。</div>
	<div class="c_div1_1">熟练应用Hibernate、MyBatis、Spring、SpringMVC等框架开发项目。</div>
	<div class="c_div1_1">熟练HTML、JQuery、CSS、Bootstrap、JavaScript、Ajax等。</div>
	<div class="c_div1_1">熟练操作应用Mysql,SQLserver,了解Oracle。</div>
	<div class="c_div1_1">熟悉Tomcat下的项目部署。</div>
	<div class="c_div1_1"></div>
	<div class="c_div1_1"></div>
	<div class="c_div1_1"></div>
	<div class="c_div1_1"></div>
	<div id="input_div"><input id="input_button" type="button" value="My Life"/></div>
	<div class="c_div1_3">Copyrights © 2020<a href="http://www.loveright.cn" style="color:black;">周博洋个人网站</a> www.loveright.cn, All rights reserved.ICP备案证书号:<a href="http://icp.chinaz.com/info?q=loveright.cn">湘ICP备16019053号</a></div>	
</div>
<div id="content3">
	
</div>
<div class="MusicCon">
	<div class='ImgTxt'>
		<dl>
			<dt><img id="dt_img" src="Img/zjl.jpg" width='90' height='90' class="butImg"/></dt>
			<dd id="dd_text">感恩的心</dd>
		</dl>
	</div>

	<div class="But">
		<a href="javascript:void(0)" class='prev'><img src="Img/9.png" /></a>
		<a href="javascript:void(0)" class='play'><img src="Img/4.png" /></a>
		<a href="javascript:void(0)" class='next'><img src="Img/1.png" /></a>
	</div>

	<div class="clickBut"><img src="Img/but.png" /></div>
	
	<div class="playBox"></div>
	<audio id="audio" controls autoplay hidden="true" src="johann_sebastian_bach_air.mp3"></audio>
</div>
</body>
</html>
