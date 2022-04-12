<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
				<h2>비밀번호 찾기</h2>
				<p>앗! 비밀번호를 찾아드릴게요!</p>
			</header>
			<div class="box">
				
				<form action="edit_pw_next.jsp" method="post">
					<table>
						<thead>
							<h4 align="center">※ 비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h4>
						</thead>
						
						<tbody>
							<tr>
								<td align="center" padding="50px">아이디</td>
								<td><input type="text" name="user_id" placeholder="아이디를 입력해 주세요."></td> 
							</tr>
							
							<tr align="center">
								<!-- <td colspan="2"><input type="sumbit" class="button" id="btn" value="다음"></td> -->
								<td colspan="2"><input type="submit" id="btn" value="다음"></td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
		</section>


		<!-- Footer -->
		<%@ include file="./footer.jsp" %>

	</div>

	<!-- Scripts -->

	<!-- <script type="text/javascript">
	
	$(function(){
		$('#btn').click(function(){
			let user_id = $('input[name=user_id]').val();
			console.log("user_id : ", user_id);
		
			let str = '<table><tr><td><h3>비밀번호 재설정</h3></td></tr>'
			str += '<tr><td><p>비밀번호를 변경해주세요.<br>'
			str += '다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</p></td></tr>'
			str += '<tr><td><h4>아이디</h4></td>'
			str += '<td>'+ user_id +'</td></tr>'
			str += '<tr><td><h4>새 비밀번호</h4></td>'
			str += '<td><input type="password" name="user_pw" placeholder="새 비밀번호를 입력해 주세요."></td></tr>'
			str += '<tr><td><h4>새 비밀번호 확인</h4></td>'
			str += '<td><input type="password" name="user_pw" placeholder="새 비밀번호를 다시 입력해 주세요."></td></tr>'
			str += '<tr><td><p>* 영문, 숫자, 특수문자를 함께 사용하면 안전합니다.</p></td></tr></table>'

			$('#next').html(str);
		})
	});
	 -->
	
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

</body>
</html>