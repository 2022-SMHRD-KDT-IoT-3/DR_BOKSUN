<%@page import="Model.QnaReplyDAO"%>
<%@page import="Model.QnaReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.QnaDAO"%>
<%@page import="Model.QnaDTO"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Q & A</title>
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
	
		// 문의글
		ArrayList<QnaDTO> qlist = new QnaDAO().selectQnaAll();
		
	%>

	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="./header.jsp" %>
		

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>커뮤니티</h2>
				<p>Q & A</p>
			</header>
			<div class="box">
				<div class="row-6 row-12-mobilep">
					<table>
						<thead>
							<th></th> <!-- 번호 출력 -->
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>처리 상태</th>
							<th>공개 여부</th>
							<th>조회수</th>
						</thead>
						
						<tbody>
						<!-- 문의글 번호 -->
						<% int num = 1;%>
						<% for(QnaDTO q : qlist){ %>
							<% 
								int qna_seq = q.getQna_seq();
								ArrayList<QnaReplyDTO> qRelist = new QnaReplyDAO().selectQnaReply(q.getQna_seq());
							%>
							<tr>
								<td><%= num %></td>
							<!-- 비밀글 제목 제어 -->
							<% if(q.getQna_title().contains("secret")){ %>
								<!-- 관리자와 비밀글 작성자만 접근 가능 -->
								<% if(udto.getUser_id().equals("admin")|| udto.getUser_id().equals(q.getQna_id())) { %>
								<td><a href="qnaSelect.jsp?qna_seq=<%= q.getQna_seq() %>">
									<%= q.getQna_title().substring(6) %></a></td>
								
								<%} else{ %>
								<td onclick="secret()"><a href="#"><%= q.getQna_title().substring(6) %></a></td>
									
								<%} %>
							<%} else{ %>
								<td><a href="qnaSelect.jsp?qna_seq=<%= q.getQna_seq() %>">
									<%= q.getQna_title() %></a></td>
							<%} %>
								<td><%= q.getQna_id() %></td>
								<td><%= q.getQna_joindate().split(" ")[0] %></td>
							
							<!-- 처리 상태 제어 -->	
							<% if(!qRelist.isEmpty()){ %>
								<td><i class="fa-solid fa-circle-check"></i></td>
							<%} else { %>
								<td><i class="fa-solid fa-spinner"></i></td>
							<%}  %>
							
							<!-- 공개 여부 제어 -->	
							<% if(q.getQna_title().contains("secret")){ %>
								<td><i class="fa-solid fa-lock"></i></td>
							<%} else{%>
								<td></td>
								<!-- <td><i class="fa-solid fa-lock-open"></i></td> -->
							<%} %>
								<td><%= q.getQna_cnt() %></td>
							</tr>
						<% num++; } %>
						</tbody>
					</table>

					<div>
						
						<% if(udto != null){ %>
							<a href="qnaWrite.jsp" class="button special" style="float:right">글쓰기</a>
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
	
	<!-- 검색 기능 -->
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
	

	<!-- 비밀글 제어 -->
	function secret() {
		alert("비밀글은 작성자만 확인할 수 있습니다!");
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