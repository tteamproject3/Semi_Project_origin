<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#replyList li{
border-bottom:1px solid #ddd;
margin:5px;
}
</style>
<script>
	function boardDel() {
		if (confirm("글을 삭제 하시겠습니까?")) {
			location.href = "/board/boardDel?no=${vo.no}"
		}
	}
	$(function(){
		
	})
</script>
<div class="container">
	<h1>글내용보기</h1>
	<ul>
		<li>번호</li>
		<li>${vo.no }</li>
		<li>작성자</li>
		<li>${vo.userid}</li>
		<li>제목</li>
		<li>${vo.subject }</li>
		<li>조회수 : ${vo.hit}, 등록일 : ${vo.writedate}</li>
		<li>글내용</li>
		<li>${vo.content}</li>
	</ul>
	<div>
		<a
			href="/board/boardList?nowPage=${pVO.nowPage}<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">목록</a>
		<c:if test="${vo.userid==logId}">
			<!-- 세션에 넣어둠 맴버컨트롤에 logId라는 이름으로 -->
			<a href="/board/boardEdit/${vo.no }">수정</a>
			<a href="javascript:boardDel();">삭제</a>
		</c:if>
	</div>
	<hr />
	<!-- 댓글 -->
	<div>
		<form method="post" id="replyFrm">
			<!-- 원글 글번호 -->
			<input type="hidden" name="no" value="${vo.no }">
			<textarea maxlength="100" name="coment" id="coment" cols="50"
				rows="3"></textarea>
			<input type="submit" value="댓글쓰기" />

		</form>
	</div>
	<div id="replyList">
		<ul>
			<li>
			ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
			<input type = "button" value ="수정"/>
			<input type = "button" value ="삭제"/><br/>
			댓글내용이 보이는 곳
			</li>
						<li>
			ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
			<input type = "button" value ="수정"/>
			<input type = "button" value ="삭제"/><br/>
			댓글내용이 보이는 곳
			</li>
		</ul>

	</div>
</div>
