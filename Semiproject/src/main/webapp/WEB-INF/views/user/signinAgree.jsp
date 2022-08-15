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
}
.board__content form .aTitle{
	text-decoration: underline;
}
.board__content form>textarea{
	height: 18vh;
	font-size: var(--medium-font-size-3);
	color: var(--ct-color-gray-dark);
}
.board__content form .agree__check{
	text-align: right;
	margin-bottom: var(--medium-space);
	font-size: var(--medium-font-size-3);
}
.board__content form .agree__check label{
	font-size: var(--medium-font-size-3);
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
		margin-right: var(--medium-space);
}

</style>			
<script>
$(function(){
	var agree_all = 'Y';
	
	$('.allChk').click(function(){	 
		console.log("동의");
		 if(agree_all == 'Y'){
		        $("input:radio[id='check_1_yes']").prop("checked",true);
		        $("input:radio[id='check_2_yes']").prop("checked",true);
		        agree_all = 'N';
		        
		 }else{
		        $("input:radio[id='check_1_yes']").prop("checked",false);
		        $("input:radio[id='check_2_yes']").prop("checked",false);
		        agree_all = 'Y';
		  }
	});
	    
	function changeAgree(){
		
	}
	
	$('.aFrm').submit(function(){
		if($('input[name="check_1"]:checked').val()=='no'){
			alert("약관에 동의해주세요");
			return false;
		}
		if($('input[name="check_2"]:checked').val()=='no'){
			alert("약관에 동의해주세요");
			return false;
		}
		return true;
	});
});

</script>		
			
	
			<section class="title">
				<div class="title__bar">
					<span>[회원가입] 약관동의</span>
				</div>
		
			</section>
			
			<section class="board">	
				<ul class ="board__flow">
					<li><i class="fa-solid fa-angle-up"></i></li>
					<li><div class="flow active">1. 약관동의</div><li>
					<li><div class="flow">2. 정보 입력</div><li>
					<li><div class="flow">3. 가입 완료</div><li>
					<li><i class="fa-solid fa-angle-down"></i></li>
				</ul>
				<div class="board__content">
					<form class="aFrm" action="/user/agree" method="post">
						<input type="hidden" name="google_id" value="${u_vo.google_id }" />
						<input type="hidden" name="google_username" value="${u_vo.google_username }" />
						<span class="aTitle">1.이용약관 동의</span>
						<textarea>제1장 총칙
제1조(목적)이 약관은 회사가 온라인으로 제공하는 디지털콘텐츠(이하 "콘텐츠"라고 한다) 및 제반서비스의 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
제2조(정의) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.   
1. "회사"라 함은 "콘텐츠" 산업과 관련된 경제활동을 영위하는 자로서 콘텐츠 및 제반서비스를 제공하는 자를 말합니다. 
2. "이용자"라 함은 "회사"의 사이트에 접속하여 이 약관에 따라 "회사"가 제공하는 "콘텐츠" 및 제반서비스를 이용하는 회원 및 비회원을 말합니다. 
3. "회원"이라 함은 "회사"와 이용계약을 체결하고 "이용자" 아이디(ID)를 부여받은 "이용자"로서 "회사"의 정보를 지속적으로 제공받으며 "회사"가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다. 
4. "비회원"이라 함은 "회원"이 아니면서 "회사"가 제공하는 서비스를 이용하는 자를 말합니다. 
5. "콘텐츠"라 함은 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호·문자·음성·음향·이미지 또는 영상 등으로 표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 전자적 형태로 제작 또는 처리된 것을 말합니다. 
6. "아이디(ID)"라 함은 "회원"의 식별과 서비스이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자 또는 숫자의 조합을 말합니다. 
7. "비밀번호(PASSWORD)"라 함은 "회원"이 부여받은 "아이디"와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 말합니다. 
						</textarea>

						<div class="agree__check">
							<input type="radio" name="check_1" id="check_1_no" value="no" checked>
							<label for="check_1_no">미동의</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" name="check_1" id="check_1_yes" value="yes">
							<label for="check_1_yes">동의</label>
						</div>

						<span class="aTitle">2.개인정보처리방침 동의</span>
						<textarea>사이트가 취급하는 모든 개인정보는 관련법령에 근거하거나 정보주체의 동의에 의하여 수집 보유 및 처리되고 있습니다.
『개인정보보호법률』은 이러한 개인정보의 취급에 대한 일반적 규범을 제시하고 있으며, 사이트는 이러한 법령의 규정에 따라 개인정보의 처리목적에 필요한 최소한의 개인정보를 수집 보유 및 처리하는 개인정보를 공공업무의 적절한 수행과 국민의 권익을 보호하기 위해 적법하고 적정하게 취급할 것입니다.
						</textarea>

						<div class="agree__check">
							<input type="radio" name="check_2" id="check_2_no" value="no" checked>
							<label for="check_2_no">미동의</label>&nbsp;&nbsp;&nbsp;
							<input type="radio" name="check_2" id="check_2_yes" value="yes">
							<label for="check_2_yes">동의</label>
						</div>

						<div class="agree__check">
							<input type="checkbox" id="allChk" class="allChk"/>
							<label for="allChk">모두 동의</label>
						</div>
						<div>
							<input type="submit" class="nextBtn" value="다음"/>
						</div>
					</form>
				</div>
			</section>