<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
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

.cBox{
	border:var(--dotted-line) var(--main-color);
	margin: var(--medium-space);
	padding: var(--medium-space);
}
.cBox>ul{
	width:100%;
	display:flex;
	flex-wrap: wrap;
}
.cBox>ul>li{
	border-bottom:var(--dotted-line) #aaa;
	line-height: 28px;
	padding:0 2%;
}
.cBox>ul>li:nth-child(2n+1){
	width:18%;
	border-right:var(--dotted-line) #aaa;
}
.cBox>ul>li:nth-child(2n+2){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width:73%;
} .cBox>ul>li:last-child{
	width:100%;
	margin: var(--medium-space);
	border: var(--basic-line) black;
} 
.aBtn{
	margin: var(--medium-space);
	width:100%;
	display:flex;
}
.aBtn div{
	border-radius: var(--mild-radius);
	background-color: var(--main-color);
	color: var(--main-bg-color);
	width: 100px;
	height: calc( var(--button-height) - 4px);
	font-weight: bold;
	font-size: var(--medium-font-size-2);
	text-align: center;
	margin-right:var(--medium-space);
}
.cBtn{
	border-radius: var(--mild-radius);
	border:none;
	background-color: var(--main-color);
	color: var(--main-bg-color);
	width: 80px;
	height: calc( var(--button-height) - 4px);
	font-size: var(--medium-font-size-3);
	text-align: center;
	margin-left:var(--medium-space);
}
#comment_content{	
	width:98%;
	margin:var(--medium-space);
}
#commentList>ul>li{
	border-top: var(--dotted-line) gray;
	margin-top: var(--medium-space)
}
</style>

<script>
function boardDel(){
	if(confirm("이 글을 삭제하시겠습니까?")){
		location.href="/adminboard/themeDel?post_id=${vo.post_id}";
	}
}

</script>

<!-- PAGE TITLE 표시 바 -->
<section class="title">
	<div class="title__bar">
		<span>[관리자] 테마 글 내용</span>
	</div>
</section>

<section class="container">
	<div class="board__bar">
		<ul class="board__nav">
			<li><a href = "/adminboard/tourList">여행지 관리</a></li>
			<li><a href = "/adminboard/festivalList">축제 관리</a></li>
			<li class="active"><a href ="/adminboard/themeList">테마여행추천</a></li>
		</ul>
	</div>	
	<div class="cBox">
		<ul>
			<li>번호</li>
			<li>${vo.post_id }</li>
			<li>제목</li>
			<li>${vo.post_title }</li>
			<li>소제목</li>
			<li>${vo.post_intro }</li>
			<li>조회수</li>
			<li>${vo.post_hit }</li>
			<li>등록일</li>
			<li>${vo.post_registration_date }</li>
			<li>이미지파일</li>
			<li>${vo.post_file1 }</li>
			<li>${vo.post_content }</li>
		</ul>
		<div class="aBtn">
			<div><a
				href="/adminboard/themeList?nowPage=${pVO.nowPage}">
				목록</a></div>
	
			<c:if test="${vo.google_id==logId }">
				<div><a href="/adminboard/themeEdit?post_id=${vo.post_id }">수정</a></div>
				<div><a href="javascript:boardDel()">삭제</a></div>
			</c:if>
		</div>
	</div>
</section>
