<%@page import="Model.StoryDAO"%>
<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Story</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<style>
table, th, tr, td{
	text-align: center !important;
}
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
		// 회원
		
		// 게시글 리스트
		ArrayList<StoryDTO> list = new StoryDAO().selectBoardAll();
	%>

	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="./header.jsp" %>
	

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>커뮤니티</h2>
				<p>정보 공유 게시판</p>
			</header>
			<div class="box">
				<div class="row-6 row-12-mobilep">
					<table>
						<thead>
							<tr>
								<th></th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th><i class="fa-solid fa-eye"></i></th>
								<th><i class="fa-solid fa-heart"></i></th>
							</tr>						
						</thead>
						
						<tbody>
						<!-- 게시글 번호 -->
						<% int num = 1;%>
						<% for(StoryDTO s : list){ %>
							<tr>
								<td><%= num %></td>
								<td><a href="storySelect.jsp?story_seq=<%= s.getStory_seq() %>">
								<%= s.getStory_title() %></a></td>
								<td><%= s.getUser_id() %></td>
								<td><%= s.getStory_joindate().split(" ")[0] %></td>
								<td><%= s.getStory_cnt() %></td>
								<td><%= s.getStory_like() %></td>
							</tr>
						<% num++; } %>
						</tbody>
					</table>

					<div>
						
						<% if(udto != null){ %>
							<a href="storyWrite.jsp" class="button special" style="float:right">글쓰기</a>
						<%} %>
						
						<div class="task-tabs">
						<input type="text" id="search" placeholder="제목만"/>
						<input type="submit" id="btn" value="검색" class="small" style="float:right;" onclick="search()"/>
						</div>
					</div>
				
				</div>
			</div>
		</section>


		<!-- Footer -->
		<%@ include file="./footer.jsp" %>

	</div>



	<!-- Scripts -->
	<script type="text/javascript">
	isShow= true;
	function search(){
		if(isShow){
			isShow = false;
			$('tbody').hide();
			$('input#btn').val('전체')
		} else{
			isShow = true;
			$('tbody').show();
			$('input#btn').val('검색')
		}
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