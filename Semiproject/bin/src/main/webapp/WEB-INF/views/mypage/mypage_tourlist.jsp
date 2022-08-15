<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<!-- <script type="text/javascript" nonce="48c4560b3fc84607a9070657664" src="//local.adguard.org?ts=1659786708849&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;type=user-script"></script><link rel="stylesheet" href="https://use.typekit.net/mss6mty.css"> -->
	<link rel="stylesheet" href="/style/indexStyle.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>

	<title>On the way mypage</title>
</head>

<body>
	<!-- HEADER -->
	<header>
		<div class="header__menu">
			<i class="fa-solid fa-bars"></i>
		</div>
		<div class="header__logo">
			<a href="#">
				<span>On The Way</span>
				<i class="fa-solid fa-cart-flatbed-suitcase"></i>
			</a>
		</div>
		<div class="header__icon">
			<i class="fa-solid fa-arrow-right-from-bracket"></i>
			<i class="fa-regular fa-bell"></i>
			<i class="fa-regular fa-user"></i>
		</div>
	</header>

	<!-- PAGE TITLE 표시 바 -->
	<section class="title">
		<div class="title__bar">
			<span>마이페이지</span>
		</div>
	</section>

	<!-- BOARD -->
	<section class="board">
		<!-- BOARD NAV + BUTTON -->
		<div class="left">
			<div class="board__bar">
				<ul class="board__nav">
					<li><a href = "#">내가 쓴 글</a></li>
					<li><a href = "#">내가 쓴 댓글</a></li>
					<li class="active"><a href = "#">찜한 여행지</a></li>
					<li><a href = "#">나의후기</a></li>
				</ul>
			</div>
			
			<!-- CONTENT -->
			<div id = "board" class="board__content">
				<ul id = "board" class="content__list">
					<li><div class ="box"></div></li>
					<li><div class ="box"></div></li>
					<li><div class ="box"></div></li>
					<li><div class ="box"></div></li>
					<li><div class ="box"></div></li>
					<li><div class ="box"></div></li>
				</ul>
			<!--PAGING + BUTTON-->
				<div class="board__bottom">
					<ul class="board__page">				
						<li><input type="button" class="DelBtn" value="삭제하기"></li>
						<li><input type = "checkbox" id = "allChk" class="checkbox"></li>
						<li><a href="#"> <i id = "" class="fa-solid fa-angle-left"></i></a></li>
						<li><a href="#"> <i id = "" class="fa-solid fa-angle-right"></i></a></li>
					</ul>		
					<ul class="SearchKey">
						<li><select id ="">
							<option>최신순</option>
							<option>과거순</option>
							<option>별점순</option>
							<option>조회순</option>
						</select>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--SIDE CONTENT-->

		<div id = "board" class="side">
			<!-- 사이드 콘텐트 제목 -->
			<div class="side__bar">
				<ul class="side__nav">
					<li><a href = "#">댓글 알림</a></li>
					<li><a href = "#">{n}개</a></li>
				</ul>
			</div>

			<!-- 사이드 콘텐츠 내용 -->
			<div id = "board" class="side__content">
				<ul id = "board" class="side__list">
					<li>
						<span>[여행후기]제목샘플</span>
						댓글 샘플
					</li>
				</ul>

			</div>
		</div>
	</section>
	<!-- FOOTER -->
	<footer>
		<div class="footer__icon">
			<a href="#"><i class="fa-brands fa-facebook"></i></a>
			<a href="#"><i class="fa-brands fa-square-instagram"></i></a>
			<a href="#"><i class="fa-solid fa-share-from-square"></i></a>
		</div>
		<div class="footer__info">
			<a href="#">About Us</a> | 
			<a href="#">Support</a> |
			<a href="#">Term of Use</a> |
			<a href="#">Private Policy</a> <br>
			©2022 NoviceCoders. All Right Reserved.
		</div>
	</footer>
</body>
</html>
