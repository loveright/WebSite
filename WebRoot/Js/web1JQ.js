$(function(){
	
	var mark=1; //打开
	$(".clickBut").click(function(){
		clearInterval(timer);
		if(mark==0){
			$(".MusicCon").animate({width:"22px"},700);
			mark=1;//关闭
		}else{
			$(".MusicCon").animate({width:"420px"},700);
			mark=0;//打开
		}
	});
	var timer = setInterval(function(){
		$(".MusicCon").animate({width:"auto"},700);
		mark=0;
		clearInterval(timer);
	},10000);
	var mark1 = 0;
	$("a.play").click(function(){
		
		if(mark1==0)
		{
			$("a.play img")[0].src = "Img/11.png";
			$("#audio")[0].pause();//暂停
			//alert($("#audio")[0].ended);
			//alert($("#audio")[0].currentTime);
			mark1 = 1;
		}else{
			$("a.play img")[0].src = "Img/4.png";
			$("#audio")[0].play();//播放
			mark1 = 0;
		}
	});
	var songName = ["Peaks","The Way I Still Love You","You","浮白","逆流时光","Experience"];
	var imgSrc = ['Img/sugar.jpg','Img/joy.jpg','Img/you.jpg','Img/bigbang.jpg','Img/Flemington.jpg','Img/experience.jpg'];
	var songSrc = [
	//'http://link.hhtjim.com/163/4014002.mp3',
	'http://link.hhtjim.com/163/550606504.mp3',//Peaks
	'http://link.hhtjim.com/163/28718313.mp3',//The Way I Still Love You
	'http://link.hhtjim.com/163/3932159.mp3',//you
	'http://link.hhtjim.com/163/1336866698.mp3',//浮白
	'http://link.hhtjim.com/163/30394202.mp3',//逆流时光
	'http://link.hhtjim.com/163/26484066.mp3'//
	];
	var num = 0;
	function picTab()
	{
		//alert(num+"sd");
		$("#audio")[0].src = songSrc[num];
		$("#dt_img")[0].src = imgSrc[num];
		
		if(songName[num].length > 15)
		{
			
			$("dd").css("line-height","");
			$("dd").css("margin-top","15px");
			$("#dd_text")[0].innerHTML = songName[num];
		}else{
			
			$("dd").css("line-height",'90px');
			$("dd").css("margin-top","");
			$("#dd_text")[0].innerHTML = songName[num];
		}
		//alert(songName[num].length);
		$("a.play img")[0].src = "Img/4.png";
		$("#audio")[0].play();
		mark1 = 0;
	};
	
	picTab();
	
	$("a.next").click(function(){
		num ++;
		if(num>5)
		{
			num=0;	
		}
		picTab();		
	});
	
	$("a.prev").click(function(){
		num --;	
		if(num==-1)
		{
			num=imgSrc.length-1;	
		}
		picTab();
	});
	/*
	$("#audio")[0].bind('ended',function () {
		num ++;
		if(num>5)
		{
			num=0;	
		}
		picTab();
   		//alert("w我们r");
	});
	*/
	/*
	$("#audio").bind('ended',functon(){
		alert("lalala");
	});
	*/
	$(this).find('#audio').bind('ended',function () {
		num ++;
		if(num>5)
		{
			num=0;	
		}
		picTab();
	});
	
});