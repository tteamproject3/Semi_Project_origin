<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* ----- BOARD ------*/
/* BOARD BAR + SIDE BAR */
.board{
}
.board__bar{
	margin-top: var(--large-space);
	width: 100%;
	text-align: center;
	/* bar 요소 정렬 */
	display: flex;
	justify-content: space-between;
	align-items: center;
	/* 하단 border */
	border-bottom: var(--bold-line) var(--ct-color-gray-dark) ;
}
.board__bar .board__nav{
	/* nav 요소 정렬 */
	display: flex;
}
.board__bar .board__nav li{
	/* nav 탭 세부 설정 */
	background-color: var(--bg-color-gray);
	box-shadow: var(--up-basic-shadow);
	border-radius: var(--strong-radius) var(--strong-radius) 0 0;
	/* 탭 크기 */
	width: var(--button-width);
	height: var(--button-height);
	line-height: var(--button-height);
	/* 폰트 */
	font-weight: bold;
}
.board__bar .board__nav .active{
	/* 현재 선택된 탭만 대비 컬러 설정 */
	background-color: var(--main-color);
	color: var(--main-bg-color);
}
.board__bar .board__search{
	display:flex;
	
}
.board__bar .searchBtn{
	/* 세부 */
	border:none;
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	/* 크기 */
	width: var(--button-width);
	height: calc( var(--button-height) - 4px);
	font-weight: bold;
	font-size: var(--medium-font-size-3);
	margin-left:var(--medium-space);
}

/* BOARD CONTENT */
.board__content{
	/* board box */
	border: var(--dotted-line) var(--ct-color-gray-dark);
	margin: var(--large-space) var(--medium-space);
	padding: var(--medium-space);
	
}
.board__content .content__title{
	/* 리스트 정렬 */
	display: flex;
	/* 하단 border */
	border-bottom: var(--basic-line) var(--ct-color-gray-dark);
}
.board__content .content__list{
	/* 박스 리스트 정렬 */
	display: flex;
	flex-wrap: wrap;
	height: 55vh;
}
.board__content .content__list>li{
	/* 박스 설정 */
	width: 31%;
	height: 45%;
	margin: var(--medium-space);
	background-color:var(--bg-color-lightBlue-1); 
	color: var(--ct-color-gray-dark);
}
.box .b_top{
	height: 50%;
	display: flex;
	margin: var(--medium-space);
}
.box .b_left{
	width:51%;
	border-right: var(--bold-dotted-line) var(--ct-color-gray-dark);
	text-align:center;
}
.box img{
	border-radius:20%;
	box-shadow: var(--basic-shadow);
	width:80%;
	height:85px;
	margin-top: var(--medium-space)
}
.box .b_right{
	width:49%;
	margin: var(--medium-space);
	display:flex;
	flex-direction:column;
	jusify-content:flex-start;
	font-size:var(--medium-font-size-3);
}
.box .bTitle{
	font-size:var(--medium-font-size-2);
	color:black;
	font-weight:bold;
	margin-bottom: var(--medium-space)
}
.box .bChk{	
	line-height:10px;
	text-align:right;
}
.box .b_right i{
	font-size:var(--medium-font-size-3);
}
.box .b_bottom{
	margin:calc(var(--medium-space)*2) var(--medium-space) var(--medium-space) var(--medium-space);
	font-size:var(--small-font-size-1);
	/* 여러줄 말줄임 */
	 display:-webkit-box; 
    word-wrap:break-word; 
    -webkit-line-clamp:5; 
    -webkit-box-orient:vertical; 
    overflow:hidden; 
    text-overflow:ellipsis;
}


/* 하단 */
.board__bottom .board__delete{
	text-align: right;
	margin-right:var(--medium-space);
}
.board__bottom .board__delete .delBtn{
	/* 세부 */
	border:none;
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	/* 크기 */
	width: var(--button-width);
	height: calc( var(--button-height) - 4px);
	font-weight: bold;
	font-size: var(--medium--font-size-3);
	margin:var(--medium-space);
}
.board__bottom .board__page{
	display: flex;
	justify-content: center;
	/* font */
	font-size: var(--small-font-size-1);
	color: var(--ct-color-gray-light);
	/* 여백 설정 */
	margin-top: calc(var(--medium-space)*2);
}
.board__bottom .board__page li{
	width: 5%;
}
.board__bottom .board__page li:first-child,
.board__bottom .board__page li:last-child,
.board__bottom .board__page .active{
	color: var(--ct-color-gray-dark);
}

</style>



<section class="title">
	<div class="title__bar">
		<span>${logNickName } 님의 마이페이지</span>
	</div>
</section>

<!-- BOARD -->
<section class="board">
	<!-- BOARD NAV + BUTTON -->
		<div class="board__bar">
			<ul class="board__nav">
				<li><a href="/mypage/myWriteList">내가 쓴 글</a></li>
				<li><a href="/mypage/myCommentList">내가 쓴 댓글</a></li>
				<li class="active"><a href="/mypage/myTourList">찜한 여행지</a></li>
			</ul>
			<ul class="board__search">
				<li>
				<select id="">
						<option>최신순</option>
						<option>과거순</option>
						<option>별점순</option>
						<option>조회순</option>
				</select>
				</li>
				<li><input type="button" value="조회하기" class="searchBtn"></li>
			</ul>
		</div>

		<!-- CONTENT -->
		<form>
		<div id="board" class="board__content">
			
			<ul id="board" class="content__list">
				<li>
					<div class="box">
						<div class="b_top">
							<div class="b_left">
								<img alt="/img/ocean-view.jpg" src="/img/ocean-view.jpg">
							</div>	
							<ul class="b_right">
								<li class="bChk"><input type="checkbox"></li>
								<li class="bTitle">부산<li>
								<li>★ 4.6 <li>
								<li><i class="fa-solid fa-share"></i> 공유하기<li>
							</ul>						
						</div>
						<div class="b_bottom">부산광역시는 대한민국 동남부 해안에  산업이 발달하였다. 일본과는 대한해협과 대마도를 사이에 두고 마주하고 있다.부산광역시는 대한민국 동남부 해안에 위치한 광역시이다. 대한민국의 제2의 도시이자 최대의 해양 물류 도시이며, 부산항을 중심으로 해상 무역과 물류 산업이 발달하였다. 부산광역시는 대한민국 동남부 해안에 위치한 광역시이다. 대한민국의 제2의 도시이자 최대의 해양 물류 도시이며, 부산항을 중심으로 해상 무역과 물류 산업이 발달하였다. 일본과는 대한해협과 대마도를 사이에 두고 마주하고 있다. 부산광역시는 대한민국 동남부 해안에 위치한 광역시이다. 대한민국의 제2의 도시이자 최대의 해양 물류 도시이며, 부산항을 중심으로 해상 무역과 물류 산업이 발달하였다. 일본과는 대한해협과 대마도를 사이에 두고 마주하고 있다. 일본과는 대한해협과 대마도를 사이에 두고 마주하고 있다.v</div>
					</div>
				</li>
				<li><div class="box"></div></li>
				<li><div class="box"></div></li>
				<li><div class="box"></div></li>
				<li><div class="box"></div></li>
				<li><div class="box"></div></li>
			</ul>
			<!--PAGING + BUTTON-->
			<div class="board__bottom">
				<div class="board__delete">
					<input type="checkbox" /> 모두선택 
					<input type="submit" value="삭제하기" class="delBtn">
				</div>
				<ul class="board__page">
					<li><a href="#"> <i class="fa-solid fa-angle-left"></i></a></li>
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#"> <i class="fa-solid fa-angle-right"></i></a></li>
				</ul>
			</div>
		</div>
		</form>
</section>
