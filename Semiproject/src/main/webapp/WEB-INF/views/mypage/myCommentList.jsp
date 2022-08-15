<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* BOARD BAR */
.board__bar{
	margin-top: var(--large-space) auto 0;
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
	font-size: var(--medium-font-size-3);
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.board__bar .board__nav .active{
	/* 현재 선택된 탭만 대비 컬러 설정 */
	background-color: var(--main-color);
	color: var(--main-bg-color);
}
/* BOARD CONTENT */
.board__content{
	/* board box */
	border: var(--dotted-line) var(--ct-color-gray-dark);
	margin: var(--large-space) var(--medium-space);
	padding: var(--medium-space);
}
.board__content .content__title {
	/* 리스트 정렬 */
	display: flex;
	/* 하단 border */
	border-bottom: var(--basic-line) var(--ct-color-gray-dark);
}
.board__content .content__list{
	/* 리스트 정렬 */
	display: flex;
	flex-wrap: wrap;
}
.board__content .content__title li,
.board__content .content__list li{
	/* 각 칸의 넓이 설정 */
	width: 7%;
	/*  border */
	border-right: var(--dotted-line) var(--ct-color-gray-light);
	border-bottom: var(--dotted-line) var(--ct-color-gray-light);
	/* 말줄임표 처리 */
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* 폰트*/
	font-size: var(--medium-font-size-3);
	/* 정렬 */
	text-align: center;
	line-height: var(--large-font-size-3);
	padding: 0 var(--small-space);
}
.board__content .content__title li{
	font-size:var(--medium-font-size-3);
	font-weight: bold;
}
.board__content .content__title li:nth-child(5n+2),
.board__content .content__title li:nth-child(5n+4){
	/* 제목칸 */
	width: 36%;
}
.board__content .content__list li:nth-child(5n+2),
.board__content .content__list li:nth-child(5n+4){
	/* 제목칸 */
	width: 36%;
	text-align: left;
}

.board__content .content__title li:nth-child(5n+5),
.board__content .content__list li:nth-child(5n+5){
	/* 마지막 border-right 없애기 */
	width: 5%;
	border-right: none;
}

/* BOARD PAGING */
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


	<!-- PAGE TITLE 표시 바 -->
	<section class="title">
		<div class="title__bar">
			<span>[마이페이지] 내가 쓴 글</span>
		</div>
	</section>

	<!-- BOARD -->
	<section class="board">

		<!-- BOARD NAV + BUTTON -->
		<div class="board__bar">
			<ul class="board__nav">
				<li ><a href="/mypage/myWriteList">내가 쓴 글</a></li>
				<li class="active"><a href="/mypage/myCommentList">내가 쓴 댓글</a></li>
				<li ><a href="/mypage/myTourList">찜한 여행지</a></li>
			</ul>
		</div>
		
		<!-- CONTENT -->
		<!-- CONTENT -->
	<div class="board__content">
		<form>
		<ul class="content__title">
			<li>글번호</li>
			<li>제목</li>
			<li>댓글번호</li>
			<li>댓글내용</li>
			<li>선택</li>
		</ul>
		<ul class="content__list">
		
			<li>#</li>
			<li>title sample for the board Sample page of 'ON THE WAY'title sample for the board Sample page of 'ON THE WAY'title sample for the board Sample page of 'ON THE WAY'</li>
			<li>#</li>
			<li>samplecomment</li>
			<li><input type="checkbox" /></li>

			<li>#</li>
			<li>title sample for the board Sample page of 'ON THE WAY'</li>
			<li>#</li>
			<li>samplecomment</li>
			<li><input type="checkbox" /></li>
		</ul>

		<!-- PAGING + BUTTON-->
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
		</form>
	</div>
  </section>