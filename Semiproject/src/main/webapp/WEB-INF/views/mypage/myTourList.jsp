<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<section class="title">
	<div class="title__bar">
		<span>${logNickName }의 마이페이지</span>
	</div>
</section>

<!-- BOARD -->
<section class="board">
	<!-- BOARD NAV + BUTTON -->
	<div class="left">
		<div class="board__bar">
			<ul class="board__nav">
				<li><a href="/mypage/myWriteList">내가 쓴 글</a></li>
				<li><a href="/mypage/myCommentList">내가 쓴 댓글</a></li>
				<li class="active"><a href="/mypage/myTourList">찜한 여행지</a></li>
			</ul>
		</div>

		<!-- CONTENT -->
		<div id="board" class="board__content">
			<ul id="board" class="content__list">
				<li>
					<div class="box">
						<div class="b_top">
							<div class="b_left"></div>	
							<div class="b_right"></div>						
						</div>
						<div class="b_buttom"></div>
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
				<ul class="board__page">
					<li><input type="button" class="DelBtn" value="삭제하기"></li>
					<li><input type="checkbox" id="allChk" class="checkbox"></li>
					<li><a href="#"> <i id="" class="fa-solid fa-angle-left"></i></a></li>
					<li><a href="#"> <i id="" class="fa-solid fa-angle-right"></i></a></li>
				</ul>
				<ul class="SearchKey">
					<li><select id="">
							<option>최신순</option>
							<option>과거순</option>
							<option>별점순</option>
							<option>조회순</option>
					</select></li>
				</ul>
			</div>
		</div>
	</div>
</section>
