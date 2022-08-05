<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace("content");
	$("#dataFrm").submit(function(){
		if($("#tte").val()==""){
			alert("제목을 입력하세요.");
			return false;
		}
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력하세요");
			return false;
		}
		var fileCount = 0; //선택한 첨부파일의 갯수를 저장할 변수
		if($("#filename1").val()!=""){
			fileCount++;
		}
		if($("#filename2").val()!=""){
			fileCount++;
		}
		if(fileCount<1){
			alert("첨부파일을 반듯이 1개 이상 선택하여야 합니다.")
			return false;
		}
		return true;
		
	})
})	
</script>
<div class="container">
	<h1>자료실 글 등록</h1>
	<!--  form안에 파일첨부가 있을경우 Form테그에는 반듯이 enctype="multipart/form-data" 가 기술되어야 한다 반듯이..? -->
	<form method="post" action="/data/dataWriteOk" id="dataFrm"
		enctype="multipart/form-data">
		<ul>
			<li>제목</li>
			<li><input type="text" name="title" id="tte" style="width: 80%" />
			</li>
			<!-- name은 VO와 같게 만들어야한다. -->
			<li>글내용</li>
			<li><textarea name="content" id="content"></textarea></li>
			<!-- name은 VO와 같게 만들어야한다. -->
			<li>첨부파일</li>
			<li><input type="file" name="filename" id="filename1" /> <!-- name은 VO와 다르게 만들어야한다. 있는 이름쓰면 VO에 넣어버리려고 하기떄문에 오류난다-->
				<input type="file" name="filename" id="filename2" /></li>
			<li><input type="submit" value="자료실 글올리기"></li>
		</ul>
	</form>
</div>
