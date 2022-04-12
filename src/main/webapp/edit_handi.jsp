<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정</title>
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

	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="./header.jsp" %>
		


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>회원 정보 수정</h2>
				<p><i class="fa-regular fa-bell"></i>&nbsp;&nbsp;여기는 약통 사용자의 정보를 수정하는 곳입니다.</p>
			</header>
			<div class="box">
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>

				<div class="table-wrapper" >
					<div class="row-6 row-12-mobilep">
						<table>
							<tr>
								<td colspan="2" bgcolor="white"
									align="center">※ 약통 사용자의 정보를 수정해 주세요.</td>
							</tr>
							
							<tr>
								<td bgcolor="white" align="right">사용자와의 관계</td>
								<td bgcolor="white">
								<!-- 사용자와의 관계 출력할 공간 -->
								
								</td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">이름</td>
								<td bgcolor="white"><input type="text" name="h_name"></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">생년월일</td>
								<td bgcolor="white">
								<input type="date" name="h_birthdate"></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">성별</td>
								<td>
									<div class="col-4 col-12-narrower">
										<input type="radio" id="user_gender0" name="user_gender"
														value="male" checked>
										<label for="user_gender0">남자</label>
										<input type="radio" id="user_gender1" name="user_gender"
														value="female">
										<label for="user_gender1">여자</label>
										<input type="radio" id="user_gender2" name="user_gender"
														value="none">
										<label for="user_gender2">선택안함</label>
									</div>
								<td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">연락처</td>
								<td bgcolor="white"><input type="text" name="h_phone" placeholder="'-'표시를 제외하고 입력해주세요."></td>
							</tr>

							<tr>
								<td bgcolor="white" align="right">비상연락망</td>
								<td bgcolor="white"><input type="text" name="h_phone_emg" placeholder="'-'표시를 제외하고 입력해주세요."></td>
							</tr>


							<tr>
								<td bgcolor="white" align="right">주소</td>
								<td><input type="text" name="h_addr_zip" placeholder="우편번호">
									<input type="submit" value="검색하기"><br> 
									<input type="text"
									name="h_addr" placeholder="상세 주소를 입력해주세요."></td>
								</td>
								</td>
							</tr>

							<tr bgcolor="white" colspan="2">
								<td colspan="2" align="center">
								<input type="submit"
									value="수정"> <input type="reset" value="취소"></td>
							</tr>
							</form>
						</table>


					</div>

				</div>
			</div>
		</section>



		<!-- Footer -->
		<%@ include file="./footer.jsp" %>



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
