$(function() {
	// ------ header + nav ------
	// 햄버거 메뉴 클릭 이벤트
	var show = false;
	// 클릭 시 block/none 반복
	$(".header__menu").on('click', function() {
		if (show) {
			$("nav").children('ul').css('display', 'none');
			show = false;
		} else {
			$("nav").children('ul').css('display', 'block');
			show = true;
		}
	});
	//nav에서 마우스 아웃시 none
	$("nav").on({
		mouseenter: function() {
			$("nav").children('ul').css('display', 'block');
			show = true;
		}, mouseleave: function() {
			$("nav").children('ul').css('display', 'none');
			show = false;
		}
	})

	// ----- search ------
	// 선택 중인 select_title 색상 변경
	$(".search ul>li").on({
		mouseenter: function() {
			$(this).children('.search__title').css('color', '#5e7ca0');
			$(this).children('label').children('.search__title').css('color', '#5e7ca0');
		}, mouseleave: function() {
			$(this).children('.search__title').css('color', 'black');
			$(this).children('label').children('.search__title').css('color', 'black');
		}
	});
	//현재위치 넣기
	//현재위치 검색하기 



	//날짜입력창에 현재날짜 넣기 
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month + '-' + day;
	$('#start_Itnr').val(dateString);
	$('#end_Itnr').val(dateString);

	//날짜 최대 입력값 제한 : 4개월 이후 
	today.setMonth(today.getMonth() + 4);
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month + '-' + day;
	$('#start_Itnr').attr('max', dateString);
	$('#end_Itnr').attr('max', dateString);


	// 유효성 검사
	$('#search').submit(function() {
		if ($('.tripPlan').val() == '') {
			alert("여행 방법을 선택해주세요.");
			return false;
		}
		if ($('#curLoc').val() == '') {
			alert("현재 위치를 입력해주세요.");
			return false;
		}
		if ($('#intinerary').val() == '') {
			alert("여행 일정을 입력해주세요.");
			return false;
		}
		if ($('#transfort').val() == '') {
			alert("이동 수단을 입력해주세요.");
			return false;
		}
		if ($('#distance').val() == '') {
			alert("이동 거리를 입력해주세요.");
			return false;
		}
		return true;
	});


	//날짜페이지:포지션 {1:0, 2:-500%, 3:-1000%, 4:-1500%}
	var wPage = 0;
	//배너 롤링 확인 아이콘 변경 함부
	function changeWPage(page) {
		for (var k = 0; k < 4; k++) {
			if (page == k) {
				$('.weather__page>li').eq(k).empty();
				$('.weather__page>li').eq(k).html('<i class="fa-solid fa-circle"></i>');
			} else {
				$('.weather__page>li').eq(k).empty();
				$('.weather__page>li').eq(k).html('<i class="fa-regular fa-circle"></i>');
			}
		}
	}

	changeWPage(wPage);

	// 화살표 눌렀을 때 날짜 정보 이동 
	var newPos = 0;

	//오른쪽 버튼
	$("#wRight").on({
		mousedown: function() {
			$(this).css('color', '#5e7ca0');

			wPage += 1;
			if (wPage < 4) { //날찌 정보 이동 
				newPos = -500 * wPage + "%";
				$(".weather__detail").css('left', newPos);
				changeWPage(wPage);
			} else { //이동 금지
				wPage = 3;
			}
			// console.log("현재페이지:"+wPage+",현재위치"+newPos);
		}, mouseup: function() {
			$(this).css('color', 'gray');
		}
	})

	//왼쪽버튼 
	$("#wLeft").on({
		mousedown: function() {
			$(this).css('color', '#5e7ca0');

			wPage -= 1;
			if (wPage >= 0) {//날찌 정보 이동 
				newPos = -500 * (wPage) + "%";
				$(".weather__detail").css('left', newPos);
				changeWPage(wPage);
				// console.log("현재페이지:"+wPage+",현재위치"+newPos);
			} else { //이동금지
				wPage = 0;
			}
		}, mouseup: function() {
			$(this).css('color', 'gray');
		}
	})
	
	//좋아요 버튼-테마	
	$(".saved_1").click(function(){
		$(this).html('');
		$(this).append("<i class='fa-solid fa-heart saved'></i>");
		alert("마이페이지에 저장합니다!");	
		
		var frmName = ".p_save_"+$(this).parent().next().val();
		//console.log(frmName);
		$(frmName).submit(
		);
				
	});
	
	
	//좋아요 버튼 - 축제
	$(".saved_2").click(function(){
		$(this).html('');
		$(this).append("<i class='fa-solid fa-heart saved'></i>");
		alert("마이페이지에 저장합니다!");	
		
		var frmName = ".p_save_"+$(this).parent().next().val();
		console.log(frmName);
		$(frmName).submit(
		);
				
	});

	
});
$(document).ready()

//select box------------------------------------------------------------------------------------------------------
function initMap() {
	initMap2(37.5642135,127.0016985 ,13);
};

function categoryChange(e) {
	const state = document.getElementById("search_box_2");

	const gangwon = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
	const gyeonggi = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
	const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	const gyeongsangbuk = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
	const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	const busan = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
	const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	const ulsan = ["남구", "동구", "북구", "중구", "울주군"];
	const incheon = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
	const jeonnam = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	const jeju = ["서귀포시", "제주시", "남제주군", "북제주군"];
	const chungbuk = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];


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
$.ajax({
	url: "/DBdata/gmapGo",
	success: function(data) {
		console.log(data);
		console.log(data[1].tour_id);
	}, error: function() {
		console.log("가져오기 실패")
	}
});
var zM=0;
var c ="";
var d = "";
var map;
var a = "";
var b = "";
function initMap2(a, b, c) {
	var myCenter = new google.maps.LatLng(a, b)
	var mapProperty = {
		center: myCenter,
		zoom: c,
		mapTypeId: google.maps.MapTypeId.roadmap
		/*
		roadmap displays the default road map view. This is the default map type.
		satellite displays Google Earth satellite images.
		hybrid displays a mixture of normal and satellite views.
		terrain displays a physical map based on terrain information.
		*/
	};
	var map = new google.maps.Map(document
		.getElementById('googleMapView'), mapProperty);

	var lat = "";
	var long = "";
	var i = 0;
	var abc = "";
	var img = "";
	var msg = "";
	console.log(11);
	$.ajax({
url: "/DBdata/gmapGo2",
success: function(data) {
	console.log(data[1].festival_id);
	console.log(data.length);
	console.log(data[1].festival_lat);
	console.log(1111111111111111111111111111111111111111);
	for (i; i < data.length; i++) {
		lat = data[i].festival_lat;
		long = data[i].festival_long;
		var latlong = new google.maps.LatLng(data[i].festival_lat, data[i].festival_long)
		var infowindow = new google.maps.InfoWindow();
		var marker = new google.maps.Marker({
			icon : '../../img/festival-logo1.png',
			position: latlong,
			map: map,
			title: "" + data[i].festival_num
			
		})
		
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				console.log(1111111111111111111111111111111111111111);
				//abc= data[i].tour_id;
				//$.ajax({
				//	url: "/DBdata/getImgUrl",
				//	data: {name : data[i].tour_id},
				//	success: function(aa){
				//		img = aa;
				//	},error:function(aaa){
				//		console.log("가져오기 실패")
				//		console.log(aaa)
				//	}
				//});
				console.log(data[i].festival_id);
				MSG = "축제명 : " + data[i].festival_id + "<hr/>";
				MSG += "축제 정보 : " + data[i].festival_content + "<br/>";
				//MSG += "주소 : "+data[i].tour_road_name_addr+"<br/>";
				//MSG += "<li><img src='"+img+"'width'150' height'150'/></li>";
				//html로 표시될 인포 윈도우의 내용
				var infowindow = new google.maps.InfoWindow({ content: MSG });
				//인포윈도우가 표시될 위치
				infowindow.open(map, marker);
			}
		})(marker, i));
		var data3 = [];
		if (marker) {
			marker.addListener('click', function() {
				//중심 위치를 클릭된 마커의 위치로 변경
				map.setCenter(this.getPosition());
				//마커 클릭 시의 줌 변화
				map.setZoom(14);
				console.log(99);
				console.log(this.title);
				console.log(this);

				$.ajax({
					url: "/DBdata/getPdata2",
					data: { num: this.title },
					success: function(data2) {
						console.log(data2)
						data3 = data2;
						//User-Agent
						var appenddiv = "<div class='touristSpot'>";
						appenddiv += "<div class='touristSpot_img'><img src='" + data3[0].festival_img + "'style='width\"300\" height\"300\"/'></div>";
						appenddiv += "<div class='touristSpot_div'>"
						appenddiv += "<div class='touristSpot_subject'>" + data3[0].festival_id + "</div>";
						appenddiv += "<br/>";
						appenddiv += "<spen>축제 소개<br/></spen>";
						appenddiv += "<div class='touristSpot_content'>" + data3[0].festival_content + "</div>";
						appenddiv += "<div class='touristSpot_tel'>축제 주소: " + data3[0].festival_road_name_addr + "</div>";
						appenddiv += "<div class='touristSpot_tel'>축제 관리기관 전화번호: " + data3[0].festival_phonenum + "</div>";
						appenddiv += "<div class='touristSpot_div2'>";
						appenddiv += "<div class='touristSpot_parking'>축제 기간: " + data3[0].festival_start_date+"~"+data3[0].festival_end_date+"</div>";
						appenddiv += "<div class='touristSpot_raiting'> &nbsp; &nbsp;";
						appenddiv += "<input class='touristSpot_fav' type='button' value='❤'/></div>";
						appenddiv += "</div>";
						appenddiv += "</div>";
						appenddiv += "</div>";
						appenddiv += "<br/>";
						$('.search_result').prepend(appenddiv)


					}, error: function(aaa) {
						console.log("가져오기 실패")
						console.log(aaa)
					}
				});
				console.log(this);

			});
		}




				//var info = new google.maps.InfoWindow({content:data[i].tour_id});
				//google.maps.event.addListener(marker, 'mouseover', function(){
				//	info.open(map, marker);
				//})

			}
		}, error: function() {
			console.log("가져오기 실패")
		}
	});
	$.ajax({
		url: "/DBdata/gmapGo",
		success: function(data) {
			console.log(data[1].tour_id);
			console.log(data.length);
			console.log(data[1].tour_lat);
			for (var i=0; i < data.length; i++) {
				lat = data[i].tour_lat;
				long = data[i].tour_long;
				var latlong = new google.maps.LatLng(data[i].tour_lat, data[i].tour_long)
				var infowindow = new google.maps.InfoWindow();
				var marker = new google.maps.Marker({
					//icon : '../../img/tour.png',
					position: latlong,
					map: map,
					title: "" + data[i].tour_num
				})
				google.maps.event.addListener(marker, 'click', (function(marker, i) {
					return function() {
						//abc= data[i].tour_id;
						//$.ajax({
						//	url: "/DBdata/getImgUrl",
						//	data: {name : data[i].tour_id},
						//	success: function(aa){
						//		img = aa;
						//	},error:function(aaa){
						//		console.log("가져오기 실패")
						//		console.log(aaa)
						//	}
						//});
						console.log(data[i].tour_id);
						MSG = "관광지명 : " + data[i].tour_id + "<hr/>";
						MSG += "관광지 정보 : " + data[i].tour_content + "<br/>";
						//MSG += "주소 : "+data[i].tour_road_name_addr+"<br/>";
						//MSG += "<li><img src='"+img+"'width'150' height'150'/></li>";
						//html로 표시될 인포 윈도우의 내용
						var infowindow = new google.maps.InfoWindow({ content: MSG });
						//인포윈도우가 표시될 위치
						infowindow.open(map, marker);
					}
				})(marker, i));
				var data3 = [];
				if (marker) {
					marker.addListener('click', function() {
						//중심 위치를 클릭된 마커의 위치로 변경
						map.setCenter(this.getPosition());
						//마커 클릭 시의 줌 변화
						map.setZoom(13);
						console.log(99);
						console.log(this.title);
						console.log(this);

						$.ajax({
							url: "/DBdata/getPdata",
							data: { num: this.title },
							success: function(data2) {
								console.log(data2)
								data3 = data2;
								//User-Agent
								var appenddiv = "<div class='touristSpot'>";
								appenddiv += "<div class='touristSpot_img'><img src='" + data3[0].tour_img + "'style='width\"300\" height\"300\"/'></div>";
								appenddiv += "<div class='touristSpot_div'>"
								appenddiv += "<div class='touristSpot_subject'>" + data3[0].tour_id + "</div>";
								appenddiv += "<br/>";
								appenddiv += "<spen>관광지 소개<br/></spen>";
								appenddiv += "<div class='touristSpot_content'>" + data3[0].tour_content + "</div>";
								appenddiv += "<div class='touristSpot_tel'>관광지 주소: " + data3[0].tour_road_name_addr + "</div>";
								appenddiv += "<div class='touristSpot_tel'>관광지 관리기관 전화번호: " + data3[0].tour_phonenum + "</div>";
								appenddiv += "<div class='touristSpot_div2'>";
								appenddiv += "<div class='touristSpot_parking'>주차가능공간: " + data3[0].tour_parkinglot_num + "</div>";
								appenddiv += "<div class='touristSpot_raiting'> &nbsp; &nbsp;";
								appenddiv += "<input class='touristSpot_fav' type='button' value='❤'/></div>";
								appenddiv += "</div>";
								appenddiv += "</div>";
								appenddiv += "</div>";
								appenddiv += "<br/>";
								$('.search_result').prepend(appenddiv)


							}, error: function(aaa) {
								console.log("가져오기 실패")
								console.log(aaa)
							}
						});
						console.log(this);

					});
				}




				//var info = new google.maps.InfoWindow({content:data[i].tour_id});
				//google.maps.event.addListener(marker, 'mouseover', function(){
				//	info.open(map, marker);
				//})

			}
		}, error: function() {
			console.log("가져오기 실패")
		}
	});
	var i =0;




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
			initMap2(latitude,longitude,15)
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


$(function() {
	$('#GPS').click(function() {
		getLocation();
	});
	$(".aasz").click(function() {
		//$.ajax({
		//url: "/DBdata/getImgUrl",
		//data: {abc : data[i].tour_id},
		//success: function(aa){
		//	img = aa;
		//},error:function(aaa){
		//	console.log("가져오기 실패")
		//	console.log(aaa)
		//}
		//});
		$.ajax({
			url: "/DBdata/dataInsert",
			success: function(data) {
				if (data == "true") {
					alert('API에서 데이터 가져오기 성공');
				}
				else {
					alert('API에서 데이터 가져오기 실패');
				}
			}
		});

	});
});

$(function() {
	$('#mainSB').click(function() {
		console.log(11);
		var li = [37.5642135, 127.0016985];
		$.ajax({
			url: "/DBdata/getLI",
			data: {lat: 37.5642135,
					long: 127.0016985},
			success: function(aa) {
				console.log("aaaa");
				console.log(aa);
				aa.forEach(function (el, index){
				var appenddiv = "<div class='abcde'>";

				appenddiv += "<div class='tt'>관광지명 : </div>"+el.tour_id+"<br/>";
				appenddiv += "<div class='tt'>거리 : </div>"+Number(el.tour_distance).toFixed(2)+"KM";
				appenddiv += "<div class='fLat1'  style='display:none' >"+el.tour_lat+"</div>";
				appenddiv += "<div class='fLat2'  style='display:none' >"+el.tour_long+"</div>";

				appenddiv += "</div>";
				appenddiv += "<br/>";
				$('.gmap_search').append(appenddiv)
				});
				$('.abcde').click(function() {
				console.log(1234);
				console.log( $(this));
				console.log( $(this).children());
				//console.log($(this).children().last().prev().html());
				//console.log($(this).children().last().html());
				//console.log($(this).children().last().prev().html());
				//console.log($(this).children('.lastchild').text());
				//console.log($(this).children('.lastchild').prev().html());
				//console.log(1234);
				
				//console.log( $(this).child('.heart').attr("value"));
				//console.log(Number(this.festival_lat));
				//console.log(1234);
				console.log(1234);
				c = $(this).children().last().prev().html();
				d = $(this).children().last().html();
				console.log(c+d)
				initMap2(c,d,15)

				});
			}, error: function(aaa) {
				console.log("가져오기 실패")
				console.log(aaa)
			}
		});
	});
	});
	$(function() {
	$('#mainSB2').click(function() {
		console.log(11);
		var li = [37.5642135, 127.0016985];
		$.ajax({
			url: "/DBdata/getLI2",
			data: {lat: 37.5642135,
					long: 127.0016985,
					a :"2022-08-16" ,
					b:"2022-08-19"},
			success: function(aa) {
				console.log("bbbb");
				console.log(aa);
				aa.forEach(function (el, index){
				var appenddiv2 = "<div class='abcde'>";

				
				
				appenddiv2 += "<div class='tt'>축제명 : </div>"+el.festival_id+"<br/>";
				appenddiv2 += "<div class='tt'>거리명 : </div>"+Number(el.festival_distance).toFixed(2)+"KM<br/>";
				appenddiv2 += "<div class='tt'>축제기간 : </div>"+el.festival_start_date+"~"+el.festival_end_date;
				appenddiv2 += "<div class='fLat1'  style='display:none' >"+el.festival_lat+"</div>";
				appenddiv2 += "<div class='fLat2'  style='display:none' >"+el.festival_long+"</div>";

				appenddiv2 += "</div>";
				appenddiv2 += "<br/>";
				$('.gmap_search').append(appenddiv2)
				});
				$('.abcde').click(function() {
				console.log(1234);
				console.log( $(this));
				console.log( $(this).children());
				//console.log($(this).children().last().prev().html());
				//console.log($(this).children().last().html());
				//console.log($(this).children().last().prev().html());
				//console.log($(this).children('.lastchild').text());
				//console.log($(this).children('.lastchild').prev().html());
				//console.log(1234);
				
				//console.log( $(this).child('.heart').attr("value"));
				//console.log(Number(this.festival_lat));
				//console.log(1234);
				console.log(1234);
				c = $(this).children().last().prev().html();
				d = $(this).children().last().html();
				console.log(c+d)
				initMap2(c,d,15)

				});
			}, error: function(aaa) {
				console.log("가져오기 실패")
				console.log(aaa)
			}
		});
	});
	});
	

//---------------------------------------------------------------------------------------------
