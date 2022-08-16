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
				<form id="form12">
					<ul>
						<li>
							<label for="curLoc" >
								<div class="search__title">현재 위치</div>
							</label>
							<div class="input__wrapper">
								<select name="" class="search_box_1" id="se1">
					              <option value>시/도 선택</option>
					              <option value="37.8603672A128.3115261">강원</option>
					              <option value="37.4363177A127.550802">경기</option>
					              <option value="35.4414209A128.2417453">경남</option>
					              <option value="36.6308397A128.962578">경북</option>
					              <option value="35.160032A126.851338">광주</option>
					              <option value="35.87139A128.601763">대구</option>
					              <option value="36.3504396A127.3849508">대전</option>
					              <option value="35.179816A129.0750223">부산</option>
					              <option value="37.5666103A126.9783882">서울</option>
					              <option value="35.5394773A129.3112994">울산</option>
					              <option value="37.4559418A126.7051505">인천</option>
					              <option value="34.9007274A126.9571667">전남</option>
					              <option value="35.6910153A127.2368291">전북</option>
					              <option value="33.4273366A126.5758344">제주</option>
					              <option value="36.6173379A126.8453965">충남</option>
					              <option value="36.7853718A127.6551404">충북</option>
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


						<li>
							<input type="button" value="바로 검색" class="button">
						</li>
					</ul>
				</form>

				<ul class="nBtn" >
					<li><input type="button" value="바로 관광지 검색" class="button" id="mainSB"></li>
					<li><input type="button" value="바로 축제 검색"  class="button" id="mainSB2"></li>
				</ul>
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
	   			<div class="search_result_title">${logNickName} 님을 위한 맞춤 여행지</div>
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
					<form class="p_save_${vo.post_id }" method="post" action="/mypage/postSave" > 
					<!-- <form class="p_save"> -->
						<input type="hidden" name="post_title" value="${vo.post_title }">
						<input type="hidden" name="post_file1" value="${vo.post_file1 }">
						<input type="hidden" name="post_content" value="${vo.post_content }">
						<li>
						<div class="card">
							<img src="${vo.post_file1 }" alt="">
							<span class="title">${vo.post_title }</span>
							<div class="card__detail">
								<div class="saved_1"><i class="fa-regular fa-heart "></i></div>
							</div>
							<input type="hidden" name="post_id" value="${vo.post_id }">
						</div>
						<div class="line"></div>	
						<!-- theme description -->
						<div class="descript">
							<span class="desc__title">${vo.post_intro }</span>
							<span class="desc__content">${vo.post_content }</span>
							<a href="/userboard/boardView?post_id=${vo.post_id}"><span class="desc__detail">더보기</span></a>
						</div>
						</li>
					</form>
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
					<%--   --%>
					<!-- festival list -->
						<li>
						<form class="p_save_${vo.festival_num }" method="post" action="/mypage/newSave" >
						<input type="hidden" name="saved_title" value="${vo.festival_id }" >
						<input type="hidden" name="saved_url" value="${vo.festivalcol }" >
						<input type="hidden" name="saved_content" value="${vo.festival_content }" >
						
						<!-- festival info -->
						<div class="festival__info">
							<img src="${vo.festivalcol }" alt="" >
							<div class="saved_2"><i class="fa-regular fa-heart saved"></i></div>
							<span class="fTitle">${vo.festival_id}</span>
							<span class="fDetail">${vo.festival_place} <br></span>
							${vo.festival_start_date} ~ ${vo.festival_end_date}</br>
							<a href="${vo.festival_site }">축제 사이트로 이동</a>
							
						</div>
						<input type="hidden" value="${vo.festival_num }" >
						</form>
						</li>
					
				</c:forEach>
		
			</ul>
		</section>