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
		location.href="/userboard/boardDel?post_id=${vo.post_id}";
	}
}

/* comment ajax */
 $(function(){
	 	
		//해당 원글의 댓글목록 가져오기
		function commentAllList(){

			$('#commentList>ul').empty(); 
			var url = "/comment/commentList";
			var params = {post_id:${vo.post_id}};
			console.log(params);
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					var $comment = $(result);
					
					$comment.each(function(i ,vo){
						/* console.log("for check"); */
						//댓글목록	
						tag = "<li>";
						tag +="<div><span style='color:grey;'>&nbsp;&nbsp;"+vo.google_id+" ("+vo.comment_registration_date+")</span>";
						//수정,삭제 버튼(자신이 쓴 글일 때만) 표시
						if(vo.google_id=='${logId}'){ 
							tag += "<input type='button' value='Edit' class='cBtn'/>";
							tag += "<input type='button' value='Del' class='cBtn' title='"+vo.comment_id+"'/>";
						}
						tag += "<br/><div id='comment_content'>ㄴ" +vo.comment_content+"<div></div>" ;
						//로그인 아이디와 댓글쓴이가 같으면 폼을 만들어준다.
						if(vo.google_id=='${logId}'){
							tag += "<div style='display:none;'><form>";
							tag += "<input type='hidden' name='comment_id' value='"+vo.comment_id+"'/>";
							tag += "<textarea name='comment_content' id ='comment_content' rows='4' cols='80'>"+vo.comment_content+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기' class='cBtn'/>";
							tag += "</form></div>";
						}
						
						tag += "</li>";
						
						$('#commentList>ul').append(tag);
						
					});
				}, error:function(e){
					console.log(e.responseTest);
				}
			});
			
		}
		
		
		//댓글 수정하기 (폼보기)
		$(document).on('click','#commentList input[value=Edit]', function(){
			$(this).parent().css('display','none'); //Edit	버튼의 부모 숨김
			$(this).parent().next().css("display","block");
		});
		
		//댓글 수정하기 (DB수정하기)
		$(document).on('submit','#commentList form', function(){
			event.preventDefault();
			var url = "/comment/commentEdit";
			var params = $(this).serialize();
			
			$.ajax({
				url: url,
				data: params,
				type: "POST",
				success:function(result){
					commentAllList();
				}, error:function(e){
					console.log(e.responseText);
				}
			});
		});
		
		//댓글 삭제 
		$(document).on('click','#commentList input[value=Del]',function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				var param= {comment_id:$(this).attr('title')}
				
				$.ajax({
					url:"/comment/commentDel",
					data:param,
					success:function(result){
						commentAllList();
					}, error:function(e){
						console.log(e.responseText);
					}
				});
			}
			
		});
		
		//댓글 쓰기
		$('#commentFrm').submit(function(){
			//유효성검사
			if($(".CC").val()==""){
				alert("댓글을 입력하세요.");
				return false;
			} else {
			//기본 이벤트 제거하기
			event.preventDefault();
			var params = $('#commentFrm').serialize();
			console.log("입력내용"+params);
			$.ajax({
				url:"/comment/commentWrite",
				data: params,
				type:"POST",
				success: function(result){
					//댓글 등록 여부 
					console.log("댓글 등록 수 ",result);
					
					//이미 등록된 글 지우기 
					$("#comment_content").val("");
					
					commentAllList();
					
				}, error: function(e){
					console.log(e.responseText);
				}
				
			});
			}
		});
 		commentAllList();
});
</script>

<!-- PAGE TITLE 표시 바 -->
<section class="title">
	<div class="title__bar">
		<span>[게시판] 글내용</span>
	</div>
</section>

<section class="container">
	<div class="board__bar">
		<ul class="board__nav">
				<li <c:if test="${pVO.searchType=='notice'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=notice">공지</a>
					</li>
				<li <c:if test="${pVO.searchType==null}"> class="active"</c:if>>
					<a href="/userboard/boardList">전체글보기</a>
				</li>
				<li <c:if test="${pVO.searchType=='tourspot'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=tourspot">여행지 후기</a>
				</li>
				<li<c:if test="${pVO.searchType=='festival'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=festival">축제 후기</a>
				</li>
				<li<c:if test="${pVO.searchType=='food'}"> class="active"</c:if>>
					<a href="/userboard/boardList?searchType=food">맛집 추천</a>
				</li>
			
		</ul>
	</div>	
	<div class="cBox">
		<ul>
			<li>번호</li>
			<li>${vo.post_id }</li>
			<li>작성자</li>
			<li>${vo.google_id }</li>
			<li>제목</li>
			<li>${vo.post_title }</li>
			<li>조회수</li>
			<li>${vo.post_hit }</li>
			<li>등록일</li>
			<li>${vo.post_registration_date }</li>
			
			<li>${vo.post_content }</li>
		</ul>
		<div class="aBtn">
			<div><a
				href="/userboard/boardList?nowPage=${pVO.nowPage}<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
				목록</a></div>
	
			<c:if test="${vo.google_id==logId }">
				<div><a href="/userboard/boardEdit?post_id=${vo.post_id }">수정</a></div>
				<div><a href="javascript:boardDel()">삭제</a></div>
			</c:if>
		</div>
		<hr />
		<!-- 댓글달기 -->
		<div>
			<h4>&nbsp;&nbsp;댓글 리스트</h4>
			<form method="post" id="commentFrm">
				<!-- 원글 글번호 -->
				<input type="hidden" name="post_id" value="${vo.post_id }" />
				<textarea maxlength="200" name="comment_content" id="comment_content" class="CC" cols="80"
					rows="3"></textarea>
				<c:if test="${logId !=null }">
					<input type="submit" value="댓글쓰기" class="cBtn"/>
				</c:if>
			</form>
		</div>
		<div id="commentList">
			<ul>
			</ul>
		</div> 
	</div>
</section>

