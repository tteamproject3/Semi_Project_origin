<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<link rel="stylesheet" href="/style/indexStyle.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="/script/indexScript.js" type="text/javascript"></script>
	
    <title>OnTheWay</title>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwSEWBBCWNZzbZ6_ItQYHifWBj_gVVgWQ&region=kr"></script>
<script>
	$(document).ready(function($) {
	    initMap();
	});
	function categoryChange(e) {
		  const state = document.getElementById("search_box_2");
	
		  const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		  const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
		  const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
		  const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		  const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
		  const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
		  const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
		  const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		  const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		  const ulsan = ["남구","동구","북구","중구","울주군"];
		  const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
		  const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		  const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
		  const jeju = ["서귀포시","제주시","남제주군","북제주군"];
		  const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
		  
	
		  if (e.value == "general01") {
		    add = gangwon;
		  } else if (e.value == "general02") {
		    add = gyeonggi;
		  } else if (e.value == "general03") {
		    add = gyeongsangnam;
		  } else if (e.value == "general04") {
		    add = gyeongsangbuk;
		  } else if (e.value == "general05") {
		    add = gwangju;
		  } else if (e.value == "general06") {
		    add = daegu;
		  } else if (e.value == "general07") {
		    add = daejeon;
		  } else if (e.value == "general08") {
		    add = busan;
		  } else if (e.value == "general09") {
		    add = seoul;
		  } else if (e.value == "general10") {
		    add = ulsan;
		  } else if (e.value == "general11") {
		    add = incheon;
		  } else if (e.value == "general12") {
		    add = jeonnam;
		  } else if (e.value == "general13") {
		    add = jeonbuk;
		  } else if (e.value == "general14") {
		    add = jeju;
		  } else if (e.value == "general15") {
		    add = chungnam;
		  } else if (e.value == "general16") {
		    add = chungbuk;
		  }
	
		  state.options.length = 1;
		  // 군/구 갯수;
	
			for (property in add) {
				let opt = document.createElement("option");
				opt.value = add[property];
				opt.innerHTML = add[property];
				state.appendChild(opt);
			}
	}
</script>
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
		<!-- ---------------------지도한눈에 보기~ 구글맵 전까지------------------------- -->
	    	<div class="maps_background">
	    		<div class="maps_div">
	    			<div class="maps_content">지도에서 한눈에 찾아보기</div>
	    			<hr style="width:50%;height:10px;border:none;background-color:white;margin: auto;">
    			</div>
   			</div>
	    <section class="maps">
   			<div class="maps_search">
   				<div class="maps_search_subject">세부 검색 설정</div>
   				<div class="maps_search_content">
		          <div class="search_box">
		          	<span>지역/권역</span>
		            <select name="" class="search_box_1" onchange="categoryChange(this)">
		              <option value>시/도 선택</option>
		              <option value="general01">강원</option>
		              <option value="general02">경기</option>
		              <option value="general03">경남</option>
		              <option value="general04">경북</option>
		              <option value="general05">광주</option>
		              <option value="general06">대구</option>
		              <option value="general07">대전</option>
		              <option value="general08">부산</option>
		              <option value="general09">서울</option>
		              <option value="general10">울산</option>
		              <option value="general11">인천</option>
		              <option value="general12">전남</option>
		              <option value="general13">전북</option>
		              <option value="general14">제주</option>
		              <option value="general15">충남</option>
		              <option value="general16">충북</option>
		            </select>
		          </div>
	          
		          <div class="search_box">
		          	<span>시/구/군</span>
		            <select name="" id="search_box_2">
		              <option>군/구 선택</option>
		            </select>
		          </div>
				</div>
   			</div>
		</section>
<!-- ---------------------googleMaps-------------------------  -->   
		<section class="gmap_section">
				<div class="gmap_search">
					<form>
					</form>
				</div>
				<div id="googleMapView">
					<script>
					  	var map;
						var latitude = 37.5729503;
						var longitude = 126.9793578;			
						var lat = [37.562685,37.462685,37.7862685];
						var log = [126.8793578,126.8393578,126.8893578];
						function initMap() {
							var myCenter = new google.maps.LatLng(latitude, longitude)
							var mapProperty = {
								center : myCenter,
								zoom : 10,
								mapTypeId : google.maps.MapTypeId.ROADMAP
							};
							var map = new google.maps.Map(document
							.getElementById('googleMapView'), mapProperty);
						}
					</script>
				</div>
		</section>
 <!-- ---------------------------------맞춤여행지-----------------------------------  -->  
 		<section class="search_result">
		    <div class="search_result_div1">
	   			<div class="search_result_title">${user_nickname} 님을 위한 맞춤 여행지</div>
	   			<hr class="search_result_hr">
  			</div>
  			<div class="touristSpot">
	  			<div class="touristSpot_img">img파일 어디서구하지?</div>
	  			<!-- 이미지파일을 구하는 방법을 정하면 그때가서 동그라미로 자르기 -->
	  			<div class="touristSpot_div">
		  			<div class="touristSpot_subject">은평역사한옥박물관</div>
		  			<br/>
		  			<spen>관광지 소개<br/></spen>
		  			<div class="touristSpot_content">은평구의 문화유산과 한옥의 전통을 소개하는 박물관</div>
		  			<div class="touristSpot_tel">관광지 관리기관 전화번호: 02-351-8525</div>
			  		<div class="touristSpot_div2">
			  		<div class="touristSpot_parking">주차가능공간: 26</div>
			  		<div class="touristSpot_raiting">평점★: 4.6 &nbsp; &nbsp; <input class="touristSpot_fav" type="button" value="❤"/></div>
			  		</div>
	  			</div>	
  			</div>
  			<br/>
  			<div class="touristSpot">
	  			<div class="touristSpot_img">img파일 어디서구하지?</div>
	  			<!-- 이미지파일을 구하는 방법을 정하면 그때가서 동그라미로 자르기 -->
	  			<div class="touristSpot_div">
		  			<div class="touristSpot_subject">은평역사한옥박물관</div>
		  			<br/>
		  			<spen>관광지 소개<br/></spen>
		  			<div class="touristSpot_content">은평구의 문화유산과 한옥의 전통을 소개하는 박물관</div>
		  			<div class="touristSpot_tel">관광지 관리기관 전화번호: 02-351-8525</div>
			  		<div class="touristSpot_div2">
			  		<div class="touristSpot_parking">주차가능공간: 26</div>
			  		<div class="touristSpot_raiting">평점★: 4.6 &nbsp; &nbsp; <input class="touristSpot_fav" type="button" value="❤"/></div>
			  		</div>
	  			</div>	
  			</div>
  			<br/>
  			<!-- 축제 관련해서도 추후에 추가해야함 -->
 		</section>
 <!-- ------------------------------------------------------------------------------------------------------  -->    
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