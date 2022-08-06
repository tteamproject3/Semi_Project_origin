<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 구글맵 API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwSEWBBCWNZzbZ6_ItQYHifWBj_gVVgWQ&callback=initMap&region=kr">	

</script>
<style>
#googleMapView {
	height: 800px;
	border: 1px solid #ddd;
}
</style>
	<div id="googleMapView">
		<script>
			var latitude = 37.5729503;
			var longitude = 126.9793578;
			
			var lat = [37.562685,37.462685,37.7862685];
			var log = [126.8793578,126.8393578,126.8893578];
			function initMap() {
				//위도, 경도를 이용한 객체생성
				var myCenter = new google.maps.LatLng(latitude, longitude)
				//표시할 지도옵션
				var mapProperty = {
					center : myCenter,
					zoom : 14, //0~21사이의 값을 사용 값이 크면 확대됨
					mapTypeId : google.maps.MapTypeId.ROADMAP
				//지도 종류(ROADMAP, HYBRID, STEELITE, TREEAIN))
				};
				var map = new google.maps.Map(document
				//지도 표시할 곳      //맵 옵션
				.getElementById('googleMapView'), mapProperty);
				
				
				//마커표시
				var marker = new google.maps.Marker({
					position: myCenter, //마커를 표시할 위치
					map:map,//마커를 표시할 지도
					title:"서울시청", //마커에 마우스 오버시 표시할 내용
					icon:"../../img/gmap_pin.png"

				})
				//정보 대화상자
				var infoMsg = "위도:"+latitude+"<br/>경도="+longitude;
				infoMsg+= "<br/><a href='https://lostark.game.onstove.com/Main'><img src='../../img/방긋.png' width'100' height='100'/></a>";
				var info = new google.maps.InfoWindow({
					content:infoMsg
				});
				
				//이벤트 등록
				google.maps.event.addListener(
				marker,//이벤트 발생대상		
				'click',//이벤트 종류
				function(){
					info.open(map,marker);
				}
				);
				
				
				//마커 여러곳 표시하기
				for(var i=0; i<lat.length;i++){
					var mk = new google.maps.Marker({
						position: new google.maps.LatLng(lat[i], log[i]),//마커를 표시할 위치
						map:map,//마커를 표시할 지도
						title:"위도"+lat[i]+",경도="+log[i], //마커에 마우스 오버시 표시할 내용
						icon:"../../img/gmap_pin.png"

					});
					mk.setMap(map);
					
				}
				//반경표시
				var myCity = new google.maps.Circle({
					center : myCenter, //변경의 중심점
					radius : 500,//반지름
					strokeColor:'#f00',//선의 색상
					strokeWidth:10,//선의 두께
					strokeOpacity:0.5,//선의 투명도0~1
					fillColor:'#0f0',//면의 색상
					fillOpacity:0.5//면의 투명도
					
				});
				
				myCity.setMap(map);
				
			}
		</script>
		 -->
	</div>