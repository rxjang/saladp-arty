<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<title>Bookery</title>
<style>
 	#menu{
 		height:66px;
		line-height:40px;
		border-bottom: 1px solid #e4e4e4;
		font-size: 1.3em;
	}
	#menu a,.sub-menu a{color:black;}
	#menu a:hover, .sub-menu a:hover{
		text-decoration:none;
		background-color: rgba(255, 0, 0, 0.0) !important;/*기존 부트스트랩 색깔 투명하게 설정*/
	}
	#menu ul{padding:4px 0px;}
	.nav li{float:left;}
	.real-menu{padding:0px;} 
	.menu-setting{padding-left:80px;}/*좌측 적당한 공간 띄움*/
	.pull-right{padding:23px 80px;}
	.jung{color:white;}/*#처음에 안보이게*/
	.dropdown-toggle:active, .open .dropdown-toggle {
		position:absoulte;
		right:0px;
        background:white !important; 
        color:#000 !important;
		text-decoration: none;
    }
    .dropdown-menu{/*드롭다운 메뉴 이동 방지*/
    	right:90;
    	left:auto;
    }
    
    /*******************서브메뉴 CSS*******************/
    .sub-menu{
    	height:44px;
		border-bottom: 1px solid #e4e4e4;
    }
    .mylib-menu{left:25%;}
    
    
	@media (max-width:1000px) {/*작은 화면용 CSS*/
		#menu{
			height:50px;
			border-bottom:0px;
		}
		.menu-setting{padding:0px 25px;}
		.pull-right{padding:23px 25px;}
		.real-menu{
			position:fixed;
			bottom:0;
			border-top:1px solid #e4e4e4;
			height:66px;
			color:#666666;
		}
		.add-jung{font-size:0.7em;}
		.nav{
			width:100%;
		}
		.menu-icon{
			padding-top:0px;
			font-size:1.4em;
		}
		.dropdown-menu{/*드롭다운 메뉴 이동 방지*/
    		right:35;
    		left:auto;
    	}
    	.nav>li>a {
			padding-top:0px}
	    /*******************모바일 서브메뉴 CSS*******************/
    	.sub-menu{
    		position:fixed;
    		top:50;
    		height:30px;
			border-bottom: 0px;
			float: left;
 	   }
 	   .mylib-menu{left:auto;}/**pc버전의 left속성 없앰**/
	}
</style>
<script type="text/javascript">
var mql = window.matchMedia("screen and (max-width: 1000px)");

mql.addListener(function(e) {
    if(e.matches) {
    	mobile();
    } else {
    	pc();
    }
});//넓이 변경시 이벤트 발생

$(function(){
	  $('.add-jung').mouseenter(function(){
	    $(this).children().css('color','black');
		$(this).css('font-weight','bold');
	  });
	  $('.add-jung').mouseleave(function(){
	    $(this).children().css('color','white');
	    $(this).css('font-weight','normal').css('background-color','none');
	  });
	  
	  $(".nav li").click( function() { 
          $(this).css("background-color", "rgba(255, 0, 0, 0.0)");
       });
		
		if (mql.matches) {
		    mobile();
		} else {
			pc()
		}//최초 접속 상태로 판단
	});
	
function mobile(){
	$('.real-menu').addClass('col-xs-12');
	$('.nav').css('text-align','center').css('position','realtive');
	$('.nav li').css('float','none').css('display','inline-block').css('margin','auto');
	$('.jung').text('');
	$( "<span class=\"menu-icon glyphicon glyphicon-pencil\"></span>" ).insertBefore( ".menu-today" );
	$( "<span class=\"menu-icon glyphicon glyphicon-book\"></span>" ).insertBefore( ".menu-mylib" );
	$( "<span class=\"menu-icon glyphicon glyphicon-link\"></span>" ).insertBefore( ".menu-club" );
	$( "<span class=\"menu-icon glyphicon glyphicon-search\"></span>" ).insertBefore( ".menu-search" );
	$( "<span class=\"menu-icon glyphicon glyphicon-comment\"></span>" ).insertBefore( ".menu-news" );
}
function pc(){
	$('.real-menu').removeClass('col-xs-12');
	$('.nav').css('text-algin','none');
	$('.nav li').css('float','left').css('display','inline');
	$('.jung').text('#');
	$('.menu-icon').remove();
}

</script>
</head>
<body>
<div class="container-fluid">
	<div id="menu" class="row">
	<!-- 로고 위치 -->
		<div class="col-xs-6 col-md-2 menu-setting">
			<h3><a href="#">Bookery</a></h3>
		</div>
	<!--메인 메뉴 위치 -->
		<div class="col-md-8 real-menu">
		<ul class="nav">
			<li><a href="#" class="add-jung menu-today"><span class="jung"></span>오늘의 기록</a></li>
			<li><a href="#" class="add-jung menu-mylib"><span class="jung"></span>내서재</a></li>
			<li><a href="#" class="add-jung menu-club"><span class="jung"></span>북클럽</a></li>
			<li><a href="#" class="add-jung menu-search"><span class="jung"></span>검색</a></li>
			<li><a href="#" class="add-jung menu-news"><span class="jung"></span>책거리 뉴스</a></li>
		</ul>
		</div>
	<!-- 설정 메뉴 위치 -->
		<div class="col-xs-6 col-md-2">
		 <a class="dropdown-toggle pull-right" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
	         <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
	     </a>
	     <ul class="dropdown-menu" role="menu">
	       <li><a href="#">내 정보</a></li>
	       <li role="separator" class="divider"></li>
	       <li><a href="#">로그아웃</a></li>
	       </ul>
		</div>
	</div><!-- #menu end -->
	<!-- **********content start**********--> 

	<!--**********content end**********-->  
</div><!-- #container-fluid end -->
</body>
</html>
