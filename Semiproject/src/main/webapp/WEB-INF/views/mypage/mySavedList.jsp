<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* ----- BOARD ------*/
/* BOARD BAR + SIDE BAR */
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
	justify-content:flex-start;
	font-size:var(--medium-font-size-3);
}

.box .bTitle{
	font-size:var(--medium-font-size-3);
	color:black;
	font-weight:bold;
	margin-bottom: var(--medium-space)
	display:-webkit-box; 
    word-wrap:break-word; 
    -webkit-line-clamp:3; 
    -webkit-box-orient:vertical; 
    overflow:hidden; 
    text-overflow:ellipsis;
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
    -webkit-line-clamp:4; 
    -webkit-box-orient:vertical; 
    overflow:hidden; 
    text-overflow:ellipsis;
}
.box .b_bottom p{
	font-size:var(--small-font-size-1);
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
<script>
	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")

	}
	
	$(function(){
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
				<li class="active"><a href="/mypage/mySavedList">찜한 여행지</a></li>
			</ul>
		</div>

		<!-- CONTENT -->
		<form>
		<div id="board" class="board__content">
			
			<ul id="board" class="content__list">
				<c:forEach var="vo" items="${list}">
					<li>
						<div class="box">
							<div class="b_top">
								<div class="b_left">
									<img alt="${vo.saved_url }" src="${vo.saved_url }">
								</div>	
								<ul class="b_right">
									<li class="bChk"><input type="checkbox"></li>
									<li class="bTitle">${vo.saved_title }<li>
									<li><a href="javascript:clip();"><i class="fa-solid fa-share"></i> 공유하기</a><li>
								</ul>						
							</div>
							<div class="b_bottom">${vo.saved_content }</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!--PAGING + BUTTON-->
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
							href="/mypage/mySavedList?nowPage=${pVO.nowPage-1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
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
								href="/mypage/mySavedList?nowPage=${p }
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
							href="/mypage/mySavedList?nowPage=${pVO.nowPage+1 }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>
								<c:if test="${pVO.searchType!=null }">&searchType=${pVO.searchType }</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		</form>
</section>
