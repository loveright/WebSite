<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>留言板</title>
  <link rel="icon" href="Img/by.ico" type="image/x-icon"> 
  <script type="text/javascript" src="Js/jquery-1.8.2.min.js"></script>   
  <script type="text/javascript" src="http://cdn.bootcss.com/sockjs-client/1.1.1/sockjs.js"></script>
<style type="text/css">
*{margin:0px; padding:0px;}
body{background:#3FC;}
#l_r{float: right;margin-top: -25px;margin-right: 10px;border:none;}
.b_utton{float: left;margin-left: 20px;border:none;}
.welcome{font-size:14px;font-family:"微软雅黑";color:#ffffff;}
.b_utton1{border: none;background:red;color:#ffffff;width:44px;height: 20px;
    font-size: 14px;font-family:"微软雅黑";letter-spacing: 2px;border-radius:5px;
    padding:0;
}
#qq{width:600px;/*宽*/height:auto;/*高*/background:#fff;/*背景颜色*/
 margin:50px auto 30px; border-radius:5px;/*HTML5 圆角*/}
#qq p{font-size:12px; color:#666; font-family:"微软雅黑";
  line-height:45px; text-indent:20px;}
#qq .message{width:560px; height:70px;margin:0px auto; outline:none;
   border:1px solid #ddd; /*粗细 风格 颜色*/}
#qq .But{width:560px;height:35px;margin:15px auto 0px; position:relative;/*相对，参考对象*/}
#qq .But img.bq{float:left;/*左浮动*/}
#qq .But span.submit{width:80px;height:30px; background:#ff8140;     display:block; float:right;/*右浮动*/        line-height:30px;border-radius:5px;        cursor:pointer;/*手指*/color:#fff;font-size:12px;     text-align:center;font-family:"微软雅黑";}
/*face begin*/
#qq .But .face{width:390px; height:160px; background:#fff; padding:10px;
    border:1px solid #ddd; box-shadow:2px 2px 3px #666;
    position:absolute;/*绝对定位*/ top:21px; left:15px;
    display:none;/*隐藏*/}
#qq .But .face ul li{width:22px;height:22px; 
    list-style-type:none;/*去掉圆点*/ float:left;
    margin:2px; cursor:pointer;}
/*msgCon begin*/
#body_div{
 width:100%;
 height:1000px;
 overflow:visible;
 float:left;
}
.msgCon{width:600px;height:auto; margin:0px auto;}
.msgCon .msgBox{ background:#fff;
    padding:10px; margin-top:20px;overflow:hidden}
.msgCon .msgBox dl{height:60px; border-bottom:1px dotted #ddd;}
.msgCon .msgBox dl dt{width:50px; height:50px;float:left;}
.msgCon .msgBox dl dt img{border-radius:25px;}
.msgCon .msgBox dl dd{width:500px; height:50px;  line-height:50px;float:right; font-size:16px;font-family:"微软雅黑";}
.msgCon .msgBox .msgTxt{font-size:14px; color:#666; line-height:25px;}
.msgCon .msgBox .msgTime{font-size:10px; color:#666; line-height:25px;float:right;margin-top:-21px;}
.c_div1_3{margin-top:10px;font:8px "Tahoma";text-align:center;color: #ffffff;}
.c_div1_3 a{font:8px "Tahoma";text-align:center;}
</style>
<style>
*{margin:0;padding:0;font-family:"微软雅黑";font-size:12px;}
.box{
	width:390px;
	height:320px;
	border:solid 1px #ddd;
	background:#FFF;
	position:absolute;
	left:50%;
	top:42%;
	margin-left:-195px;
	margin-top:-160px;
}
#img_close{
	float: right;
}
#img_close_rg{
	float:right;
}
.box h2{
	font-weight:normal;
	color:#666;
	font-size:16px;
	line-height:46px;
	height:46px;
	overflow:hidden;
	text-align:center;
	border-bottom:solid 1px #ddd;
	background:#f7f7f7;
}
.input_box{
	width:350px;
	padding-bottom:15px;
	margin:0 auto;
	overflow:hidden;
}
.input_box input{
	float:left;
	width:348px;
	height:40px;
	font-size:14px;
	border:solid 1px #ddd;
	text-indent:10px;
	outline:none;
	line-height:40px;
}
.input_box button{
	width:350px;
	height:48px;
	background:#3f89ec;
	border:none;
	border-radius:2px;
	outline:none;
	cursor:pointer;
	font-size:16px;
	color:#FFF;
}
#error_box{
	height:40px;
	width:350px;
	margin:0 auto;
	line-height:40px;
	color:#fc4343;
}
#error_box_r{
	height:40px;
	width:350px;
	margin:0 auto;
	line-height:40px;
	color:#fc4343;
}



.box1{
	width:390px;
	height:320px;
	border:solid 1px #ddd;
	background:#FFF;
	position:absolute;
	left:50%;
	top:59%;
	margin-left:-195px;
	margin-top:-160px;
	border-radius:15px;
}
#img_close1{
	float: right;
	border-radius:10px;
}
#img_close_rg1{
	float:right;
	border-radius:15px;
}
.box1 h2{
	font-weight:normal;
	color:#666;
	font-size:16px;
	line-height:46px;
	height:46px;
	overflow:hidden;
	text-align:center;
	border-bottom:solid 1px #ddd;
	background:#f7f7f7;
	border-top-left-radius:15px;
	border-top-right-radius:15px;
}
.input_box1{
	width:350px;
	padding-bottom:15px;
	margin:0 auto;
	overflow:hidden;
	
}
.input_box1 input{
	float:left;
	width:348px;
	height:40px;
	font-size:14px;
	border:solid 1px #ddd;
	text-indent:10px;
	outline:none;
	line-height:40px;
	border-radius:15px;
}
.input_box1 button{
	width:350px;
	height:48px;
	background:#3f89ec;
	border:none;
	border-radius:2px;
	outline:none;
	cursor:pointer;
	font-size:16px;
	color:#FFF;
	border-radius:15px;
	letter-spacing:15px;
	padding-right:-15px;
}
#error_box1{
	height:40px;
	width:350px;
	margin:0 auto;
	line-height:40px;
	color:#fc4343;
}
#error_box_r1{
	height:40px;
	width:350px;
	margin:0 auto;
	line-height:40px;
	color:#fc4343;
}
a{	
	css text-decoration:none;
}
a:link,a:visited{color:#444;text-decoration:none;}
a:hover{color:#ff0000; cursor:pointer;}
a.disabled {
            pointer-events: none;
            filter: alpha(opacity=50); /*IE滤镜，透明度50%*/
            -moz-opacity: 0.5; /*Firefox私有，透明度50%*/
            opacity: 0.5; /*其他，透明度50%*/
        }
</style>
</head>
 <body>

 <!-- 发布框模块 -->
 <div id="l_r">
 	<div id="button_login" class="b_utton"><input class="b_utton1" type="button" value="登录" onclick="funbodyLogin()"/></div>
 	<div id="button_register" class="b_utton"><input class="b_utton1" type="button" value="注册" onclick="funbodyRegister()"/></div>
 	<div id="button_welcome" class="b_utton welcome" style="display:none;background:red;" ><span>欢迎：</span><span id="username">${sessionScope.unameHtml }</span></div>
 	<div id="button_out" class="b_utton" style="display:none;"><input class="b_utton1" type="button" value="退出" onclick="funbodyOut()"/></div>
 </div>
<div id="qq">
<div id="msgChange" style="text-align:center"></div>
 <p>你的快乐与不快乐可以通通告诉我！</p>
 <div class="message" contentEditable='true'></div>
 <div class="But">
  <img src="Imghead/Imgface/yellow1.jpg" class='bq'/>
  <span class='submit'>发表</span>
  <!--face begin-->
  <div class="face">
   <ul>
    <li><img src="Imghead/Imgface/yellow1.jpg" title="[可爱]" ></li>
    <li><img src="Imghead/Imgface/yellow2.gif" title="[感动]"></li>
    <li><img src="Imghead/Imgface/yellow3.gif" title="[闪]"></li>
    <li><img src="Imghead/Imgface/yellow4.gif" title="[不屑]"></li>
    <li><img src="Imghead/Imgface/yellow5.gif" title="[围观]"></li>
    <li><img src="Imghead/Imgface/yellow6.jpg" title="[威武]"></li>
    <li><img src="Imghead/Imgface/yellow7.jpg" title="[熊猫]"></li>
    <li><img src="Imghead/Imgface/yellow8.gif" title="[大吐]"></li>
    <li><img src="Imghead/Imgface/yellow9.gif" title="[色你]"></li>
    <li><img src="Imghead/Imgface/yellow10.gif" title="[囧]"></li>
    <li><img src="Imghead/Imgface/yellow101.gif" title="[亲亲]"></li>
    <li><img src="Imghead/Imgface/yellow12.gif" title="[嗨]"></li>
    <li><img src="Imghead/Imgface/yellow13.gif" title="[嘻嘻]" ></li>
    <li><img src="Imghead/Imgface/yellow14.gif" title="[点点点]"></li>
    <li><img src="Imghead/Imgface/yellow15.gif" title="[咯咯嘎]"></li>
    <li><img src="Imghead/Imgface/yellow16.gif" title="[啾啾]"></li>
    <li><img src="Imghead/Imgface/yellow17.gif" title="[傻笑]"></li>
    <li><img src="Imghead/Imgface/yellow18.gif" title="[笑]"></li>
    <li><img src="Imghead/Imgface/yellow19.gif" title="[加油]"></li>
    <li><img src="Imghead/Imgface/yellow20.jpg" title="[叹气]"></li>
    <li><img src="Imghead/Imgface/yellow21.gif" title="[囧]"></li>
    <li><img src="Imghead/Imgface/yellow22.gif" title="[什么]"></li>
    <li><img src="Imghead/Imgface/yellow23.gif" title="[哈哈哦哦]"></li>
    <li><img src="Imghead/Imgface/yellow24.gif" title="[亲亲]"></li>
    <li><img src="Imghead/Imgface/yellow25.gif" title="[无视]"></li>
    <li><img src="Imghead/Imgface/yellow26.gif" title="[嘿嘿]"></li>
    <li><img src="Imghead/Imgface/yellow27.gif" title="[小哭]"></li>
    <li><img src="Imghead/Imgface/yellow28.gif" title="[尴尬]"></li>
    <li><img src="Imghead/Imgface/yellow29.gif" title="[得意]"></li>
    <li><img src="Imghead/Imgface/yellow30.gif" title="[色]"></li>
    <li><img src="Imghead/Imgface/yellow31.gif" title="[尴尬]"></li>
    <li><img src="Imghead/Imgface/yellow32.gif" title="[可怜]"></li>
    <li><img src="Imghead/Imgface/yellow33.gif" title="[怒]"></li>
    <li><img src="Imghead/Imgface/yellow34.gif" title="[害羞吗]"></li>
    <li><img src="Imghead/Imgface/yellow35.gif" title="[鄙视]"></li>
    <li><img src="Imghead/Imgface/yellow36.jpg" title="[小尴尬]"></li>
    <li><img src="Imghead/Imgface/yellow37.gif" title="[无所谓]"></li>
    <li><img src="Imghead/Imgface/yellow38.gif" title="[泪]"></li>
    <li><img src="Imghead/Imgface/yellow39.gif" title="[憨笑]"></li>
    <li><img src="Imghead/Imgface/yellow40.gif" title="[懒得理你]"></li>
    <li><img src="Imghead/Imgface/yellow41.gif" title="[亲亲]"></li>
    <li><img src="Imghead/Imgface/yellow42.gif" title="[嗯..不]"></li>
    <li><img src="Imghead/Imgface/yellow43.gif" title="[嘎嘎笑]" ></li>
    <li><img src="Imghead/Imgface/yellow44.gif" title="[小可怜]"></li>
    <li><img src="Imghead/Imgface/yellow45.gif" title="[浮云]"></li>
    <li><img src="Imghead/Imgface/yellow46.gif" title="[啊]"></li>
    <li><img src="Imghead/Imgface/yellow47.gif" title="[激动落泪]"></li>
    <li><img src="Imghead/Imgface/yellow48.gif" title="[鼓掌]"></li>
    <li><img src="Imghead/Imgface/yellow49.gif" title="[尴尬]"></li>
    <li><img src="Imghead/Imgface/yellow50.gif" title="[大哥]"></li>
    <li><img src="Imghead/Imgface/yellow51.gif" title="[抠鼻]"></li>
    <li><img src="Imghead/Imgface/yellow52.gif" title="[笑]"></li>
    <li><img src="Imghead/Imgface/yellow53.gif" title="[挥泪再见]"></li>
    <li><img src="Imghead/Imgface/yellow54.gif" title="[啊....]"></li>
    <li><img src="Imghead/Imgface/yellow55.gif" title="[大骂]"></li>
    <li><img src="Imghead/Imgface/yellow56.gif" title="[小窘迫]"></li>
    <li><img src="Imghead/Imgface/yellow57.gif" title="[色]"></li>
    <li><img src="Imghead/Imgface/yellow58.gif" title="[得意]"></li>
    <li><img src="Imghead/Imgface/yellow59.gif" title="[柳暗花明]"></li>
    <li><img src="Imghead/Imgface/yellow60.jpg" title="[微怒]"></li>
    <li><img src="Imghead/Imgface/yellow61.gif" title="[害羞吗]"></li>
    <li><img src="Imghead/Imgface/yellow62.gif" title="[啦啦啦]"></li>
    <li><img src="Imghead/Imgface/yellow63.gif" title="[大骂]"></li>
    <li><img src="Imghead/Imgface/yellow64.gif" title="[你强]"></li>
    <li><img src="Imghead/Imgface/yellow65.gif" title="[你狠]"></li>
    <li><img src="Imghead/Imgface/yellow66.gif" title="[真的是]"></li>
    <li><img src="Imghead/Imgface/yellow67.gif" title="[花样吐]"></li>
    <li><img src="Imghead/Imgface/yellow68.gif" title="[流汗]"></li>
    <li><img src="Imghead/Imgface/yellow69.jpg" title="[衰]"></li>
    <li><img src="Imghead/Imgface/yellow70.gif" title="[鄙视]"></li>
    <li><img src="Imghead/Imgface/yellow71.gif" title="[吐你]"></li>
    <li><img src="Imghead/Imgface/yellow72.gif" title="[含笑]"></li>
    <li><img src="Imghead/Imgface/yellow73.gif" title="[吃惊]"></li>
    <li><img src="Imghead/Imgface/yellow74.gif" title="[含笑]"></li>
    <li><img src="Imghead/Imgface/yellow75.gif" title="[得意]"></li>
    <li><img src="Imghead/Imgface/yellow76.gif" title="[大笑]"></li>
    <li><img src="Imghead/Imgface/yellow77.gif" title="[唐僧]"></li>
    <li><img src="Imghead/Imgface/yellow78.gif" title="[加油]"></li>
    <li><img src="Imghead/Imgface/yellow210.gif" title="[宝宝苦]"></li>
    <li><img src="Imghead/Imgface/yellow80.gif" title="[含笑]"></li>
    <li><img src="Imghead/Imgface/yellow81.gif" title="[大笑]"></li>
    <li><img src="Imghead/Imgface/yellow82.jpg" title="[二货]"></li>
    <li><img src="Imghead/Imgface/yellow83.gif" title="[便便]"></li>
    <li><img src="Imghead/Imgface/yellow84.gif" title="[笑]"></li>
    <li><img src="Imghead/Imgface/yellow85.gif" title="[不开心]"></li>
    <li><img src="Imghead/Imgface/yellow86.gif" title="[怒]"></li>
    <li><img src="Imghead/Imgface/yellow87.gif" title="[威胁]"></li>
    <li><img src="Imghead/Imgface/yellow88.gif" title="[逗你玩]"></li>
    <li><img src="Imghead/Imgface/yellow89.gif" title="[大吐]"></li>
    <li><img src="Imghead/Imgface/yellow90.gif" title="[要怒了]"></li>
   </ul>
  </div>
  <!--face end-->
 </div>
</div>
<!--qq end-->
<div id="time1"></div>
<!--msgCon begin-->
<div class="msgCon">

</div>
 <!-- 发布框模块结束 -->

 <!-- 登录模块 -->
<div class="box" id="box_div" style="display: none;">
	<h2>登录<img id="img_close" src="Img/close.gif" onclick="funClose()"/></h2>
	<div id="error_box"></div>
	<div class="input_box">
	    <input type="text" placeholder="请输入账户名" id="uname"/>
	</div>
	<div class="input_box">
	    <input type="password" placeholder="请输入密码" id="upass"/>
	</div>
	<div class="input_box">
	    <button onclick="fnLogin()">登录</button>
	</div>
</div>
<!-- 登录模块结束 -->
 
<!-- 注册模块 -->
<div class="box" id="box_div_register" style="display: none;">
		<h2>注册<img id="img_close_rg" src="Img/close.gif" onclick="funCloseRegister()"/></h2>	
	    <div id="error_box_r"></div>
	    <div class="input_box">
	    	<input type="text" placeholder="请输入账户名" id="urname" />
	    </div>
	    <div class="input_box">
	    	<input type="password" placeholder="请输入密码" id="urpass" />
	    </div>
	    <div class="input_box">
	    	<input type="text" placeholder="请输入邮箱" id="uemail" />
		</div>
	    <div class="input_box">
	    	<button onclick="fnRegister()">注册</button>
	    </div>
</div>
 <!-- 注册模块结束 -->
 
 <!-- 游客留言框模块 -->
 <div class="box1" id="box_div1" style="display: none;">
	<h2>游客<img id="img_close1" src="Img/close.gif" onclick="funCloseTraveller()"/></h2>
	<div id="error_box1"></div>
	<div class="input_box1">
	    <input type="text" placeholder="请输入名称，必填" id="uname1"/>
	</div>
	<div class="input_box1">
	    <input type="text" placeholder="请输入邮箱，必填" id="uemail1"/>
	</div>
	<div class="input_box1">
	    <input type="text" placeholder="请输入留言内容，必填" id="utext1"/>
	</div>
	<div class="input_box1">
	    <button onclick="fnLeaveMessage()">留言</button>
	</div>
</div>
 
<script type="text/javascript">  

	function socket(){
		var websocket = null;  
	    if ('WebSocket' in window) {  
	        //Websocket的连接  
	        websocket = new WebSocket("ws://localhost:8080/WebSite/webSocketServer");//WebSocket对应的地址  
	    }  
	    else if ('MozWebSocket' in window) {  
	        //Websocket的连接  
	        websocket = new MozWebSocket("ws://localhost:8080/WebSite/webSocketServer");//SockJS对应的地址  
	    }  
	    else {  
	        //SockJS的连接  
	        websocket = new SockJS("http://localhost:8080/WebSite/sockjs/webSocketServer");    //SockJS对应的地址  
	    }  
	    websocket.onopen = onOpen;  
	    websocket.onmessage = onMessage;  
	    websocket.onerror = onError;  
	    websocket.onclose = onClose;  
	  
	    function onOpen(event) {  
	       //alert(event.data);   
	    }  
	  
	    function onMessage(event) {  
	    	//alert(event.data);
	    	console.info(event.data);	    	
	    	$("#msgChange").html(event.data);	        
	    }  
	    function onError() {  
	    }  
	    function onClose() {  
	    }  
	  
	    function doSend() {  
	        if (websocket.readyState == websocket.OPEN) {  
	            websocket.send("hahaha");//调用后台handleTextMessage方法  
	            alert("发送成功!");  
	        } else {  
	        
	            alert("连接失败!"+websocket.readyState);  
	        }  
	    }  
	  
	    window.close = function () {  
	        websocket.onclose();  
	    }  
	}
	

    
</script>

 <!-- 游客留言框模块结束 -->
<script type="text/javascript">

	//触发body页面的登录按钮的动作
	function funbodyLogin(){
		var oBox_Div = document.getElementById('box_div');
		var oBox_Div_Register = document.getElementById('box_div_register');
		oBox_Div.style.display = 'block';
		oBox_Div_Register.style.display = 'none';
	}
	//触发body页面退出按钮的动作
	function funbodyOut()
	{
		var oButton_Login = document.getElementById('button_login');
		var oButton_Register = document.getElementById('button_register');
		var oButton_Welcome = document.getElementById('button_welcome');
		var oButton_Out = document.getElementById('button_out');
		$.ajax({
			  type: 'POST',
			  url: "controller/out",			  
			  success: function(data){
				  if(data = "退出成功")
				  {	
					  window.location.reload();
					  oButton_Login.style.display = "block";
					  oButton_Register.style.display = "block";
					  oButton_Welcome.style.display = "none";
					  oButton_Out.style.display = "none";
				  }
			   }
			});
	}
	//触发body页面的注册按钮的动作
	function funbodyRegister(){
		var oBox_Div_Register = document.getElementById('box_div_register');
		var oBox_Div = document.getElementById('box_div');
		oBox_Div.style.display = 'none';
		oBox_Div_Register.style.display = 'block';
	}
	//关闭登录框
	function funClose(){
		var oImg_Close = document.getElementById('img_close');
		var oBox_Div = document.getElementById('box_div');
		oBox_Div.style.display = 'none';
	}
	//关闭注册框
	function funCloseRegister(){
		var oImg_Close = document.getElementById('img_close_rg');
		var oBox_Div_Register = document.getElementById('box_div_register');
		oBox_Div_Register.style.display = 'none';
	}
	//关闭游客留言框
	function funCloseTraveller(){
		var oImg_Close = document.getElementById('img_close1');
		var oBox_Div_Register = document.getElementById('box_div1');
		oBox_Div_Register.style.display = 'none';
	}
</script>
<script type="text/javascript">
 //点击小图片，显示表情
 $(".bq").click(function(e){
  $(".face").slideDown();//慢慢向下展开
  e.stopPropagation();   //阻止冒泡事件
 });
 //在桌面任意地方点击，他是关闭
 $(document).click(function(){
  $(".face").slideUp();//慢慢向上收
 });
 //点击小图标时，添加功能
 $(".face ul li").click(function(){
  var simg=$(this).find("img").clone();
  $(".message").append(simg);
 });

//点击发表按扭，发表内容
 $("span.submit").click(function(){
	 $.ajax({
 		  type: 'POST',
 		  url: "controller/publish", 
 		  dataType:"json",		 	
 		  success: function(data){ 		  		
 		  		if(data.uroot == 3){ 
 		  			alert("请登录！");
 		  			//$("#box_div1").css({display:"block"});
 		  		}else{
 		  			  var txt=$(".message").html();
 		  			  //alert(txt); 		  			 	 			    	 
 			    	  if(txt == ""){ 			    	  
 			    	   	$('.message').focus();//自动获取焦点
 			    	   	alert("内容不可以为空！");
 			    	    return;
 			    	  }else{
 			    	  	var usertext = JSON.stringify({
 			    	  		"uid":data.user.uid,
							"username":data.user.uname,
							"reviewText": txt}); 			    	  	
 			    		  $.ajax({
 			    		  		type: "POST",   //请求方式
 			    			    url: "controller/insertreview",    //请求的url地址 	
 			    			    contentType : "application/json; charset=utf-8",		    			    
 			    			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
 			    			    data: usertext,
 			    			    dataType: "json",   //返回格式为json 			    			    
 			    			    success: function(data) {
 			    			        //alert(JSON.stringify(data));
 			    			        //var data = eval("(" +data+ ")");
 			    			        //$(".msgCon").prepend("<div class='msgBox'><dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt><dd>"+data[0]["uname"]+"</dd></dl><div class='msgTxt'>"+data[0]['context']+"</div><div class='msgTime'>"+data[0]["tourtime"]+"<div/></div>");
 			    			        $(".msgCon").prepend(
 			    			        	"<div class='msgBox'>"+
											"<dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt>"+
											"<dd>"+data.user.uname+"</dd></dl>"+
											"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px solid red;'>"+			
												"<div class='msgTxt'>"+data.context+"</div>"+
												"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.reviewTime+"</div><a  href='javascript:void(0);' style='float:right;' user_id="+data.userId+">回复</a></div>"+							
											"</div>"+
											"<div>"+
												"<div class='reviewParent' style='width:100%;float:right;display:none;'>"+
													"<div class='reviewText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black; float:right;height:auto;'> </div>"+
													"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.reviewId+" posting_id="+data.postingId+">评论</></div>"+
												"</div>"+
											"</div>"+
											"<div class='reviewArea' style='width:100%;float:right;'></div>"+
									   "</div>"
 			    			        );
 			    			    },
 			    			    error: function(XMLHttpRequest, textStatus, errorThrown) {
 			    			    	alert(XMLHttpRequest.status);	
 			    			    }
 			    			});
 			    	  } 		  			
 		  		} 		  		 			 	  			 	 			     			   
 			  },
 			  error: function (XMLHttpRequest, textStatus, errorThrown) {	　　　　
	　　　	　	alert(XMLHttpRequest.status);	　　　　	　　　	
　　		   	  } 			
 		});  

 });
$(".msgCon").on("click",".reply a",function(event){				
	if($(this).parents(".messageArea").next().children(":first").css("display") == "none"){
		$(this).parents(".messageArea").next().children(":first").show();
		var myName = "${sessionScope.user.uname}";		
		//event.preventDefault(); 
		//alert(myName);		
		var otherId = $(this).attr('user_id');
		//$.ajaxSettings.async = false;
		$.post("controller/getUserName",{"userId":otherId},function(data){	
			//alert(data.uname);
			//alert(data);
			var sessionStorge = window.sessionStorage;
			sessionStorge.setItem('otherName', data);
		});			
		var otherName = window.sessionStorage.getItem("otherName");		
		$(this).parents(".messageArea").next().children(":first").children(":first").html(myName+"回复"+otherName+":");
		var last = $(this).parents(".messageArea").next().children(":first").children(":first");		
		getC(last);
			
	}else{
		$(this).parents(".messageArea").next().children(":first").hide();
	}			
 });
 $(".msgCon").on("click",".review a",function(){	
		var reviewText = $(this).closest(".reviewParent").children(":first").html();
		var here = $(this);
		$(".reviewParent").hide(".reviewParent");
		var index = reviewText.indexOf(":");
		var newText = reviewText.slice(index+1,reviewText.length);			
		if(newText == ''){	
			alert("内容不可以为空！");			
			return;
		}
		var userId = "${user.uid}";		
		var lastId = $(this).attr("review_id");
		var postingId = $(this).attr("posting_id");
		var sessionStorge = window.sessionStorage;
		var usertext = JSON.stringify({
 	  		"uid":userId,			
			"reviewText": newText,
			"lastId":lastId,
			"postingId":postingId}); 		
		$.ajax({
				type: "POST",   //请求方式
			    url: "controller/review",    //请求的url地址 	
			    contentType : "application/json; charset=utf-8",		    			    
			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    data: usertext,
			    dataType: "json",   //返回格式为json 	
			    context: here,
			    success: function(data) {
			    	//alert(JSON.stringify(data));
			    	here.parents(".msgBox").find(".reviewArea").prepend(
			    			"<div  style='width:100%;float:right;'>"+
			    				"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px dashed red;'>"+			
			    					"<div class='msgTxt'>"+data.user.uname+" 回复 "+sessionStorge.getItem('otherName')+":"+newText+"</div>"+
			    					"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.reviewTime+"</div><a href='javascript:void(0);' style='float:right;'>回复</a></div>"+						
			    				"</div>"+
			    				"<div>"+
			    					"<div class='reviewParent' style='width:100%;float:right;display:none;'>"+
			    						"<div class='reviewOfText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black;float:right;height:auto;'></div>"+
			    						"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.reviewId+" posting_id="+data.postingId+">评论</></div>"+
			    					"</div>"+
			    				"</div>"+
			    			"</div>");
			    	here.closest(".reviewParent").children(":first").html('');				    			
			    },
			    error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	alert(XMLHttpRequest.status);
 			    }			
		});
		
 }); 
 
//光标移到内容后
function getC(el){
	el = el[0]; // jquery 对象转dom对象 
	el.focus();
	var range = document.createRange();
	range.selectNodeContents(el);
	range.collapse(false);
	var sel = window.getSelection();
	//判断光标位置，如不需要可删除
	if(sel.anchorOffset!=0){
		return;
	};
	sel.removeAllRanges();
	sel.addRange(range);
}
</script>
<script type="text/javascript">
//长度必须在6~20位之间
//开头不能为数字
//只能包含小写字母和数字
//数字：48~57
//小写字母：97~122
//innerHTML
//判断登录是否成功
function fnLogin(){
	
	var oBox_Div = document.getElementById('box_div');
	var oUname = document.getElementById("uname");
	var oUpass = document.getElementById("upass");
	var oError = document.getElementById("error_box");
	var oUsername = document.getElementById("username");
	var isNotError = true;
	if(oUname.value.length > 20 || oUname.value.length < 6){
		oError.innerHTML = "用户名长度必须在6~20位之间";
		isNotError = false;
		return;
		
	}else if(oUname.value.charCodeAt(0) >= 48 && oUname.value.charCodeAt(0) <= 57){
		oError.innerHTML = "用户名开头不能为数字";
		isNotError = false;
		return;
	}else{
		for(var i=0; i<oUname.value.length; i++){
			if((oUname.value.charCodeAt(i) > 122 || oUname.value.charCodeAt(i) < 97) && (oUname.value.charCodeAt(i) > 57 || oUname.value.charCodeAt(i) < 48)){
				oError.innerHTML = "用户名只能包含小写字母和数字";
				isNotError = false;
				return;
			}
		}
	}
	if(oUpass.value.length > 20 || oUpass.value.length < 6){
		oError.innerHTML = "密码长度必须在6~20位之间";
		isNotError = false;
		return;
	}
	var userlogin = JSON.stringify({
		"username":oUname.value,
		"userpassword":oUpass.value});
	$.ajax({
		  type: 'POST',
		  url: "controller/login",
		  data: userlogin,
		  contentType : "application/json; charset=utf-8",
		  async: false,
		  success: function(data){
			  if((data == "用户名或密码错误") || (data == "在同一地点重复登录") || (data == "异地已登录，请先退出登录"))
			  {
				  oError.innerHTML = data;				 
			  }else{
				  //alert(data);
				  //刷新后获取最新session				  
				  window.location.reload();						  
				  oUsername.innerHTML = data;
				  oBox_Div.style.display = "none";				 				
				  $("#button_login").css({display:'none'});
				  $("#button_register").css({display:'none'});
				  $("#button_welcome").css({display:'block'});
				  $("#button_out").css({display:'block'});
				  //window.location.reload();
			  }			    
		   },
		   error: function (XMLHttpRequest, textStatus, errorThrown) {	　　　　
	　　　	　alert(XMLHttpRequest.status);	　　　　	　　　	
　　		   }
		});
	//oError.innerHTML = "登录成功";
	
}

//判断注册是否成功
function fnRegister(){
	var oUname = document.getElementById("urname");
	var oUpass = document.getElementById("urpass");
	var oError = document.getElementById("error_box_r");
	var oEmail = document.getElementById('uemail');
	var isNotError = true;
	if(oUname.value.length > 20 || oUname.value.length < 6){
		oError.innerHTML = "用户名长度必须在6~20位之间";
		isNotError = false;
		return;
		
	}else if(oUname.value.charCodeAt(0) >= 48 && oUname.value.charCodeAt(0) <= 57){
		oError.innerHTML = "用户名开头不能为数字";
		isNotError = false;
		return;
	}else{
		for(var i=0; i<oUname.value.length; i++){
			if((oUname.value.charCodeAt(i) > 122 || oUname.value.charCodeAt(i) < 97) && (oUname.value.charCodeAt(i) > 57 || oUname.value.charCodeAt(i) < 48)){
				oError.innerHTML = "用户名只能包含小写字母和数字";
				isNotError = false;
				return;
			}
		}
	}
	if(oUpass.value.length > 20 || oUpass.value.length < 6){
		oError.innerHTML = "密码长度必须在6~20位之间";
		isNotError = false;
		return;
	}
	var re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(!re.test(oEmail.value.trim()))
	{
		oError.innerHTML = '邮箱格式不正确';
		isNotError = false;
		return;
	}
	if(oEmail.value.trim().length<0)
	{
		oError.innerHTML = '邮箱不能为空！';
		isNotError = false;
		return;
	}
	var userdata = JSON.stringify({
		"username":oUname.value,
		"userpassword":oUpass.value,
		"useremail":oEmail.value,
		"uroot":2
		});
		
	$.ajax({
		  type: 'POST',
		  url: 'controller/register',		  
		  data: userdata,
		  contentType : "application/json; charset=utf-8",		  		  		  
		  success: function(data){		  		
			    oError.innerHTML = data;
		  },
		  error: function (XMLHttpRequest, textStatus, errorThrown) {	　　　　
	　　　	　alert(XMLHttpRequest.status);	　　　　	　　　	
　　		  }
		});
	//oError.innerHTML = "注册成功，请登录";
	//$.post("user.do", {"username":oUname.value,"userpassword":oUpass.value,"useremail":oEmail.value,"uroot":2});
	//location = "user.do?username="+oUname.value+"&userpassword="+oUpass.value+"&useremail="+oEmail.value;
}
//刷新还是新建的判断方法
if(!window.name)
{  
        //alert("第一次开这个窗口！name值"+ window.name);  
        window.name = 'test';
        var pageNum = 0;	
		window.sessionStorage.setItem("curNum", pageNum);
		var pageSize = 4;
		var pageInfo = JSON.stringify({
			"page":"firstPage",
			"pageNum":pageNum,
			"pageSize":pageSize});
        $.ajax({
  		  type: 'POST',
  		  url: "controller/refresh",		    		  
  		  contentType : "application/json; charset=utf-8",		    			    
		  async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		  data: pageInfo,
		  dataType: "json",   //返回格式为json 			    		
  		  success: function(data){
  			//alert(JSON.stringify(data));
  			if(data.pageNum != undefined)
			{
				//window.sessionStorage.setItem("curNum", data.pageNum);
				window.sessionStorage.setItem("lastPage",data.pageNum);
			}	
  			if(data.uroot == 2)
  			{
  				$("#button_login").css({display:'none'});
			    $("#button_register").css({display:'none'});
			    $("#button_welcome").css({display:'block'});
			    $("#button_out").css({display:'block'});
			    socket();
  			}    				
  			
  			for(var i=0;i<data.postings.length;i++)
			{ 
				//alert(data.postings[i].postingId);
				$.ajaxSettings.async = false;
				$.post("controller/foreachmessage",{"postingId":data.postings[i].postingId},function(data){			  					
					//alert(data.allreviews.length);  					
					for(var j=0;j<data.allreviews.length;j++)
					{  	
						var html = "";
						//alert(JSON.stringify(data.allreviews[j]));
						if(data.allreviews[j].lastId == 0)
						{
							html+="<div class='msgBox'>";
							html+=	"<dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt>";					
							html+=	"<dd>"+data.allreviews[j].firstName+"</dd></dl>";
							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px solid red;'>";			
							html+=		"<div class='msgTxt'>"+data.allreviews[j].content+"</div>";
							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a  href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";							
							html+=	"</div>";
							html+=	"<div>";
	  						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
	  						html+=			"<div class='reviewText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black; float:right;height:auto;'> </div>";
	  						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
	  						html+=		"</div>";
	  						html+=	"</div>";
	  						html+=	"<div class='reviewArea' style='width:100%;float:right;'></div>";
	  						html+="</div>";
	  						$(".msgCon").prepend(html);	
						}
						html = "";
						html+="<div  style='width:100%;float:right;'>";
						
						if(data.allreviews[j].lastId != 0)
						{  
							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px dashed red;'>";
							html+=		"<div class='msgTxt'>"+data.allreviews[j].curName+" 回复 "+data.allreviews[j].otherName+":"+data.allreviews[j].content+"</div>";
							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";
							html+=	"</div>";
						}  						  						
						
						html+=	"<div>";
						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
						html+=			"<div class='reviewOfText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black;float:right;height:auto;'></div>";
						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
						html+=		"</div>";
						html+=	"</div>";
						html+="</div>";
						$(".reviewArea:first").prepend(html);
					}  					
				});	  				
			} 
  			if(data.uroot != 2)
			{					 
  				//$(".message").attr("contenteditable",false);
				$(".reply a").attr("disabled",true);
				$(".reply a").css("pointer-events","none");				
				$("#button_login").css({display:'block'});
				$("#button_register").css({display:'block'});
				$("#button_welcome").css({display:'none'});
				$("#button_out").css({display:'none'});			
  			}
  		 }
  	});        
}else{  
        //alert('刷新操作 name值：'+ window.name); 
        var pageNum = 0;	
		window.sessionStorage.setItem("curNum", pageNum);
		var pageSize = 4;
		var pageInfo = JSON.stringify({
			"page":"firstPage",
			"pageNum":pageNum,
			"pageSize":pageSize});
        $.ajax({
		  type: 'POST',
		  url: "controller/refresh",
		  contentType : "application/json; charset=utf-8",		    			    
		  async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		  data: pageInfo,
		  dataType: "json",   //返回格式为json 				  
		  success: function(data){
			//alert(JSON.stringify(data));
			if(data.pageNum != undefined)
			{
				//window.sessionStorage.setItem("curNum", data.pageNum);
				window.sessionStorage.setItem("lastPage",data.pageNum);
			}	
			if(data.uroot == 2)
			{				
				$("#button_login").css({display:'none'});
			    $("#button_register").css({display:'none'});
			    $("#button_welcome").css({display:'block'});
			    $("#button_out").css({display:'block'});	
			    socket();
			}  								
			for(var i=0;i<data.postings.length;i++)
  			{ 
  				//alert(data.postings[i].postingId);
  				var curpostingId = data.postings[i].postingId;
  				$.ajaxSettings.async = false;
  				$.post("controller/foreachmessage",{"postingId":data.postings[i].postingId},function(data){			  					
  					//alert(data.allreviews.length);  					
  					for(var j=0;j<data.allreviews.length;j++)
  					{  	
  						var html = "";
  						//alert(JSON.stringify(data.allreviews[j]));
  						if(data.allreviews[j].lastId == 0 && data.allreviews[j].postingId ==  curpostingId)
  						{
  							html+="<div class='msgBox'>";
  							html+=	"<dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt>";					
  							html+=	"<dd>"+data.allreviews[j].firstName+"</dd></dl>";
  							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px solid red;'>";			
  							html+=		"<div class='msgTxt'>"+data.allreviews[j].content+"</div>";
  							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a  href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";							
  							html+=	"</div>";
  							html+=	"<div>";
  	  						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
  	  						html+=			"<div class='reviewText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black; float:right;height:auto;'> </div>";
  	  						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
  	  						html+=		"</div>";
  	  						html+=	"</div>";
  	  						html+=	"<div class='reviewArea' style='width:100%;float:right;'></div>";
  	  						html+="</div>";
  	  						$(".msgCon").prepend(html);	
  						}
  						html = "";
  						html+="<div  style='width:100%;float:right;'>";
  						
  						if(data.allreviews[j].lastId != 0 && data.allreviews[j].postingId == curpostingId)
  						{  
  							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px dashed red;'>";
  							html+=		"<div class='msgTxt'>"+data.allreviews[j].curName+" 回复 "+data.allreviews[j].otherName+":"+data.allreviews[j].content+"</div>";
  							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";
  							html+=	"</div>";
  							html+=	"<div>";
  	  						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
  	  						html+=			"<div class='reviewOfText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black;float:right;height:auto;'></div>";
  	  						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
  	  						html+=		"</div>";
  	  						html+=	"</div>";
  	  						html+="</div>";
  	  						//$(this).find(".reviewArea").prepend(html);
  	  						$(".reviewArea:first").prepend(html);//加上first，表示只拼接当下的class选择器
  						}  						  						  						  						  					  						
  						$(".reply a").attr("disabled",true);   						
  					}  					
  				});	  				
  			}
			if(data.uroot != 2)
			{		
				//$(".message").attr("contenteditable",false);
				$(".reply a").attr("disabled",true);
				$(".reply a").css("pointer-events","none");				
				$("#button_login").css({display:'block'});
				$("#button_register").css({display:'block'});
				$("#button_welcome").css({display:'none'});
				$("#button_out").css({display:'none'});			
  			}
		 }
	});
           
     	
}  
//判断留言是否成功
        function fnLeaveMessage(){
        	var oUname = document.getElementById("uname1");
        	var oText = document.getElementById("utext1");
        	var oError = document.getElementById("error_box1");
        	var oEmail = document.getElementById('uemail1');
        	var isNotError = true;
        	if(oUname.value.length > 20 || oUname.value.length < 6){
        		oError.innerHTML = "用户名长度必须在6~20位之间";
        		isNotError = false;
        		return;
        		
        	}else if(oUname.value.charCodeAt(0) >= 48 && oUname.value.charCodeAt(0) <= 57){
        		oError.innerHTML = "用户名开头不能为数字";
        		isNotError = false;
        		return;
        	}else{
        		for(var i=0; i<oUname.value.length; i++){
        			if((oUname.value.charCodeAt(i) > 122 || oUname.value.charCodeAt(i) < 97) && (oUname.value.charCodeAt(i) > 57 || oUname.value.charCodeAt(i) < 48)){
        				oError.innerHTML = "用户名只能包含小写字母和数字";
        				isNotError = false;
        				return;
        			}
        		}
        	}
        	if(oText.value.length > 24 || oText.value.length < 6){
        		oError.innerHTML = "游客留言长度必须在6~24位之间";
        		isNotError = false;
        		return;
        	}
        	var re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        	if(!re.test(oEmail.value.trim()))
        	{
        		oError.innerHTML = '邮箱格式不正确';
        		isNotError = false;
        		return;
        	}
        	if(oEmail.value.trim().length<0)
        	{
        		oError.innerHTML = '邮箱不能为空！';
        		isNotError = false;
        		return;
        	}
        	
        	$.ajax({
        		  type: 'POST',
        		  url: "traveller.do",
        		  data: {"method":"traveller","username":oUname.value,"utext":oText.value,"useremail":oEmail.value,"uroot":3},
        		  success: function(data){
        			  var data = eval("(" +data+ ")");
        			  $(".msgCon").prepend("<div class='msgBox'><dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt><dd>"+data[0]["tourname"]+"</dd></dl><div class='msgTxt'>"+data[0]['context']+"</div><div class='msgTime'>"+data[0]["tourtime"]+"<div/></div>");
        			  $("#box_div1").css({display:"none"});
        			  }
        		});
        	//oError.innerHTML = "注册成功，请登录";
        	//$.post("user.do", {"username":oUname.value,"userpassword":oUpass.value,"useremail":oEmail.value,"uroot":2});
        	//location = "user.do?username="+oUname.value+"&userpassword="+oUpass.value+"&useremail="+oEmail.value;
        }
function getRootPath() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName
			.indexOf('/'));
	return window.location.protocol + '//' + window.location.host + '/'
			+ webName + '/';
}
function findPostings(data){	
	//alert(data);
	$.ajax({
		  type: 'POST',
		  url: "controller/refresh",	
		  contentType : "application/json; charset=utf-8",		    			    
		  async: true, //请求是否异步，默认为异步，这也是ajax重要特性
		  data: data,
		  dataType: "json",   //返回格式为json 			    			  
		  success: function(data){
			//alert(JSON.stringify(data));	
			//alert(data.lastPage);
			if(data.pageNum != undefined)
			{				
				window.sessionStorage.setItem("lastPage",data.pageNum);
			}	
			if(data.lastPage != undefined)
			{
				window.sessionStorage.setItem("curNum", data.pageNum);
				window.sessionStorage.setItem("lastPage",data.pageNum);
			}
			if(data.uroot == 2)
			{
				$("#button_login").css({display:'none'});
			    $("#button_register").css({display:'none'});
			    $("#button_welcome").css({display:'block'});
			    $("#button_out").css({display:'block'});
			    //socket();
			}    							
			$(".msgCon").empty();			
			for(var i=0;i<data.postings.length;i++)
			{ 
				//alert(data.postings[i].postingId);
				$.ajaxSettings.async = false;
				$.post("controller/foreachmessage",{"postingId":data.postings[i].postingId},function(data){			  					
					//alert(data.allreviews.length);  					
					for(var j=0;j<data.allreviews.length;j++)
					{  	
					    var html = "";
						//alert(JSON.stringify(data.allreviews[j]));
						if(data.allreviews[j].lastId == 0)
						{
							html+="<div class='msgBox'>";
							html+=	"<dl><dt><img src='Imghead/Imgpicture/"+parseInt(Math.random()*20+1)+".jpg' width='50' height='50'/></dt>";					
							html+=	"<dd>"+data.allreviews[j].firstName+"</dd></dl>";
							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px solid red;'>";			
							html+=		"<div class='msgTxt'>"+data.allreviews[j].content+"</div>";
							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a  href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";							
							html+=	"</div>";
							html+=	"<div>";
	  						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
	  						html+=			"<div class='reviewText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black; float:right;height:auto;'> </div>";
	  						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
	  						html+=		"</div>";
	  						html+=	"</div>";
	  						html+=	"<div class='reviewArea' style='width:100%;float:right;'></div>";
	  						html+="</div>";
	  						$(".msgCon").prepend(html);	
						}
						html = "";
						html+="<div  style='width:100%;float:right;'>";
						
						if(data.allreviews[j].lastId != 0)
						{  
							html+=	"<div class='messageArea' style='width:100%;overflow:hidden;border-bottom:1px dashed red;'>";
							html+=		"<div class='msgTxt'>"+data.allreviews[j].curName+" 回复 "+data.allreviews[j].otherName+":"+data.allreviews[j].content+"</div>";
							html+=		"<div class='reply' style='width:100%;'><div style='float:left;'>"+data.allreviews[j].dateTime+"</div><a href='javascript:void(0);' style='float:right;' user_id="+data.allreviews[j].userId+">回复</a></div>";
							html+=	"</div>";
						}  						  						
						
						html+=	"<div>";
						html+=		"<div class='reviewParent' style='width:100%;float:right;display:none;'>";
						html+=			"<div class='reviewOfText' contentEditable='true' style='width:100%;margin-top:2px;overflow:hidden;border:1px solid black;float:right;height:auto;'></div>";
						html+=			"<div class='review' style='float:right;'><a href='javascript:void(0)' review_id="+data.allreviews[j].reviewId+" posting_id="+data.allreviews[j].postingId+">评论</></div>";
						html+=		"</div>";
						html+=	"</div>";
						html+="</div>";
						$(".reviewArea:first").prepend(html);
					}  					
				});	  				
			} 
			if(data.uroot != 2)
			{					 
				//$(".message").attr("contenteditable",false);
				$(".reply a").attr("disabled",true);
				$(".reply a").css("pointer-events","none");				
				$("#button_login").css({display:'block'});
				$("#button_register").css({display:'block'});
				$("#button_welcome").css({display:'none'});
				$("#button_out").css({display:'none'});			
			}
		 }
	});
}

</script>

<div style="text-align:center;">
	<span><a id="firstPage">首页</a></span>
	<span><a id="prePage">上一页</a></span>
	<span><a id="nextPage">下一页</a></span>
	<span><a id="lastPage">尾页</a></span>
</div>
<script type="text/javascript">
$("#firstPage").on("click",function(){
	var pageNum = 0;	
	window.sessionStorage.setItem("curNum", pageNum);
	var pageSize = 4;
	var pageInfo = JSON.stringify({
		"page":"firstPage",
		"pageNum":pageNum,
		"pageSize":pageSize});	
	findPostings(pageInfo);
});
$("#prePage").on("click",function(){
	var pageNum = window.sessionStorage.getItem("curNum");
	pageNum = Number(pageNum) - 4;
	//alert(pageNum);
	if(pageNum < 0){
		pageNum = 0;
	}
	window.sessionStorage.setItem("curNum", pageNum);
	var pageSize = 4;
	var pageInfo = JSON.stringify({
		"page":"prePage",
		"pageNum":pageNum,
		"pageSize":pageSize});
	findPostings(pageInfo);
});
$("#nextPage").on("click",function(){
	var pageNum = window.sessionStorage.getItem("curNum");
	pageNum = Number(pageNum) + 4;
	//alert(pageNum);
	var lastPage = window.sessionStorage.getItem("lastPage");
	if(pageNum > Number(lastPage))
	{
		pageNum = lastPage;
	}
	window.sessionStorage.setItem("curNum", pageNum);
	var pageSize = 4;
	var pageInfo = JSON.stringify({
		"page":"nextPage",
		"pageNum":pageNum,
		"pageSize":pageSize});
	findPostings(pageInfo);
});
$("#lastPage").on("click",function(){
	//var pageNum = window.sessionStorage.getItem("curNum");	
	var pageSize = 4;
	var pageInfo = JSON.stringify({
		"page":"lastPage",
		"pageNum":pageNum,
		"pageSize":pageSize});
	findPostings(pageInfo);
});
</script>
<script type="text/javascript">
window.addEventListener("popstate", function(e) { 
	window.history.back();//根据自己的需求实现自己的功能 
}, false);

</script>
<!-- 版权所有者模块 -->
<div class="c_div1_3">
Copyrights © 2020 <a href="http://www.loveright.cn" >周博洋个人网站</a> www.loveright.cn, All rights reserved.ICP备案证书号:<a href="http://icp.chinaz.com/info?q=loveright.cn" >湘ICP备16019053号</a>
</div>
<!-- 版权所有者模块结束 -->
 </body>
</html>

