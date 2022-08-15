$(function(){
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

				$('.weather__info_2').append(tag);
			
			}, error:function(e){
				console.log(e.responseText);
			}
		});
	}
	
	
});