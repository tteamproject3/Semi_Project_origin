<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 807255779746-g38g7anne185lap9hucopa8rhnn4gbo7.apps.googleusercontent.com -->
<!-- 587344456746-qits6jitnj2npb8l5o1obpslf4j3536p.apps.googleusercontent.com  -->
<!--   -->
<style>
	.login{
		background-color: var(--bg-color-lightBlue-2);
		border-radius: calc(var(--strong-radius)*2);
		box-shadow: var(--bigger-shadow);
		position: relative;
		top: calc(var(--super-space)*(-2));
		width: 30%;

	}
	.login ul {
		display: flex;
		flex-wrap: wrap;
		align-content: space-around;
		width: 100%;
		padding: 5% 5%;

		/* padding: var(--large-space) calc(var(--large-space)*3); */
	}
	.login ul>li {
		width: 26%;
		color: var(--ct-color-gray-dark);
		font-size: var(--medium-font-size-1);
		padding: 2%;

	}
	.button {
		width: 40%;
		height: 10%;
		border: none;
		border-radius: var(--strong-radius);
		background-color: var(--main-color);
		color: var(--main-bg-color);
		font-size: var(--large-font-size-3);
		text-align: center;
		margin-top: var(--medium-space);

	}
	.login_wrap {
		margin: 0 auto;
		height: 30%;
		text-align: center;
	}
	h1 {
		font-size: 30px;
	}
	.inner_content{
		padding-top: 10%;
	}



</style>


<div class="top">
	<div>
		<div class="main_title">On The Way</div>
		답답한 일상을 벗어나고 싶은데 어디로 갈지 모르겠다면?
		<h3>온 더 웨이와 함께하는 일상탈출</h3>
	</div>
</div>
<section class="login">
	<!-- SEARCH FORM -->
<div class="login_wrap">
<div class="inner_content">
			<h1>소셜로그인</h1>
			<br>





			<button class="button" name="button" onclick="location.href='/auth/google' ">Google</button>

</div>
</div>
</section>
