<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("post_content");
		
		
		$("#boardFrm").submit(function(){
			if($("#post_title").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}
			if($("#post_intro").val()==""){
				alert("사이드 제목을 입력하세요.");
				return false;
			}
			
			if($("#post_file1").val()==""){
				alert("첨부이미지 링크를 입력하세요.");
				return false;
			}
			
			if(CKEDITOR.instances.content.getData()==""){
				alert("글내용을 입력하세요");
				return false;
			}
			
			return true;
		});
	});
</script>

<style>
.cBox{
	border:var(--dotted-line) var(--main-color);
	margin: var(--medium-space);
	padding: var(--medium-space);
}
.cBox ul{
	width:100%;
	display:flex;
	flex-wrap: wrap;
}
.cBox ul>li{
	border-bottom:var(--dotted-line) #aaa;
	line-height: 28px;
	padding:0 2%;
}
.cBox ul>li:nth-child(2n+1){
	width:18%;
	border-right:var(--dotted-line) #aaa;
}
.cBox ul>li:nth-child(2n+2){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width:73%;
}
.cBox ul>li:last-child{
	width:100%;
	margin: var(--medium-space);
	border: var(--basic-line) black;
	padding: 0;
} 
.aBtn{
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	width: 100px;
	height: calc( var(--button-height) - 4px);
	font-weight: bold;
	font-size: var(--medium-font-size-2);
	text-align: center;
	margin:var(--medium-space);
	border:none;
}
</style>

<section class="title">
	<div class="title__bar">
		<span>[관리자]테마여행 추천글 수정</span>
	</div>
</section>

<section class = "container">
	<div class="cBox">
		<form method = "post" action="/adminboard/themeEditOk" id = "boardFrm">
		<input type="hidden" name="post_id" value="${vo.post_id }" />
		<ul>
			<li>제목</li>
			<li><input type = "text" name="post_title" id = "post_title" value="${vo.post_title }" style="width:100%"/></li>
			<li>사이드 제목</li>
			<li><input type = "text" name="post_intro" id = "post_intro" value="${vo.post_intro }" style="width:100%"/></li>
			<li>구분</li>
			<li><select name="post_type" id="post_type" value="${vo.post_type }" style="width:100%">
				<option value="theme">테마여행</option>
			</select></li>
			<li>이미지파일</li>
			<li><input type = "text" name="post_file1" id = "post_file1" value="${vo.post_file1 }" style="width:100%"/></li>
			<li><textarea name = "post_content" id = "post_content">${vo.post_content }</textarea></li>
		</ul>
		<input type = "submit" value = "글등록" class="aBtn"/>
		</form>
	</div>
</section> 