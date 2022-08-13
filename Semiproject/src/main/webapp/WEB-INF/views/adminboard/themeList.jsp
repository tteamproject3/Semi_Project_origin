<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>
	#board,#page{overflow:auto;}
	#board li{
		float:left; line-height:40px; border-bottom:1px solid #ddd; width: 10%;
	}
	#board li:nth-child(6n+1){width:5%;
	/*white-space:nowrap; overflow:hidden; text-overflow:ellipsis;*/
	}
	#board li:nth-child(6n+3){width:55%;}
	#board li:nth-child(6n+3)>div{float:left;}
	#board li:nth-child(6n+3)>div:first-child{
		white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}
	
 	/* 페이지 */
 	#page li{
 		float:left; padding:10px;
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

	
	<section class = "board">

			<!-- BOARD NAV + BUTTON --->
			<div class="board__bar">
				<ul class="board__nav">
					<li><a href = "#">후기 별점</a></li>
					<li class="active"><a href = "#">테마여행추천</a></li>
				</ul>
				<input type="button" class="actionBtn" value="작성하기"></div>
			</div>

			<!-- CONTENT -->
		<form method="post" action="/adminboard/multiDel" id ="listFrm">
			<div id = "board" class="board__content">
				<ul id = "board" class="content__title">
						<li>글번호</li>
						<li>여행지/축제명</li>
						<li>별점</li>
						<li>위치</li>
						<li>선택</li>
				</ul>
				<ul class="content__list">
					<c:forEach var = "vo" items="${list}">
							<li><input type = "checkbox" name = "noList" value = "${vo.no}"></li>
							<li>${vo.no}</li>
							<li>
							<div
								<c:if test="${vo.subject.length()>=30}">
									style='width:90%'
								</c:if>
							>
							<a href="/adminboard/themeView?no=${vo.no} &nowPage=${pVO.nowPage}
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
			<div>
				<form method = "get" action= "/adminboard/themeView" id = "searchFrm">
					<select name = "searchKey">
						<option value = "subject">제목</option>
						<option value = "userid">작성자</option>
						<option value = "content">글내용</option>
					</select>
					<input type = "text" name="searchWord" id = "searchWord"/>
					<input type = "submit" name="Search"/>
				</form>
			</div>			
	</section>	
	



    
    
