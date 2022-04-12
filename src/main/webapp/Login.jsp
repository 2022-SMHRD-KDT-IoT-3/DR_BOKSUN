<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% response.setStatus(HttpServletResponse.SC_OK);%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>
<body class="is-preload" style="font-family: 'GangwonEdu_OTFBoldA';">

	
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="./header.jsp" %>


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>로그인</h2>
				<p>안녕하세요! 복순이입니다.</p>
			</header>
			<div class="box">

					<table>
						<thead>
							<h3 align="center">복순이</h3>
						</thead>
						
						<tbody>
							<tr>
								<td align="center">아이디</td>
								<td><input type="text" name="user_id"></td> 
							</tr>
							<tr>
								<td align="center">비밀번호</td>
								<td><input type="password" name="user_pw"></td> 
							</tr>
							
							<!-- <tr align="center">
								<td colspan="2">
								<div class="col-6 col-12-narrower">
									<input type="checkbox" id="keep_login" name="keep_login">
									<label for="keep_login">로그인 상태 유지</label>
								</div>
								</td>
							</tr> -->
						
							<tr align="center">
								<td colspan="2">
									<input type="button" class="button" onclick="login()" value="로그인"><br>
									<!-- 로그인 에러 메세지 출력 -->
									<span class="error_msg" style="color:red; font-size:small;">
									</span> 
								</td>
							</tr>
							
						</tbody>
					</table>
					<div align="center">
						<a href="#">아이디 찾기</a> &nbsp;&nbsp;
						/ &nbsp;&nbsp; <a href="edit_pw.jsp">비밀번호 찾기</a> &nbsp;&nbsp;
						/ &nbsp;&nbsp; <a href="Join.jsp">회원가입</a>
					
					</div>
			</div>
		</section>


		<!-- Footer -->
		<%@ include file="./footer.jsp" %>

	</div>

	<!-- Scripts -->
	<script type="text/javascript">
		function login() {
			$.ajax({
				url : "LoginServiceCon.do",
				type : "post",
				data : {
					user_id : $('input[name=user_id]').val(),
					user_pw : $('input[name=user_pw]').val()
				},
				dataType : "text",
				success : function(res) {
					if(res == 1){
						// 로그인 성공
						window.location.href="Index.jsp";
					}else {
						// 로그인 실패
						$('.error_msg').html('아이디 또는 비밀번호를 잘못 입력했습니다.<br>'
								+ '입력하신 내용을 다시 확인해주세요.');
					}
				},
				error : function(){		
					alert('실패');
				}
			});
		}
	
	
	</script>
	
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- awesome font -->
	<script src="https://kit.fontawesome.com/8b21a455c5.js" crossorigin="anonymous"></script>

</body>
</html>