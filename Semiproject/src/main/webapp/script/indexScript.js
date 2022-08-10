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
	// 유효성 검사



	// ----- Weather Theme ------
	// openweather api에서 날씨 불러오기
	// key: c33d4e9868e43efdaaf477c172906bb8

	// 주요 도시 영문명 리스트
	var engCity = ["Seoul", "Incheon", "Suwon-si","Paju", "Icheon-si","Pyeongtaek-si","Chuncheon",
	"Wŏnju", "Gangneung","Daejeon","Hongseong","Cheongju-si","Chungju","Gwangju", "Mokpo"]

	// 주요 도시 한국명 리스트 
	var korCity = ['서울','인천','수원','파주','이천','평택','춘천',
	'원주','강릉','대전','세종','홍성','청주','충주','광주','목포'];
	// ,
	// '여수','순천','광양','나주','전주','군산','정읍','남원','고창','무주',
	// '부산','울산','창원','진주','거창','통영', '대구','안동','포항','경주',
	// '울진','울릉도','제주','서귀포'];

	for(var i=0;i<engCity.length;i++){
		$.ajax({
			url: "https://api.openweathermap.org/data/2.5/weather?q="+engCity[i]+"&appid=c33d4e9868e43efdaaf477c172906bb8&lang=kr",
			dataType: 'json',
			type: 'GET',
			success: function(data){
				var $icon = data.weather[0].icon;
				var $temp = Math.floor(data.main.temp - 273.15) + "℃";
				// var $eng = data.name;
				var $index = engCity.indexOf(data.name);
				var $city = korCity[$index];
				var $iconUrl = "http://openweathermap.org/img/wn/" + $icon + "@2x.png";
				// console.log($temp+"--"+$index+"--"+$city);

				// 데이터 쓰기 
				// $('.weather__info').empty();
				var tag ='<li><ul class="weather__detail">';
				tag += '<li class="wIcon"><img src="'+$iconUrl+'" alt="icon" /></li>';
				tag += '<li class="wTemp">'+$temp+'</li>';
				tag += '<li class="wCity">'+$city+'</li></ul></li>';

				$('.weather__info').append(tag);
				// $('.weather__info_2').append(tag);
			}, error:function(e){
				console.log(e.responseText);
			}
		});
	}
	

});

