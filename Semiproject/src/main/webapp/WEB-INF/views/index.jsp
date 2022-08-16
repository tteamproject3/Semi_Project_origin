<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/script/weather.js" type="text/javascript"></script>   
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
					<!-- 	<li>
								<div class="search__title">여행 방법</div>
								<input type="radio" name="tripPlan" id="roundTrip" value="rountTrip" checked>
								<label for="roundTrip">왕복</label>&nbsp;&nbsp;&nbsp;
								<input type="radio" name="tripPlan" id="oneWay" value="oneWay">
								<label for="oneWay">편도</label>
						</li> -->

						<li>
							<label for="curLoc" >
								<div class="search__title">현재 위치</div>
							</label>
							<div class="input__wrapper">
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

					<!-- 	<li>
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
						</li> -->

						<li>
							<input type="submit" value="바로 검색" class="button">
						</li>
					</ul>
				</form>

				
				<input type="button" value="바로 검색" id="mainSB">
		</section>
<!-- ---------------------지도한눈에 보기~ 구글맵 전까지------------------------- -->
	
	   <!--  <div class="maps_background">
	    		<div class="maps_div">
	    			<div class="maps_content">지도에서 한눈에 찾아보기</div>
	    			<div class="maps_line"></div>
    			</div>
   			</div> -->
<!-- 	    <section class="maps">
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
		</section> -->
<!-- ---------------------googleMaps-------------------------  -->   
		<section class="gmap_section">
				<div class="gmap_search">
				</div>

				<div id="googleMapView">
				</div>
		</section>
 <!-- ---------------------------------맞춤여행지-----------------------------------  --> 
 		    <div class="search_result_div1">
	   			<div class="search_result_title">${log_NickName} 님을 위한 맞춤 여행지</div>
	   			<hr class="search_result_hr">
  			</div>
 		<section class="search_result">
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
				<c:forEach var="vo" items="${t_list}">
					<li>
					<div class="card">
						<img src="${vo.post_file1 }" alt="">
						<span class="title">${vo.post_title }</span>
						<div class="card__detail">
							<i class="fa-regular fa-heart"></i>
						</div>
					</div>
					<div class="line"></div>	
					<!-- theme description -->
					<div class="descript">
						<span class="desc__title">${vo.post_intro }</span>
						<span class="desc__content">${vo.post_content }</span>
						<a href="/userboard/boardView?post_id=${vo.post_id}"><span class="desc__detail">더보기</span></a>
					</div>
					</li>
				</c:forEach>
			</ul>
		</section>
    
		<!-- FESTIVAL BANNER -->
		<section class="festival">
			<div class="festival__title">
				<span class="title">지금 전국 각지에서는?</span>
				<br>요즘 핫한 축제 알아보기
			</div>
			<ul class="festival__list">
				<c:forEach var="vo" items="${f_list}">
				<!-- festival list -->
					<li>
					<!-- festival info -->
					<div class="festival__info">
						<img src="${vo.festivalcol }" alt="" >
						<i class="fa-regular fa-heart"></i>
						<span class="fTitle">${vo.festival_id}</span>
						<span class="fDetail">${vo.festival_place} <br></span>
						${vo.festival_start_date} ~ ${vo.festival_end_date}</br>
						<a href="${vo.festival_site }">축제 사이트로 이동</a>
					</div>
					
					</li>
				</c:forEach>
		
			</ul>
		</section>