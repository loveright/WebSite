window.onload = function(){
	var oHead = document.getElementById('head');
	var oAudio = document.getElementById('audio');
	oAudio.controls = false;
	oAudio.autoplay = true;
	oHead.onclick = function(){
		window.open('MyLife.jsp');		
	}
	var oInput_button = document.getElementById('input_button');
	oInput_button.onclick = function(){
		window.open('MyLife.jsp');
	}
	var css = {
		'border-radius': '70px',
		'margin': '90px auto',
		'transform': 'scale(0.9)',
		'-ms-transform': 'scale(0.9)',
		'filter':'Alpha(opacity=70)',
		'opacity':'0.7'
	};
	var flag = true;
	var time = setInterval(function() {		
		if(flag)
		{
			$("#head").css(css);
			flag = false;
		}else{
			$("#head").css({
				'border-radius': '',
				'margin': '',
				'transform': '',
				'-ms-transform': '',
				'filter':'',
				'opacity':''
			});
			flag = true;
		}            		
    }, 1000);
	time;
	/*
	oAudio.addEventListener('ended', function () {  
    alert('over');
	}, false);
	/*
	var oHeadID = document.getElementById('head');
	var oHead1ID = document.getElementById('head1');
	oHeadID.onmouseover = function(){
		clearInterval(timer);
		var timer = setInterval(function(){
			var h1 = parseInt(getStyle(oHeadID,'height'))-1;
			var w1 = parseInt(getStyle(oHeadID,'width'))-1;
			var m1 = parseInt(getStyle(oHead1ID,'marginTop'))+1;
			oHeadID.style.height = h1+"px";
			oHeadID.style.width = w1+"px";
			oHead1ID.style.marginTop = m1+"px";
			if(h1 == 108)
			{
				//oHeadID.style.filter = "alpha(opacity:70)";
				oHeadID.style.opacity = 0.5;
				//oHeadID.style.-moz-opacity = 0.7;
				//location="MyWork.html";
				clearInterval(timer);
			}
			if(h1 < 108)
			{
				h1 = 108;
				oHeadID.style.opacity = 0.5;
				//location = "MyWork.html";
				clearInterval(timer);
			}
		},600);
	}
	oHeadID.onmouseout = function(){
		clearInterval(timer);
		var timer = setInterval(function(){
			var h1 = parseInt(getStyle(oHeadID,'height'))+1;
			var w1 = parseInt(getStyle(oHeadID,'width'))+1;
			var m1 = parseInt(getStyle(oHead1ID,'marginTop'))-1;
			oHeadID.style.height = h1+"px";
			oHeadID.style.width = w1+"px";
			oHead1ID.style.marginTop = m1+"px";
			if(h1 == 115)
			{
				oHeadID.style.opacity = 1;
				clearInterval(timer);
			}
			if(h1 > 115)
			{
				h1 = 115;
				oHeadID.style.opacity = 1;
				clearInterval(timer);
			}
		},600);
	}
	oHeadID.onclick = function(){
		location = "MyWork.html";
	}
	
	var timer1 = setInterval(function(){
		//clearInterval(timer1);
		location = "MyWork.html";
		clearInterval(timer1);
	},6000);
	
	function getStyle(obj,attr){
		   return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj)[attr];
		}
		*/
}