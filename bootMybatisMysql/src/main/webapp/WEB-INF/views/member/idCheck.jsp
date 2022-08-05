<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#topMenu, #Logo, #mainMenu, .footer{
display:none;}
</style>
<script>
$(function(){
	//조회한 아이디를 opener에 세팅하고 현재 window는 닫아야한다.
	$("#setId").click(function(){
		opener.$('#userid').val('${userid}');
		opener.$('#idCheckState').val('Y');
		window.close();
	})

})
</script>
<div>
<c:if test="${idCnt==0}">
<b>${userid}는 사용 가능한 아이디입니다.</b>
<input type="button" value="아이디사용하기" id="setId"/>
</c:if>
<c:if test="${idCnt>0}">
<b>${userid}는 사용 불가능한 아이디입니다.</b>
</c:if>
<hr/>
<form method="get" action="/member/idCheck">
아이디:<input type="text" name="userid" id="userid"/>
<input type="submit" value="아이디 중복검사하기">
</form>
</div>