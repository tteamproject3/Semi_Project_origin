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
	font-size: var(--medium-font-size-3);
	/* 정렬 */
	text-align: center;
	padding: 0 var(--small-space);
}
.board__content .content__title li{
	font-size:var(--medium-font-size-3);
	font-weight: bold;
}
.board__content .content__title li:nth-child(6n+2){
	/* 제목칸 */
	width: 46%;
}
.board__content .content__list li:nth-child(6n+2){
	/* 제목칸 */
	width: 46%;
	text-align: left;
	
}
.board__content .content__list li:nth-child(6n+2)>div{
	float:left;
}
.board__content .content__list li:nth-child(6n+2)>div:first-child{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.board__content .content__title li:nth-child(6n+3),
.board__content .content__list li:nth-child(6n+3),
.board__content .content__title li:nth-child(6n+4),
.board__content .content__list li:nth-child(6n+4),
.board__content .content__title li:nth-child(6n+5),
.board__content .content__list li:nth-child(6n+5){
	width: 11%;
}

.board__content .content__title li:nth-child(6n+6),
.board__content .content__list li:nth-child(6n+6){
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
		<span>[게시판] ${logNickName }님 환영합니다.</span>
	</div>
</section>

<section class="board">
	<!-- BOARD NAV + BUTTON --->
	<div class="board__bar">
		<ul class="board__nav">
				<li <c:if test="${pVO.searchType=='notice'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=notice">공지</a>
					</li>
				<li <c:if test="${pVO.searchType==null}"> class="active"</c:if>>
					<a href="/userboard/boardList">전체글보기</a>
				</li>
				<li <c:if test="${pVO.searchType=='tourspot'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=tourspot">여행지 후기</a>
				</li>
				<li<c:if test="${pVO.searchType=='festival'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=festival">축제 후기</a>
				</li>
				<li<c:if test="${pVO.searchType=='food'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=food">맛집 추천</a>
				</li>
			
		</ul>
		<div class="actionBtn">
			<c:if test="${pVO.searchType=='notice'}"> 
				<a href="/userboard/boardFormNotice">작성하기</a>
			</c:if>
			<c:if test="${pVO.searchType!='notice'}"> 
				<a href="/userboard/boardForm">작성하기</a>
			</c:if>
		</div>
	</div>

	<!-- CONTENT -->
	<form method="post" action="/userboard/multiDel" id="listFrm">
		<div id="board" class="board__content">
			<ul id="board" class="content__title">
				<li>글번호</li>
				<li>제목</li>
				<li>작성일</li>
				<li>작성자</li>
				<li>조회수</li>
				<li>선택</li>
			</ul>
			<ul class="content__list">

				<c:forEach var="vo" items="${list}">
					<li>${vo.post_id}</li>
					<!-- 제목 -->
					<li>
						<div <c:if test="${vo.post_title.length()>=40 }">
							style='width:94%'
						</c:if> >
							<a href="/userboard/boardView?post_id=${vo.post_id}&nowPage=${pVO.nowPage}<c:if test ='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">
							${vo.post_title}</a>
						</div>
						<div>
							<c:if test="${vo.comment_count>0 }">
								[${vo.comment_count }]
							</c:if>
						</div>
					</li>
						
						
					<li>${vo.post_registration_date}</li>	
					<li>${vo.google_id}</li>
					<li>${vo.post_hit}</li>							
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
				<c:if test="${logStatus == 'Y'}">
					<c:if test="${logMode == 1 }">
						<div class="board__delete">
							<input type="checkbox" class ="allChk"/> 모두선택 
							<input type="submit" value="삭제하기" class="delBtn">
						</div>
					</c:if>
				</c:if>
				<ul class="board__page">
					<!-- 페이지 번호 -->
					<c:if test="${pVO.nowPage<=1 }">
						<!-- 이전 페이지가 없을 때  -->
						<li><i class="fa-solid fa-angle-left"></i></li>
					</c:if>
					<c:if test="${pVO.nowPage>1 }">
						<!-- 이전 페이지가 있을 때  -->
						<li><a
							href="/userboard/boardList?nowPage=${pVO.nowPage-1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
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
								href="/userboard/boardList?nowPage=${p }
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
							href="/userboard/boardList?nowPage=${pVO.nowPage+1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
	<form method="get" action="/userboard/boardList" id="searchFrm">
		<select name="searchKey">
			<option value="post_title">제목</option>
			<option value="google_id">작성자</option>
			<option value="post_content">글내용</option>
		</select> 
		<input type="text" name="searchWord" id="searchWord" /> 
		<input type="submit" name="Search" value="검색" />
	</form>
</section>



    
