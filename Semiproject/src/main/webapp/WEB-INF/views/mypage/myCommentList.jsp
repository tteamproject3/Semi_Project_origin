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
	width: 6%;
	height: 28px;
	line-height: 28px;
	/*  border */
	border-right: var(--dotted-line) var(--ct-color-gray-light);
	border-bottom: var(--dotted-line) var(--ct-color-gray-light);
	/* 말줄임표 처리 */
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	/* 폰트*/
	font-size: var(--medium-font-size-2);
	/* 정렬 */
	text-align: center;
	padding: 0 var(--small-space);
}
.board__content .content__title li{
	font-size:var(--medium-font-size-2);
	font-weight: bold;
}
.board__content .content__title li:nth-child(5n+2),
.board__content .content__title li:nth-child(5n+3){
	/* 제목칸 */
	width: 34%;
}
.board__content .content__list li:nth-child(5n+2),
.board__content .content__list li:nth-child(5n+3){
	/* 제목칸 */
	width: 34%;
	text-align: left;
}

.board__content .content__title li:nth-child(5n+4),
.board__content .content__list li:nth-child(5n+4){
	width: 12%;
}
.board__content .content__title li:nth-child(5n+5),
.board__content .content__list li:nth-child(5n+5){
	/* 마지막 border-right 없애기 */
	width: 6%;
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
<script type="text/javascript">
//리스트 전체 선택
$(function(){
	$(".allChk").click(function(){
		console.log("확인");
		$(".board input[type=checkbox]").prop("checked",$(".allChk").prop("checked"));
	});

	$(".delBtn").click(function(){
		//체크 갯수 확인
		var countChk = 0;//				반복문					input input input
		$(".board input[name=noList]").each(function(idx,obj){
			if(obj.checked){ // input 태그가 체크 상태이면 true
				countChk++;
			}
		});
		if(countChk<=0){
			alert("삭제할 레코드를 선택 후 삭제하세요.");
			return false;
		}
		$("#listFrm").submit();
	});
});
</script>

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
		<form method="post" action="/mypage/commentMultiDel" id="listFrm">
		<ul class="content__title">
			<li>댓번호</li>
			<li>원글제목</li>
			<li>댓글내용</li>
			<li>작성일</li>
			<li>선택</li>
		</ul>
		<ul class="content__list">
				<c:forEach var="vo" items="${list}">
					<li>${vo.comment_id }</li>
					<!-- 제목 -->
					<li>
					<!-- &nowPage=${pVO.nowPage}<c:if test ='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if> -->
					<a href="/userboard/boardView?post_id=${vo.post_id}">
					${vo.post_title}</a>
					</li>	
					<li>${vo.comment_content }</li>
					<li>${vo.comment_registration_date}</li>
					<c:if test="${logStatus == 'Y'}">	
						<li><input type="checkbox" name="noList" value="${vo.comment_id}"></li>
					</c:if>	
				</c:forEach>
		</ul>

		<!-- PAGING + BUTTON-->
		<div class="board__bottom">
			<div class="board__delete">
				<input type="checkbox" class ="allChk" /> 모두선택 
				<input type="submit" value="삭제하기" class="delBtn">
			</div>
			<ul class="board__page">
						<!-- 페이지 번호 -->
					<c:if test="${pVO.nowPage<=1 }">
						<!-- 이전 페이지가 없을 때  -->
						<li><i class="fa-solid fa-angle-left"></i></li>
					</c:if>
					<c:if test="${pVO.nowPage>1 }">
						<!-- 이전 페이지가 있을 때  -->
						<li><a
							href="/mypage/myWriteList?nowPage=${pVO.nowPage-1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-left"></i></a></li>
					</c:if>

					<c:forEach var="p" begin="${pVO.startPage }"
						end="${pVO.startPage + pVO.onePageCount - 1 }">
						<!-- 출력할 페이지 번호가 총 페이지 수보다 작거나 같을 때만 출력  -->
						<c:if test="${p<=pVO.totalPage }">
							<li
								<c:if test="${p==pVO.nowPage }">
								style = "color:#111;font-weight:bold;"
							</c:if>
							>
							<a
								href="/mypage/myWriteList?nowPage=${p }
								<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>">
								${p }</a>
							</li>
						</c:if>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${pVO.nowPage>=pVO.totalPage }">
						<!-- 다음 페이지가 없을 때  -->
						<li><i class="fa-solid fa-angle-right"></i></li>
					</c:if>
					<c:if test="${pVO.nowPage<pVO.totalPage}">
						<!-- 다음 페이지가 있을 때  -->
						<li><a
							href="/mypage/myWriteList?nowPage=${pVO.nowPage+1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
					</c:if>
				</ul>
		</div>
		</form>
	</div>
  </section>