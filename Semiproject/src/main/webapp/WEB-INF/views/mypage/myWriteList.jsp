<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



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
				<li><a href = "#">내가 쓴 글</a></li>
				<li><a href = "#">내가 쓴 댓글</a></li>
				<li><a href = "#">찜한 여행지</a></li>
				<li class="active"><a href = "#">나의후기</a></li>
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

			
	<!-- FOOTER -->
	<footer>
		<div class="footer__icon">
			<a href="#"><i class="fa-brands fa-facebook"></i></a>
			<a href="#"><i class="fa-brands fa-square-instagram"></i></a>
			<a href="#"><i class="fa-solid fa-share-from-square"></i></a>
		</div>
		<div class="footer__info">
			<a href="#">About Us</a> | 
			<a href="#">Support</a> |
			<a href="#">Term of Use</a> |
			<a href="#">Private Policy</a> <br>
			©2022 NoviceCoders. All Right Reserved.
		</div>
	</footer>
</body>
</html>