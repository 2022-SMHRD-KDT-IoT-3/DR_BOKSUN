<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

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
	
	<%
		String user_id = request.getParameter("user_id");
	%>

	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="./header.jsp" %>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>비밀번호 재설정</h2>
			</header>
			<div class="box">
				<form action="EditPwServiceCon.do?user_id=<%=user_id%>" method="post">
				<table>
					<thead>
						<h4>※ 비밀번호를 변경해주세요.</h4>
						<h4>※ 다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</h4>
					</thead>

					<tbody>
						<tr>
							<td align="center" padding="50px">아이디</td>
							<td><%=user_id%></td>
						</tr>

						<tr>
							<td><h4>새 비밀번호</h4></td>
							<td><input type="password" id="pwd1" name="user_pw"
								placeholder="새 비밀번호를 입력해 주세요."></td>
						</tr>

						<tr>
							<td><h4>새 비밀번호 확인</h4></td>
							<td><input type="password" id="pwd2" name="check_user_pw"
								placeholder="새 비밀번호를 다시 입력해 주세요."></td>
						</tr>
						<tr>
							<td><p>* 영문, 숫자, 특수문자를 함께 사용하면 안전합니다.</p></td>
						</tr>
					</tbody>	
				</table>
				</form>			
					<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger" style="color:red">비밀번호가 일치하지
						않습니다.</div>
							
					<tr>
						<td colspan="2">
						<input type="submit" id="submit" class="button" value="확인">
						<input type="reset" class="button alt" value="취소">
						</td>
					</tr>
			</div>
		</section>


		<!-- Footer -->
		<%@ include file="./footer.jsp" %>

	</div>

	<!-- Scripts -->
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


	<!-- 버튼 기능 제어 -->
	<script type="text/javascript">
      $(function() {
         $("#alert-success").hide();
         $("#alert-danger").hide();
         $("input").keyup(function() {
            let pwd1 = $("#pwd1").val();
            let pwd2 = $("#pwd2").val();
            if (pwd1 != "" || pwd2 != "") {
               if (pwd1 == pwd2) {
                  $("#alert-success").show();
                  $("#alert-danger").hide();
                  $("#submit").removeAttr("disabled");
               } else {
                  $("#alert-success").hide();
                  $("#alert-danger").show();
                  $("#submit").attr("disabled", "disabled");
               }
            }
         });
      });
   </script>

</body>
</html>