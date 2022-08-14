<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	header, nav, .title, footer{
		display:none;
	}

</style>

<script>
	$(function(){
		//조회한 id를 opener에 셋팅하고 현재 window를 닫아야 한다.
		
		$("#setNN").click(function(){
			opener.$('#user_nickname').val('${user_nickname }');
			opener.$('#nameCheckState').val('Y');
			window.close();
		});
	});
</script>
<div>
	<%-- ${nameCnt }, ${user_nickname } --%>
	<c:if test="${nameCnt==0}">
		<b>${user_nickname}</b>는 사용가능한 아이디 입니다.
		<input type="button" value="닉네임 사용" id="setNN"/>
	</c:if>
	<c:if test="${nameCnt>0}">
		<b>${user_nickname}는 사용불가능한 아이디 입니다.</b>
	</c:if>
	
	<hr/>
	<form method="get" action="/user/nicknameChk">
		닉네임 : <input type="text" name="user_nickname" id="user_nickname"/>
		<input type="submit" value="닉네임 중복검사하기">
	</form>
</div>