<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.board{
	display: flex;
	border: var(--dotted-line) var(--ct-color-gray-dark);
}
.board__flow{
	width: 25%;
	height: 63vh;
	margin: var(--medium-space);

	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.board__flow li{
	width: 100%;
	text-align: center;
}
.board__flow li>i{
	font-size: var(--title-font-size);
	color: var(--ct-color-gray-dark);
}
.board__flow li>.flow{
	width: 60%;
	height: 10vh;
	background-color: var(--bg-color-blue-1);
	margin: var(--medium-space) auto;
	padding: var(--medium-space);
	border-radius:var(--strong-radius) ;

	line-height: 10vh;
	text-align: center;
	font-weight: bold;
	font-size: var(--medium-font-size-2);
}
.board__flow li>.active{
	background-color: var(--bg-color-blue-2);
	color: var(--main-bg-color);
}
.board__content{
	width: 70%;
	height: 63vh;
	margin: var(--medium-space);
	background-color: var(--bg-color-lightBlue-1);
	border: var(--basic-line) var(--main-color);
	padding: var(--medium-space);
}
.board__content form{
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 80%;
	margin: var(--large-space) auto;
}
.board__content form>ul>li{
	height: 7vh;
	border-bottom:var(--basic-line) var(--ct-color-gray-dark) ;
	line-height: 7vh;
	display: flex;
	align-items: center;
}
.board__content form li:last-child{
	height: 16vh;
}
.board__content form li:last-child ul>li{
	height: 4vh;
	line-height: 4vh;
}
.board__content form li .iTitle{
	width: 30%;
	font-weight: bold;
	font-size: var(--medium-font-size-3);
}
.board__content form li div,
.board__content form input,
.board__content form label{
	font-size: var(--medium-font-size-3);
}
.board__content form input[type=date]{
	height: 20px;
	line-height: ;
}
.board__content form>div:last-child{
	text-align: center;
}
.board__content form>div .nextBtn{
		border: none;
		border-radius: var(--mild-radius);
		background-color: var(--main-color);
		color: var(--main-bg-color);
		width: var(--button-width);
		height: calc( var(--button-height) - 4px);
		font-weight: bold;
		font-size: var(--medium-font-size-3);
		margin: var(--large-space) auto;
} 

</style>
<script>
$(function(){
	
	$("#nameChk").click(function(){
		window.open("/user/nicknameChk?user_nickname="+$("#user_nickname").val(),"nameChk","width=400, height=300");
	});
	
	$("#user_nickname").change(function(){
		$("#nameCheckState").val("N");

	});
	
	
	//유효성 검사
	$('.iFrm').submit(function(){
		//아이디
		if($('#user_nickname').val()==""){
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		//아이디 중복검사 여부
		if($("#nameCheckState").val()=='Y'){
			alert("닉네임 중복 여부를 검사하세요.");
			return false;
		}
		
		//날짜 
		if($('#user_birth').val()=="연도. 월. 일. "){
			//
		}
	});

});

</script>
			<section class="title">
				<div class="title__bar">
					<span>[회원가입] 회원 정보 입력</span>
				</div>
			</section>
			
			<section class="board">	
				<ul class ="board__flow">
					<li><i class="fa-solid fa-angle-up"></i></li>
					<li><div class="flow">1. 약관동의</div><li>
					<li><div class="flow active">2. 정보 입력</div><li>
					<li><div class="flow">3. 가입 완료</div><li>
					<li><i class="fa-solid fa-angle-down"></i></li>
				</ul>
				<div class="board__content">
					<form class="iFrm" action="/user/signinOk?g_id='+${u_vo.google_id }+'$g_name='+${u_vo.google_username }'" method="post">
						<input type="hidden" name="google_id" value="${u_vo.google_id }" />
						<input type="hidden" name="google_username" value="${u_vo.google_username }" />
						<ul>
							<li>
								<span class="iTitle">닉네임</span>
								<div>
									<input type="text" name="user_nickname" id="user_nickname">
									<input type="button" id="nameChk" value="중복 검사">
								</div>
							</li>
							<li>
								<span class="iTitle">연락처</span>
								<div>
									<input type="text" name="tel1" id="tel1" size="4"> -
									<input type="text" name="tel2" id="tel2" size="4"> - 
									<input type="text" name="tel3" id="tel3" size="4">
								</div>
							</li>
							<li>
								<span class="iTitle">성별</span>
								<div>
									<input type="radio" name="user_gender" id="check_gen_f" value="f" checked>
									<label for="check_gen_f">여성</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="user_gender" id="check_gen_m" value="m">
									<label for="check_gen_m">남성</label>
								</div>
							</li>
							<li>
								<span class="iTitle">생년월일</span>
								<input type="date" name="user_birth" id="user_birth">
								<input type="hidden" name="email" id="email" value="${u_vo.email}">
							</li>
							<li>
								<span class="iTitle">SNS 수신여부</span>
								<ul>
									<li>이메일 수신 </li>
									<li>
										<input type="radio" name="agree_to_receive_email" id="email_agree_yes" value="1" checked>
										<label for="email_agree_yes">동의</label>&nbsp;&nbsp;&nbsp;
										<input type="radio" name="agree_to_receive_email" id="email_agree_no" value="0">
										<label for="email_agree_no">미동의</label>
									</li>
									<li>문자 수신 </li>
									<li>
										<input type="radio" name="agree_to_receive_msg" id="msg_agree_yes" value="1" checked>
										<label for="msg_agree_yes">동의</label>&nbsp;&nbsp;&nbsp;
										<input type="radio" name="agree_to_receive_msg" id="msg_agree_no" value="0">
										<label for="msg_agree_no">미동의</label>
									</li>
								</ul>
							</li>
						</ul>	
						<div>
							<input type="submit" class="nextBtn" value="다음"/>
						</div>
					</form>
				</div>
			</section>