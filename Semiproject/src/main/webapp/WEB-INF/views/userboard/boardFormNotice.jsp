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
			
			if($('#post_type').val()=="none"){
				alert("글 구분을 입력하세요.");
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
		<span>[게시판] 공지쓰기</span>
	</div>
</section>

<section class = "container">
	<div class="cBox">
		<form method = "post" action="/userboard/boardFormOk" id = "boardFrm">
		<ul>
			<li>제목</li>
			<li><input type = "text" name="post_title" id = "post_title" style="width:100%"/></li>
			<li>구분 ${pVO.searchType }</li>
			<li><select name="post_type" id="post_type" style="width:100%">
				<option value="notice">공지</option>
			</select></li>
			<li><textarea name = "post_content" id = "post_content"></textarea></li>			
		</ul>
		<input type = "submit" value = "글등록" class="aBtn"/>
		</form>
	</div>
</section> 