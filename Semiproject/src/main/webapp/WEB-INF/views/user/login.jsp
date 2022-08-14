<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 807255779746-g38g7anne185lap9hucopa8rhnn4gbo7.apps.googleusercontent.com -->
<!-- 587344456746-qits6jitnj2npb8l5o1obpslf4j3536p.apps.googleusercontent.com  -->
<!--   -->

<script src="https://accounts.google.com/gsi/client" async defer></script>
<div id="g_id_onload"
     data-client_id="807255779746-g38g7anne185lap9hucopa8rhnn4gbo7.apps.googleusercontent.com"
     data-callback="handleCredentialResponse">
</div>
<script>
  function handleCredentialResponse(response) {
     // decodeJwtResponse() is a custom function defined by you
     // to decode the credential response.
     const responsePayload = decodeJwtResponse(response.credential);

    /*  console.log("ID: " + responsePayload.sub); */
     console.log('Full Name: ' + responsePayload.name);
     /* console.log('Given Name: ' + responsePayload.given_name);
     console.log('Family Name: ' + responsePayload.family_name);
     console.log("Image URL: " + responsePayload.picture); */
     console.log("Email: " + responsePayload.email);
     
     location.href = "/user/loginOk?g_id="+responsePayload.email+"&g_name="+responsePayload.name; 
  }
  function decodeJwtResponse(token) {
	    var base64Url = token.split('.')[1];
	    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
	        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	    }).join(''));

	    return JSON.parse(jsonPayload);
	};
</script>


<section class="title">
	<div class="title__bar">
		<span>구글로그인 연동 중</span>
	</div>
</section> 