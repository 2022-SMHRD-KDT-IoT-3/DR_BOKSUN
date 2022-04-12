<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<% 
			UserDTO udto = (UserDTO)session.getAttribute("udto");

			// handicaped
			
		%>


		<!-- Header -->
		<header id="header">
			<h1>
				<a href="Index.jsp">복순이&nbsp;&nbsp;</a>by dr.boksun
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="Index.jsp">홈</a></li>
					<li><a href="select_handi.jsp">정보 등록 및 조회&nbsp;&nbsp;&nbsp;<i
							class='icon solid fa fa-angle-down'></i>
					</a>
						<ul>
							<li><a href="reg_handi.jsp">회원 정보 등록</a></li>
							<li><a href="reg_box.jsp">보관함 등록 및 조회</a></li>
						</ul></li>
					<li class='sub-menu'><a href="community_Main.jsp">커뮤니티&nbsp;&nbsp;&nbsp;<i
							class='fa fa-angle-down'></i></a>
						<ul>
							<li><a href="qnaMain.jsp">문의하기</a></li>
							<li><a href="storyMain.jsp">정보 공유</a></li>
						</ul></li>
					<li class='sub-menu'><a href="#">마이페이지&nbsp;&nbsp;&nbsp;<i
							class='fa fa-angle-down'></i></a>
						<ul>
							<li><a href="edit_info.jsp">내 정보 수정</a></li>
							
							<% if(udto != null){ %>
								<li><a href="edit_pw_next.jsp?user_id=<%= udto.getUser_id()%>">비밀번호 재설정</a></li>
							<%} else{ %>
								<li><a href="edit_pw.jsp">비밀번호 변경</a></li>
							<%} %>
							<li><a href="select_user0.jsp">담당 복지사 조회</a></li>
							<li><a href="select_user1.jsp">보호자 조회</a></li>
						</ul></li>

					<% if(udto != null){ %>
						<li><a href="LogoutServiceCon.do" class="button">로그아웃</a></li>
					<%} else{%>
						<li><a href="Login.jsp" class="button">로그인</a></li>
					<%} %>

				</ul>
			</nav>
		</header>



		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>Community</h2>
				<p>문의 & 정보공유 게시판입니다</p>
			</header>
			<div class="box">
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>
				<h3>전체 글</h3>
				<p></p>
				<table>
				<tbody>
				 		<th></th>
                        <th>게시판 유형</th>
                        <th>글 제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>댓글</th>
                        
                        <tr>
						   <td>3</td>
                           <td>[문의합니다]</td>
                           <td>허숙희 보호자 질문입니다.</td>
                           <td>잠만보</td>
                           <td>1</td>
                           <td>1</td>
                        </tr>
                        
                        <tr>
						   <td>2</td>
                           <td>[정보공유]</td>
                           <td>하루 30분 걷기가 건강을 책임진다!</td>
                           <td>한라봉봉</td>
                           <td>100</td>
                           <td>24</td>
                        </tr>
                        
                        <tr>
						   <td>1</td>
                           <td>[문의합니다]</td>
                           <td>김점례 보호자 질문입니다.</td>
                           <td>취두부존맛</td>
                           <td>1</td>
                           <td>1</td>
                        </tr>
				
					<tr>
						<td>
						<div class="col-12">
							<ul class="actions">
								<li><input type="submit" value="글쓰기" /></li>
							</ul>
						</div></td>
					</tr>
				</div>
				</tbody>
			</table>	
			</div>
		</section>


		<!-- Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon brands fa-google-plus"><span
						class="label">Google+</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>