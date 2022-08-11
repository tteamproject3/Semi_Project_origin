

		<!-- TITLE + SEARCH AREA -->
    <div class="top">
			<div>
				<div class="main_title">On The Way</div>
				지금 당신이 향해야 할 곳은 바로 여기
			</div>
		</div>
    <section class="search">

				<!-- SEARCH FORM -->
				<form method="get" action="DBdata/festData" >
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
									<i class="fa-solid fa-location-crosshairs" id="GPS"></i> <!-- 사용자 위치 받아오는 버튼 -->
									<i class="fa-solid fa-magnifying-glass"></i>
								</div>
							</div>
						</li>

						<li class="Itnr">
							<label>
								<div class="search__title">여행 날짜</div>
							</label>
							<input type="date" class="input__box" id="start_Itnr" name="start_Itnr"> ~ 
							<input type="date" class="input__box" id="end_Itnr" name="end_Itnr"> 
						</li>

						<li>
							<div class="search__title">이동수단</div>
							<select class="input__box" id="transfort" >
								<option value="">-</option>
								<option value="train">기차</option>
								<option value="car">차량</option>
								<option value="bus">버스</option>
								<option value="walk">도보</option>
							</select>
						</li>

						<li>
							<div class="search__title">이동거리</div>
							<select class="input__box" id="distance" >
								<option value="">-</option>
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
<!-- ---------------------지도한눈에 보기~ 구글맵 전까지------------------------- -->
							<input type="button" value="바로 검색" class="aasz">
	    	<div class="maps_background">
	    		<div class="maps_div">
	    			<div class="maps_content">지도에서 한눈에 찾아보기</div>
	    			<div class="maps_line"></div>
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
		<!-- WEATHER BANNER -->
    <section class="weather">
			<div class="weather__title">
				<div class="title">지금 여행하기 좋은 곳은?</div>
				전국의 날씨 알아보기
			</div>
			<!-- 날씨 정보 -->
			<div class="weather__list">
				<i class="fa-solid fa-angle-left" id="wLeft"></i>
				<!-- 도시+날씨 리스트 -->
				<div class="wVertical">
					<ul class="weather__info_1">
							<!-- 도시별 이름+날씨 아이콘+기온-->
					</ul>
					<ul class="weather__info_2">
							
					</ul>
				</div>
				<i class="fa-solid fa-angle-right" id="wRight"></i>
			</div>
			<div class="weather__page">	
				<li><i class="fa-regular fa-circle"></i></li>
				<li><i class="fa-regular fa-circle"></i></li>
				<li><i class="fa-regular fa-circle"></i></li>
				<li><i class="fa-regular fa-circle"></i></li>
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

