<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" nonce="48c4560b3fc84607a9070657664" src="//local.adguard.org?ts=1659786708849&amp;type=content-script&amp;dmn=doc-0c-ag-docs.googleusercontent.com&amp;pth=%2Fdocs%2Fsecuresc%2Fh28pf075tq4me7v25b8oq6h1653tfu59%2F2ljn5k8eopvm9pbriauajt7464llvgve%2F1659797775000%2F11049635150280837766%2F17207076429207634588%2F1LrpCv4Ufpdxc6MOiX0OoPcFquHo3VCH_%3Fe%3Ddownload%26ax%3DAI9vYm7r1frt1ntqjBWSsRa3VajJlMt1tB_vrMkhEoG-DPYkuu_c5eKBCAVCDZ-ncUgqSk9HUxURDIMU9u7Gw_M-hQvTXcb2LQS1OpJf79XP64ijtPTIrLp4uLsxq6vGqZtRLtdccQuhJ5E0TdzhAU4dFCq5GjIu4SJtj1hqdvH2BGU9lh54tbeKb94qjuKECIsxkc38ztPrFF6BHLbAwew68e4zzPFff_kk65zhrmwjzv_mqZWvWed6kWl_syGqWbS1jyyChczcLMVd6bO5zlyuiZZZmc7kciu7Ij317wKiCYkn_NsZDDlZv9Z5wPR7likTB6NvpWWhZJ0lwjtXGrCGNdzqsaLlTGFAzD-G6LeyZf-7a2Dkx6DEzd-IyT3GY1mp5T9nCTbqRtr5JolQVXQb0eKLOWxwm6nSWfJ_3Ui_n8N6rSZwn_mx-h3DDshBzC3uyMxu74Wic4xbp8E5XXGjq8SB0ref881UNbgwFnX-7amSVP5aKRIAYa7dtVu9nraNkTKmDeyfB-rV3zdcrrIKC1vy6B2uM1IhP58THfrWElit9d7N2dNJEwTNJOIULS7RoEv3rvhYQptED2Ef1c7lbpp0qjHETMfLU0qbMz29PVpeMLmLJ-sgSmtlZi82spFhddwJRKci7RXOuKzhOqYUIxFzg1kRhwpzTNbdB-4W2zhNJdd5a1FZOy4WVgl5L1OLJg70BI8hslvSv1lbk3z2BTwyg4guSomG_C6F4OO5Ebp9KsoB-hHybsA%26uuid%3Dd1eb838b-33e4-4120-91af-ddc58c09d786%26authuser%3D0&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1"></script>
<script type="text/javascript" nonce="48c4560b3fc84607a9070657664" src="//local.adguard.org?ts=1659786708849&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;type=user-script"></script><link rel="stylesheet" href="https://use.typekit.net/mss6mty.css">
	<link rel="stylesheet" href="/style/indexStyle.css">
	<script src="https://kit.fontawesome.com/ab847241fd.js" crossorigin="anonymous"></script>

	<title>On the way mypage</title>
</head>
<style>
	#board,#page{overflow:auto;}
	#board li{
		float:left; line-height:40px; border-bottom:1px solid #ddd; width: 10%;
	}
	#board li:nth-child(6n+1){width:10%;
	/*white-space:nowrap; overflow:hidden; text-overflow:ellipsis;*/
	}
	#board li:nth-child(6n+2){
	width:70%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}

	/* 페이지 */
	#page li{
 		float:left; padding:10px;
 	}
	#checkbox{
		width:20px; height: 20px;
	}


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
				</c:if>
				<c:if test ="${pVO.nowPage<pVO.totalPage }">
					<li><a href = "/board/boardList?nowPage=${pVO.nowPage+1}
					<c:if test ='${pVO.searchWord!=null}'>
						&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
					</c:if>"><i class="fa-solid fa-angle-right"></i></a></li>
				</c:if>-->
				

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