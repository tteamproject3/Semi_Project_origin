<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>



</style>

<body>
	<!-- HEADER -->
	<header>
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
	</header>

	<!-- PAGE TITLE 표시 바 -->
	<section class="title">
		<div class="title__bar">
			<span>마이페이지</span>
		</div>
	</section>

	<!-- BOARD -->
	<section class="board">

		<!-- BOARD NAV + BUTTON -->
		<div class="board__bar">
			<ul class="board__nav">
				<li class="active"><a href = "#">내가 쓴 글</a></li>
				<li><a href = "#">내가 쓴 댓글</a></li>
				<li><a href = "#">찜한 여행지</a></li>
				<li><a href = "#">나의후기</a></li>
			</ul>
			<div class="actionBtn">작성하기</div>
		</div>
		
		<!-- CONTENT -->
		<div id = "board" class="board__content">
			<ul id = "board" class="content__title">
					<li>글번호</li>
					<li>제목</li>
					<li>작성일</li>
					<li>작성자</li>
					<li>조회수</li>
					<li>선택</li>
			</ul>
			<ul class="content__list">
				<li>{vo.no}</li>
				<li><a href = "#">title sample for the board Sample page of 'ON THE WAY'</a></li>
				<li>mm.dd</li>
				<li>${vo.userid}</li>
				<li>${vo.hit}</li>
				
					<li>&nbsp;&nbsp;&nbsp;<input type = "checkbox" id = "checkbox" value = "${vo.no}"></li>
				
			</ul>
		<!-- PAGING + BUTTON/
			<div class="board__bottom">
				<ul class="board__page">
				<c:if test="${pVO.nowPage<=1}">
					<li><a href="#"> <i class="fa-solid fa-angle-left"></i></a></li>
				</c:if>
			<c:if test = "${pVO.nowPage>1}">  
				<li><a href = "/board/boardList?nowPage=${pVO.nowPage-1}
					<c:if test ='${pVO.searchWord!=null}'>
						&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
					</c:if>"><i class="fa-solid fa-angle-left"></i></a>
				</li>
			</c:if>
			<c:forEach var = "p" begin="${pVO.startPage}" end ="${pVO.startPage+pVO.onePageCount-1}">
			
				<c:if test="${p<=pVO.totalPage}">
					<li
					<c:if test="${p==pVO.nowPage}">
						 강조폰트
					</c:if>
					><a href ="/board/boardList?nowPage=${p}
					<c:if test ='${pVO.searchWord!=null}'>
						&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
					</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>-->
				
				<!-- 다음페이지 
				<c:if test ="${pVO.nowPage==pVO.totalPage }">
					<li><a href="#"> <i class="fa-solid fa-angle-right"></i></a></li>
				</c:if>å
				<c:if test ="${pVO.nowPage<pVO.totalPage }">
					<li><a href = "/board/boardList?nowPage=${pVO.nowPage+1}
					<c:if test ='${pVO.searchWord!=null}'>
						&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
					</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
				</c:if>-->
				
		
		</div>
</section>