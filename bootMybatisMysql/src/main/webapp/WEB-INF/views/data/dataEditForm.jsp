<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<style>
.del{
cursor:pointer;

}

</style>
<script>
	$(function() {
		CKEDITOR.replace("content");
		
		//첨부파일 수정
		$(".del").click(function(){
			//기본파일명 숨기기
			$(this).parent().css("display", "none");
			//새로 첨부 가능하도록 File컴퍼넌 만들기
			$(this).parent().next().attr("type", "file");
			//삭제된 파일명을 서버로 보내기 위해? name 속성을 설정한다
			$(this).parent().next().next().attr("name","delFile");
			//남은 파일의 수를 감소시킨다.
			$("input[name=fileCount]").val($("input[name=fileCount]").val()-1);
		});
		
		
		
		
		$("#dataFrm").submit(function() {
			if ($("#tte").val() == "") {
				alert("제목을 입력하세요.");
				return false;
			}
			if (CKEDITOR.instances.content.getData() == "") {
				alert("내용을 입력하세요");
				return false;
			}
			var fileCount = $("input[name=fileCount]").val(); //선택한 첨부파일의 갯수를 저장할 변수
			if ($("#filename1").val() != "") {
				fileCount++;
			}
			if ($("#filename2").val() != "") {
				fileCount++;
			}
			if (fileCount < 1) {
				alert("첨부파일을 반듯이 1개 이상 선택하여야 합니다.")
				return false;
			}
			return true;

		})
	})
</script>
<div class="container">
	<h1>자료실 글 수정</h1>
	<!--  form안에 파일첨부가 있을경우 Form테그에는 반듯이 enctype="multipart/form-data" 가 기술되어야 한다 반듯이..? -->
	<form method="post" action="/data/dataEditFormOk" id="dataFrm"
		enctype="multipart/form-data">
		<input type="hidden" name="no" value="${vo.no }" />
		<!-- 첨부파일 갯수 -->
		
		<ul> 
			<li>제목</li>
			<li><input type="text" name="title" id="tte" style="width: 80%"
				value="${vo.title }" /></li>
			<!-- name은 VO와 같게 만들어야한다. -->
			<li>글내용</li>
			<li><textarea name="content" id="content">${vo.content }</textarea></li>
			<!-- name은 VO와 같게 만들어야한다. -->
			<li>첨부파일</li>
			<li>
				<!-- 첫번째 점부파일에 대한 수정처리 -->
				<div>
					<div>${vo.filename1 }&nbsp;<b class="del">X</b></div>
					<!-- 파일명을 삭제시 새로운 파일을 첨부 가능하도록 -->
					<input type="hidden" name="filename" id="filename1"/>
					<!-- 삭제한 경우 삭제 파일명을 보관할 컴퍼번트 -->
					<input type="hidden" name="" value="${vo.filename1 }"/>
					</div>
					<!-- 두번쨰 첨부파일 -->
					<div>
					<!-- 첨부파일이 있을떄 -->
					<c:if test="${vo.filename2!='' && vo.filename2!=null}">
						<div>${vo.filename2}&nbsp;<b class="del">X</b></div>
											<input type="hidden" name="filename" id="filename2"/>
					<!-- 삭제한 경우 삭제 파일명을 보관할 컴퍼번트 -->
					<input type="hidden" name="" value="${vo.filename2 }"/>
					<input type="hidden" name="fileCount" value="2">
					</c:if>
					<!-- 첨부파일이 없을때 -->
					<c:if test="${vo.filename2==null || vo.filename2=='' }">
					<input type="file" name="filename" id="filename2"/>
					<input type="hidden" name="fileCount" value="1">
					</c:if>
				</div>
			<li><input type="submit" value="자료실 글수정"></li>
		</ul>
	</form>
</div>
