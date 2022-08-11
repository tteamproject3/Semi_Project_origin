$(function(){
	// ------ header + nav ------
	// 햄버거 메뉴 클릭 이벤트
	var show = false;
	// 클릭 시 block/none 반복
	$(".header__menu").on('click',function(){
		if(show){
			$("nav").children('ul').css('display','none');
			show = false;
		}else{
			$("nav").children('ul').css('display','block');
			show = true;
		}
	});	
	//nav에서 마우스 아웃시 none
	$("nav").on({mouseenter:function(){
		$("nav").children('ul').css('display','block');
		show = true;
	}, mouseleave:function(){
		$("nav").children('ul').css('display','none');
		show = false;
	}})

	// ----- search ------
	// 선택 중인 select_title 색상 변경
	$(".search ul>li").on({mouseenter:function(){
		$(this).children('.search__title').css('color','#5e7ca0');
		$(this).children('label').children('.search__title').css('color','#5e7ca0');
	}, mouseleave:function(){
		$(this).children('.search__title').css('color','black');
		$(this).children('label').children('.search__title').css('color','black');
	}});
	//현재위치 넣기
	//현재위치 검색하기 


	//날짜입력창에 현재날짜 넣기 
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	$('#start_Itnr').val(dateString);
	$('#end_Itnr').val(dateString);

	//날짜 최대 입력값 제한 : 4개월 이후 
	today.setMonth(today.getMonth() + 4);
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	$('#start_Itnr').attr('max',dateString);
	$('#end_Itnr').attr('max',dateString);


	// 유효성 검사
	$('#search').submit(function(){
		if($('.tripPlan').val()==''){
			alert("여행 방법을 선택해주세요.");	
			return false;	
		}
		if($('#curLoc').val()==''){
			alert("현재 위치를 입력해주세요.");	
			return false;	
		}	
		if($('#intinerary').val()==''){
			alert("여행 일정을 입력해주세요.");	
			return false;	
		}	
		if($('#transfort').val()==''){
			alert("이동 수단을 입력해주세요.");	
			return false;	
		}	
		if($('#distance').val()==''){
			alert("이동 거리를 입력해주세요.");	
			return false;	
		}	
		return true;
	});
	// ----- Weather Theme ------
	// openweather api에서 날씨 불러오기
	// key: c33d4e9868e43efdaaf477c172906bb8
	// 주요 도시 영문명 리스트

	var engCity_1 = ["Seoul", "Incheon", "Suwon-si","Seongnam-si","Paju", "Icheon-si","Pyeongtaek-si","Chuncheon",
	"Wŏnju" ,"Gangneung","Daejeon","Hongseong","Cheongju-si","Chungju","Gwangju", "Mokpo",
	"Yeosu","Suncheon","Boseong","Naju"];

	var engCity_2 = ["Gochang","Muju","Busan","Ulsan","Masan","Changwon","Jinju","Imsil","Goseong","Daegu","Andong",
	"Junju","Gunsan","Haenam","Namwon","Koch'ang","Pohang", "Gyeongju","Ulchin","Tonghae","Jeju-do"];
	
	// 주요 도시 한국명 리스트 
	var korCity_1 = ['서울','인천','수원','성남','파주','이천','평택','춘천','원주','강릉','대전',
		'세종','홍성','청주','충주','광주','목포','여수','순천','보성','나주'];
	var korCity_2 = ['고창','무주','부산','울산','마산','창원','진주','임실','통영', '대구','안동',
	'전주','군산','해남','남원','고창', '포항', '경주','울진','동해','제주'];

	// ajax로 데이터 불러오기 
	for(var i=0;i<engCity_1.length;i++){
		$.ajax({
			url: "https://api.openweathermap.org/data/2.5/weather?q="+engCity_1[i]+"&appid=c33d4e9868e43efdaaf477c172906bb8&lang=kr",
			dataType: 'json',
			type: 'GET',
			success: function(data){
				var $icon = data.weather[0].icon;
				var $temp = Math.floor(data.main.temp - 273.15) + "℃";
				// var $eng = data.name;
				var $index = engCity_1.indexOf(data.name);
				var $city = korCity_1[$index];
				var $iconUrl = "http://openweathermap.org/img/wn/" + $icon + "@2x.png";
				// console.log(data.name+"--"+$index+"--"+$city);

				// 데이터 쓰기 
				// $('.weather__info').empty();
				var tag ='<li><ul class="weather__detail">';
				tag += '<li class="wIcon"><img src="'+$iconUrl+'" alt="icon" /></li>';
				tag += '<li class="wTemp">'+$temp+'</li>';
				tag += '<li class="wCity">'+$city+'</li></ul></li>';

				$('.weather__info_1').append(tag);
				// $('.weather__info_2').append(tag);
			
			}, error:function(e){
				console.log(e.responseText);
			}
		});
		$.ajax({
			url: "https://api.openweathermap.org/data/2.5/weather?q="+engCity_2[i]+"&appid=c33d4e9868e43efdaaf477c172906bb8&lang=kr",
			dataType: 'json',
			type: 'GET',
			success: function(data){
				var $icon = data.weather[0].icon;
				var $temp = Math.floor(data.main.temp - 273.15) + "℃";
				// var $eng = data.name;
				var $index = engCity_2.indexOf(data.name);
				var $city = korCity_2[$index];
				var $iconUrl = "http://openweathermap.org/img/wn/" + $icon + "@2x.png";
				// console.log(data.name+"--"+$index+"--"+$city);

				// 데이터 쓰기 
				// $('.weather__info').empty();
				var tag ='<li><ul class="weather__detail">';
				tag += '<li class="wIcon"><img src="'+$iconUrl+'" alt="icon" /></li>';
				tag += '<li class="wTemp">'+$temp+'</li>';
				tag += '<li class="wCity">'+$city+'</li></ul></li>';

				// $('.weather__info_1').append(tag);
				$('.weather__info_2').append(tag);
			
			}, error:function(e){
				console.log(e.responseText);
			}
		});
	}
	
	//날짜페이지:포지션 {1:0, 2:-500%, 3:-1000%, 4:-1500%}
	var wPage = 0;
	//배너 롤링 확인 아이콘 변경 함부
	function changeWPage(page){
		for(var k=0; k<4;k++){
			if(page==k){
				$('.weather__page>li').eq(k).empty();
				$('.weather__page>li').eq(k).html('<i class="fa-solid fa-circle"></i>');
			}else{
				$('.weather__page>li').eq(k).empty();
				$('.weather__page>li').eq(k).html('<i class="fa-regular fa-circle"></i>');
			}
		}
	}

	changeWPage(wPage);

		// 화살표 눌렀을 때 날짜 정보 이동 
	var newPos = 0;

	//오른쪽 버튼
	$("#wRight").on({mousedown:function(){
		$(this).css('color','#5e7ca0');

		wPage += 1;
		if(wPage<4){ //날찌 정보 이동 
			newPos = -500*wPage+"%";
			$(".weather__detail").css('left',newPos);
			changeWPage(wPage);
		}else{ //이동 금지
			wPage=3;
		}
		// console.log("현재페이지:"+wPage+",현재위치"+newPos);
	}, mouseup:function(){
		$(this).css('color','gray');
	}})

	//왼쪽버튼 
	$("#wLeft").on({mousedown:function(){
		$(this).css('color','#5e7ca0');

		wPage -= 1;
		if(wPage>=0){//날찌 정보 이동 
			newPos = -500*(wPage)+"%";
			$(".weather__detail").css('left',newPos);
			changeWPage(wPage);
			// console.log("현재페이지:"+wPage+",현재위치"+newPos);
		}else{ //이동금지
			wPage = 0;
		}
	}, mouseup:function(){
		$(this).css('color','gray');
	}})
});
$(document).ready() 

//select box------------------------------------------------------------------------------------------------------
$(function() {
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

//googlemaps --------------------------------------------------------------------------------------
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
// 사용자 위치정보 가져오기-----------------------------------------------------------------------------------
//[ajax] Google Maps API는 AJAX를 사용할 때만 “Uncaught ReferenceError : google is not defined” 구글맵 첫 실행시 안나오는 오류 수정해야함
//작업이 끝나면 숨기기 기능을 넣고
//사용자가 gps버튼을 클릭하거나
//위치정보를 입력할 경우 나타나게
function getLocation() {
  if ("geolocation" in navigator) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
	//버튼 클릭시 구글맵 위치를 사용자 위치로 이동
	latitude = position.coords.latitude
	longitude = position.coords.longitude
	initMap()
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
}

$(function () {
	$('#GPS').click(function(){
	getLocation();
	});
    $(".aasz").click(function () {
	getLocation();
    });
 });
//---------------------------------------------------------------------------------------------
