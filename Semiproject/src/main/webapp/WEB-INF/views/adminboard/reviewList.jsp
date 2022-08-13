<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>


	#board,#page{overflow:auto;}
	#board li{
		float:left; line-height:40px; border-bottom:1px solid #ddd; width: 10%;
	}
	#board li:nth-child(5n+1){width:10%;
	/*white-space:nowrap; overflow:hidden; text-overflow:ellipsis;*/
	}
	#board li:nth-child(5n+2){
	width:70%; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}

	#board li:nth-child(5n+3){width:10%}


	#board li:nth-child(5n+4){width:10%}

	#board li:nth-child(5n+5){width:10%}

.title{
	text-align: center;
	margin:0 auto;
}

.title__bar{ 
	/* ���댄� 諛뺤뒪 �ㅼ젙 */
	margin: var(--large-space) var(--medium-space);
	padding: var(--medium-space) 0;
	background-color: var(--bg-color-lightBlue-1);
	border-radius: var(--strong-radius);
	box-shadow: var(--basic-shadow);
}
.title__bar span{
	/* ���댄� �고듃 �ㅼ젙 */
	font-size: var(--large-font-size-3);
	color: var(--main-color);
	font-weight: bold;
}
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
	height: calc( var(--button-height) - 8px);
	line-height: calc( var(--button-height) - 8px);
	font-weight: bold;
	font-size: var(--medium-font-size-3);
}

/* BOARD CONTENT */
.board__content{
	/* board box */
	border: var(--dotted-lind) var(--ct-color-gray-dark);
	margin: var(--large-space) var(--medium-space);
	padding: var(--medium-space);
}
.board__content .content__title{

	display: flex;

	border-bottom: var(--basic-line) var(--ct-color-gray-dark);
}
.board__content .content__list{

	display: flex;
	flex-wrap: nowrap;

	font-size: var(--medium-font-size-3);
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
	width: 127px;
	height: calc( var(--button-height) - 8px);
	line-height: calc( var(--button-height) - 8px);
	font-weight: bold;
	font-size: var(--medium-font-size-3);
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
	$("#allChk").click(function(){
		$("#board input[type=checkbox]").prop("checked",$("#allChk").prop("checked"));
	});
	$("#multiDel").click(function(){
		//체크 갯수 확인
		var countChk = 0;//				반복문					input input input
		$("#board input[name=noList]").each(function(idx,obj){
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
			<span>관리자 게시판</span>
		</div>
	</section>

	<section class="board">

		<!-- BOARD NAV + BUTTON -->
		<div class="board__bar">
			<ul class="board__nav">
				<li class="active"><a href = "/adminboard/reviewList">후기 별점</a></li>
				<li><a href = "/adminboard/themeList">테마여행추천</a></li>
			</ul>
		</div>
			
		<!-- CONTENT -->
		<form method="post" action="/board/multiDel" id ="listFrm">
			<div id = "board" class="board__content">
				<ul id = "board" class="content__title">
						<li>NO.</li>
						<li>여행지/축제명</li>
						<li>별점</li>
						<li>위치</li>
						<li>선택</li>
				</ul>
				<ul class="content__list">
					<c:forEach var = "vo" items="${list}"><!-- vo안에 댓글 수 있음 -->
						<li><input type = "checkbox" name = "noList" value = "${vo.no}"></li><!--  name: 변수 value: 값 -->
						<li>${vo.no}</li>
						<li>
						<div
							<c:if test="${vo.subject.length()>=30}">
								style='width:90%'
							</c:if>
						>
						<a href="/board/boardView?no=${vo.no} &nowPage=${pVO.nowPage}
							<c:if test ='${pVO.searchWord!=null}'>
									&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}
							</c:if>">
							${vo.subject}
							</a>
							</div>
							<div>
								<!-- 댓글수 -->
								<c:if test="${vo.reply_count>0}">
									[${vo.reply_count}]
								</c:if>
							</div>
						</li>
						<li>${vo.userid}</li>
						<li>${vo.hit}</li>
						<li>${vo.writedate}</li>
					</c:forEach>
				</ul>
			</div>
		</form>
	
			<!-- PAGING + BUTTON-->
				<div class="board__bottom">
					<ul class="board__page">
						<li><a href="#"> <i id = "" class="fa-solid fa-angle-left"></i></a></li>
						<li><a href="#"> <i id = "" class="fa-solid fa-angle-right"></i></a></li>				
						<li><input type = "checkbox" id = "allChk" class="checkbox"></li>
						<li>모두선택</li>
						<li><input type="button" class="DelBtn" value="삭제하기"></li>
					</ul>
				</div>
		</div>
		<div>
			<form method = "get" action= "/adminboard/reviewList" id = "searchFrm">
				<select name = "searchKey">
					<option value = "subject">제목</option>
					<option value = "userid">작성자</option>
					<option value = "content">글내용</option>
				</select>
				<input type = "text" name="searchWord" id = "searchWord"/>
				<input type = "submit" name="Search" value="검색"/>
			</form>
		</div>
	</section>

    
    
