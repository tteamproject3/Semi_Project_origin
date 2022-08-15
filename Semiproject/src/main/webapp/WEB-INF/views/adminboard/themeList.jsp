<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* BOARD BAR */
.board__bar{
	margin-top: var(--large-space);
	width: 100%;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: var(--bold-line) var(--ct-color-gray-dark) ;
}
.board__bar .board__nav{
	display: flex;
}
.board__bar .board__nav li{
	background-color: var(--bg-color-gray);
	box-shadow: var(--up-basic-shadow);
	border-radius: var(--strong-radius) var(--strong-radius) 0 0;
	width: var(--button-width);
	height: var(--button-height);
	line-height: var(--button-height);
	font-weight: bold;
}
.board__bar .board__nav .active{
	background-color: var(--main-color);
	color: var(--main-bg-color);
}
.board__bar .actionBtn{
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	width: var(--button-width);
	height: calc( var(--button-height) - 4px);
	font-weight: bold;
	font-size: var(--medium-font-size-2);
}

/* BOARD CONTENT */
.board__content{
	/* board box */
	border: var(--dotted-line) var(--ct-color-gray-dark);
	margin: var(--large-space) var(--medium-space);
	padding: var(--medium-space);
}
.board__content .content__title{
	display: flex;
	border-bottom: var(--basic-line) var(--ct-color-gray-dark);
}
.board__content .content__list{
	display: flex;
	flex-wrap: wrap;
	font-size: var(--medium-font-size-3);
}
.board__content .content__title li,
.board__content .content__list li{
	/* 각 칸의 넓이 설정 */
	width: 5%;
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
	width: 35%;
}
.board__content .content__list li:nth-child(5n+2),
.board__content .content__list li:nth-child(5n+3){
	/* 제목칸 */
	width: 35%;
	text-align: left;
}
.board__content .content__title li:nth-child(5n+4),
.board__content .content__list li:nth-child(5n+4){
	width: 12%;
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
<script>
$(function(){
	$("#searchFrm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요.");
			return false;

		}
		return true;
	});
	
	//리스트 전체 선택
	$(".allChk").click(function(){
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
			alert("삭제할 게시글을 선택 후 삭제하세요.");
			return false;
		}
		$("#listFrm").submit();
	});
});

</script>


<!-- PAGE TITLE 표시 바 -->
<section class="title">
	<div class="title__bar">
		<span>관리자 게시판</span>
	</div>
</section>

<section class="board">
	<!-- BOARD NAV + BUTTON --->
	<div class="board__bar">
		<ul class="board__nav">
			<li><a href ="/adminboard/spotList">데이터 관리</a></li>
			<li class="active"><a href ="/adminboard/themeList">테마여행추천</a></li>
		</ul>
		<div class="actionBtn">
			<a href="/adminboard/themeForm">작성하기</a>
		</div>
	</div>

	<!-- CONTENT -->
	<form method="post" action="/adminboard/multiDel" id="listFrm">
		<div id="board" class="board__content">
			<ul id="board" class="content__title">
				<li>NO.</li>
				<li>테마추천 글이름</li>
				<li>테마위치</li>
				<li>작성일</li>
				<li>선택</li>
			</ul>
			<ul class="content__list">
				<c:forEach var="vo" items="${list}">
					<li>${vo.post_id}</li>
					<!-- 제목 -->
					<li>
						<a href="/adminboard/themeView?post_id=${vo.post_id}&nowPage=${pVO.nowPage}<c:if test ='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">
						${vo.post_title}</a>
					</li>
					<li>${vo.post_intro}</li>
					<li>${vo.post_registration_date}</li>							
					<li><!-- 관리자일때만 체크박스  -->
						<c:if test="${logStatus == 'Y'}">	
							<c:if test="${logMode == 1 }">
								<input type="checkbox" name="noList" value="${vo.post_id}">
							</c:if>
						</c:if>
					</li>
				</c:forEach>
			</ul>
			
			
			<!-- PAGING + BUTTON-->
			<div class="board__bottom">
				<div class="board__delete">
					<input type="checkbox" class="allChk"/> 모두선택 
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
							href="/adminboard/themeList?nowPage=${pVO.nowPage-1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-left"></i></a></li>
					</c:if>

					<c:forEach var="p" begin="${pVO.startPage }" end="${pVO.startPage + pVO.onePageCount - 1 }">
						<!-- 출력할 페이지 번호가 총 페이지 수보다 작거나 같을 때만 출력  -->
						<c:if test="${p<=pVO.totalPage }">
							<li
								<c:if test="${p==pVO.nowPage }">
								style = "color:#111;font-weight:bold;"
							</c:if>
							>
							<a
								href="/adminboard/themeList?nowPage=${p }
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
							href="/adminboard/themeList?nowPage=${pVO.nowPage+1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
					</c:if>
				</ul>
				</ul>
			</div>
		</div>
	</form>
	<form method="get" action="/adminboard/themeList" id="searchFrm">
		<input type="hidden" name="searchType" value="theme"/>
		<select name="searchKey">
			<option value="post_title">제목</option>
			<option value="post_content">글내용</option>
		</select> <input type="text" name="searchWord" id="searchWord" /> 
		<input type="submit" name="Search" value="검색" />
	</form>
</section>






