<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 웹표준 최신버전으로 호환 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><!-- 뷰포트메타태그를 사용하여 창크기를 조절하면서 뷰포트 크기 조절가능 -->
    <link rel="stylesheet" href="https://use.typekit.net/mss6mty.css"><!-- 어도비폰트css -->
	<link rel="stylesheet" href="/style/indexStyle.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script><!-- css로 가능한 이모티콘관련 링크 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="/script/indexScript.js" type="text/javascript"></script>
	
    <title>On The Way</title>
</head>
<body>
    <!-- HEADER -->
	<header>
		<div class="header__menu">
			<i class="fa-solid fa-bars"></i>
		</div>
		<div class="header__logo">
			<a href="#">
                <i class="fa-solid fa-plane-departure"></i>
                <span>On The Way</span>
			</a>
		</div>
		<div class="header__icon">
			<!-- <i class="fa-solid fa-arrow-right-from-bracket"></i> -->
			<i class="fa-regular fa-bell"></i>
			<i class="fa-regular fa-user"></i>
		</div>
	</header>

	<nav>
		<ul>
			<li><a href="#">홈페이지 소개</a></li>
			<li><a href="#">게시판</a></li>
			<li><a href="#">이용약관</a></li>
			<li><a href="#">개인정보보호정책</a></li>
			<li><a href="#">고객문의</a></li>
		</ul>
	</nav>

		<!-- TITLE + SEARCH AREA -->
    <div class="top">
			<div>
				<div class="main_title">On The Way</div>
				지금 당신이 향해야 할 곳은 바로 여기
			</div>
		</div>
    <section class="search">

				<!-- SEARCH FORM -->
				<form method="" action="" >
					<ul>
						<li>
								<div class="search__title">여행 방법</div>
								<input type="radio" name="tripPlan" id="roundTrip" value="rountTrip" checked>
								<label for="roundTrip">왕복</label>&nbsp;&nbsp;&nbsp;
								<input type="radio" name="tripPlan" id="oneWay" value="oneWay">
								<label for="oneWay">편도</label>
						</li>

						<li>
							<label for="curLoc" >
								<div class="search__title">현재 위치</div>
							</label>
							<div class="input__wrapper">
								<input class="input__box" type="text" id="curLoc" name="curLoc">
								<div>
									<i class="fa-solid fa-location-crosshairs"></i>
									<i class="fa-solid fa-magnifying-glass"></i>
								</div>
							</div>
						</li>

						<li>
							<label for="intinerary" >
								<div class="search__title">여행 날짜</div>
							</label>
							<input type="date" class="input__box" id="intinerary" name="intinerary" 
							value="2022-08-16" min="2022-08-16" max="2022-12-16"> 
							<!-- 차후 현재 날짜에 따라 변경할 것 -->
						</li>

						<li>
							<div class="search__title">이동수단</div>
							<select class="input__box" id="transfort" >
								<option value="train">기차</option>
								<option value="car">차량</option>
								<option value="bus">버스</option>
								<option value="walk">도보</option>
							</select>
						</li>

						<li>
							<div class="search__title">이동거리</div>
							<select class="input__box" id="distance" >
								<option value="range_1">0km ~ 10Km</option>
								<option value="range_1">10Km ~ 30Km</option>
								<option value="range_1">30Km ~ 100Km</option>
								<option value="range_1">100Km ~ 200Km</option>
								<option value="range_1">200Km ~ 300Km</option>
								<option value="range_1">300Km ~ 400Km</option>
								<option value="range_1">400Km ~ </option>
							</select>
						</li>

						<li>
							<input type="submit" value="바로 검색" class="button">
						</li>
					</ul>
				</form>
		</section>
		
		<!-- WEATHER BANNER -->
    <section class="weather">
			<div class="weather__title">
				<div class="title">지금 여행하기 좋은 곳은?</div>
				전국의 날씨 알아보기
			</div>
			<!-- 날씨 정보 -->
			<div class="weather__list">
				<i class="fa-solid fa-angle-left"></i>
				<!-- 도시+날씨 리스트 -->
					<ul class="weather__info">
						<li>
							<!-- 도시별 이름+날씨 아이콘+기온-->
							<ul class="weather__detail">
								<li class="wIcon"><i class="fa-solid fa-cloud-sun"></i></li>
								<li class="wTemp">28 &#8451;</li>
								<li class="wCity">서울</li>
							</ul>
						</li>
						<li>
							<ul class="weather__detail">
								<li class="wIcon"><i class="fa-solid fa-sun"></i></li>
								<li class="wTemp">31 &#8451;</li>
								<li class="wCity">대전</li>
							</ul>
						</li>
						<li>
							<ul class="weather__detail">
								<li class="wIcon"><i class="fa-solid fa-sun"></i></li>
								<li class="wTemp">33 &#8451;</li>
								<li class="wCity">부산</li>
							</ul>
						</li>
						<li>
							<ul class="weather__detail">
								<li class="wIcon"><i class="fa-solid fa-cloud-rain"></i>    </li>
								<li class="wTemp">26 &#8451;</li>
								<li class="wCity">제주</li>
							</ul>
						</li>
					</ul>
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="weather__page">
				<i class="fa-regular fa-circle"></i>
				<i class="fa-regular fa-circle"></i>
				<i class="fa-solid fa-circle"></i>
				<i class="fa-regular fa-circle"></i>
			</div>
		</section>
    
		<!-- THEME RECOMMENDATION -->
		<section class="theme">
			<div class="theme__title">
				평범한 여행은 이제 재미없어! <br>
				<span class="title">이번 주 테마 여행은 어떠신가요?</span>
			</div>
			<!-- theme section -->
			<ul class="theme__list">
				<li>
					<!-- theme card -->
					<div class="card">
						<img src="img/nightsky-view.jpg" alt="">
						<span class="title">한옥 카페 시리즈</span>
						<div class="card__detail">
							★ 4.5
							<i class="fa-regular fa-heart"></i>
						</div>
					</div>
					<div class="line"></div>	
					<!-- theme description -->
					<div class="descript">
						<span class="desc__title">평범한 카페는 이제 그만</span>
						<span class="desc__content">여행의 매력은 무궁무진하겠지만, 그 중 하나는
							“일상에서 벗어난 낯섦에 대한 기대”이지 않을까?
							
							이 점에서 여행지에서 만나는 한옥카페는 여러분에게 낯선 공간을 제공하며 새로운 분위기를 만들어줄 수 있을 거예요. 대한민국 테마여행 10선 여행 중 만나는 한옥카페, 조용하고 고즈넉한 분위기 속에서 그 새로운 공간을 누려보는 건 어떨까요? </span>
						<a href="#"><span class="desc__detail">더보기</span></a>
					</div>
				</li>
				<li>
					<!-- theme card -->
					<div class="card">
						<img src="img/nightsky-view.jpg" alt="">
						<span class="title">한옥 카페 시리즈</span>
						<div class="card__detail">
							★ 4.5
							<i class="fa-regular fa-heart"></i>
						</div>
					</div>
					<div class="line"></div>	
					<!-- theme description -->
					<div class="descript">
						<span class="desc__title">평범한 카페는 이제 그만</span>
						<span class="desc__content">여행의 매력은 무궁무진하겠지만, 그 중 하나는
							“일상에서 벗어난 낯섦에 대한 기대”이지 않을까?
							
							이 점에서 여행지에서 만나는 한옥카페는 여러분에게 낯선 공간을 제공하며 새로운 분위기를 만들어줄 수 있을 거예요. 대한민국 테마여행 10선 여행 중 만나는 한옥카페, 조용하고 고즈넉한 분위기 속에서 그 새로운 공간을 누려보는 건 어떨까요? </span>
						<a href="#"><span class="desc__detail">더보기</span></a>
					</div>
				</li>
				<li>
					<!-- theme card -->
					<div class="card">
						<img src="img/nightsky-view.jpg" alt="">
						<span class="title">한옥 카페 시리즈</span>
						<div class="card__detail">
							★ 4.5
							<i class="fa-regular fa-heart"></i>
						</div>
					</div>
					<div class="line"></div>	
					<!-- theme description -->
					<div class="descript">
						<span class="desc__title">평범한 카페는 이제 그만</span>
						<span class="desc__content">여행의 매력은 무궁무진하겠지만, 그 중 하나는
							“일상에서 벗어난 낯섦에 대한 기대”이지 않을까?
							
							이 점에서 여행지에서 만나는 한옥카페는 여러분에게 낯선 공간을 제공하며 새로운 분위기를 만들어줄 수 있을 거예요. 대한민국 테마여행 10선 여행 중 만나는 한옥카페, 조용하고 고즈넉한 분위기 속에서 그 새로운 공간을 누려보는 건 어떨까요? </span>
						<a href="#"><span class="desc__detail">더보기</span></a>
					</div>
				</li>
			</ul>
		</section>
    
		<!-- FESTIVAL BANNER -->
		<section class="festival">
			<div class="festival__title">
				<span class="title">지금 전국 각지에서는?</span>
				<br>요즘 핫한 축제 알아보기
			</div>
			<ul class="festival__list">
				<!-- festival list -->
				<li>
					<!-- festival info -->
					<div class="festival__info">
						<img src="img/city-view.jpg" alt="" >
						<i class="fa-regular fa-heart"></i>
						<span class="fTitle">2022 목포문화재야행</span>
						<span class="fDetail">전라남도 목포시 <br></span>
						2022. 7. 29. ~ 30. / 18:00 ~ 22:00
					</div>
				</li>
				<li>
					<!-- festival info -->
					<div class="festival__info">
						<img src="img/city-view.jpg" alt="" >
						<i class="fa-regular fa-heart"></i>
						<span class="fTitle">2022 목포문화재야행</span>
						<span class="fDetail">전라남도 목포시 <br></span>
						2022. 7. 29. ~ 30. / 18:00 ~ 22:00
					</div>
				</li><li>
					<!-- festival info -->
					<div class="festival__info">
						<img src="img/city-view.jpg" alt="" >
						<i class="fa-regular fa-heart"></i>
						<span class="fTitle">2022 목포문화재야행</span>
						<span class="fDetail">전라남도 목포시 <br></span>
						2022. 7. 29. ~ 30. / 18:00 ~ 22:00
					</div>
				</li><li>
					<!-- festival info -->
					<div class="festival__info">
						<img src="img/city-view.jpg" alt="" >
						<i class="fa-regular fa-heart"></i>
						<span class="fTitle">2022 목포문화재야행</span>
						<span class="fDetail">전라남도 목포시 <br></span>
						2022. 7. 29. ~ 30. / 18:00 ~ 22:00
					</div>
				</li>
			</ul>
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