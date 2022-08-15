<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>
	#board,#page{overflow:auto;}
	#board li{
		float:left; line-height:40px; border-bottom:1px solid #ddd; width: 10%;
	}
	#board li:nth-child(6n+1){width:10%;
	/*white-space:nowrap; overflow:hidden; text-overflow:ellipsis;**/
	}
	#board li:nth-child(6n+2){
	width:70%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}

	.checkbox{
		width:1em; height: 1em;
	}
	.board__page{
		margin:0 auto; text-align: center;
	}
	.board__page>li{
		font-size: 0.8em; align-items: center;
	}
	.board__bottom .board__page {
		display: flex;
	}
	.board__bottom .DelBtn{
	/* 우측 버튼 설정 */
	/* 세부 */
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	/* 크기 */
	width: 127px;;
	height: calc( var(--button-height) - 8px);
	line-height: calc( var(--button-height) - 8px);
	font-weight: bold;
	font-size: var(--medium-font-size-3);
}
.actionBtn{
	width:127px; height: 34px;
}


</style>
<script>


</script>
<body>
	<!-- HEADER -->
	<%-- <header>
		<div class="header__menu">
			<i class="fa-solid fa-bars"></i>
		</div>
		<div class="header__logo">
			<a href="#">
				<span>On The Way</span>
				<i class="fa-solid fa-cart-flatbed-suitcase"></i>
			</a>
		</div>
		<div class="header__icon">
			<i class="fa-solid fa-arrow-right-from-bracket"></i>
			<i class="fa-regular fa-bell"></i>
			<i class="fa-regular fa-user"></i>
		</div>
	</header> --%>

	<!-- PAGE TITLE 표시 바 -->
	<section class="title">
		<div class="title__bar">
			<span> 관리자 게시판 reviewViewpage</span>
		</div>
	</section>

	<!-- BOARD -->
	<section class="board">

		<!-- BOARD NAV + BUTTON --->
		<div class="board__bar">
			<ul class="board__nav">
				<li><a href = "#">테마추천</a></li>
				<li class="active"><a href = "#">리뷰후기</a></li>
			</ul>
			<input type="button" class="actionBtn" value="작성하기">
		</div>
		
		<!-- CONTENT -->
		<div id = "board" class="board__content">
			<ul id = "board" class="content__title">
					<li>글번호</li>
					<li>여행지/축제명</li>
					<li>별점</li>
					<li>위치</li>
					<li>선택</li>
			</ul>
			<ul class="content__list">
				<li>{vo.no}</li>
				<li><a href = "#">title sample for the board Sample page of 'ON THE WAY'</a></li>
				<li></li>
				<li>${vo.writedate}</li>
				<!--  <li>${}</li>-->
				<li>&nbsp;&nbsp;&nbsp;<input type = "checkbox" id = "allChk" class = "checkbox" value = "${vo.no}"></li>
			</ul>
			<div>
				<a href="/board/boardList?nowPage=${pVO.nowPage}<c:if test ='${pVO.searchWord!=null}'> &searchKey=${pVO.searchKey} &searchWord=${pVO.searchWord} </c:if>">목록</a>
				<c:if test = "${vo.userid==logId}">
					<a href = "/board/boardEdit/${vo.no}">수정</a>
					<a href = "javascript:boardDel();">삭제</a>
				</c:if>
			</div>
				<!-- 댓글달기 -->
				<div>
					<form method="post" id="replyFrm">
						<input type = "hidden" name="no" value="${vo.no}"/>
						<textarea maxlength="200" name="coment" id="coment" cols="50" rows ="3"></textarea>
						<input type="submit" value="댓글쓰기"/>					
					</form>	
				</div>
				<div id = "replyList">
					<ul></ul>
				</div>
		</div>
	</section>