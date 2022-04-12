<%@page import="Model.QnaReplyDAO"%>
<%@page import="Model.QnaReplyDTO"%>
<%@page import="Model.QnaDAO"%>
<%@page import="Model.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>문의하기 글조회</title>
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

	<%
		// 회원 
		String uid = udto.getUser_id();
	
		// 문의글
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		QnaDTO qdto = new QnaDAO().selectQnaOne(qna_seq); 
		
		// 문의 답변 리스트
		ArrayList<QnaReplyDTO> qRelist = new QnaReplyDAO().selectQnaReply(qna_seq);
		
	%>

		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>커뮤니티</h2>
				<p>Q & A</p>
			</header>
			
			<div class="box">
				<blockquote><h3>문의하기</h3></blockquote>
			
				<!-- 문의글 제목 -->
				<div class="col-12">
				<% if(qdto.getQna_title().contains("secret")){ %>
					<h3><%= qdto.getQna_title().substring(6) %></h3>
				<%} else{ %>
					<h3><%= qdto.getQna_title() %></h3>
				<%} %>
				
					<div>
						작성자 <%= qdto.getQna_id() %><br>
						작성일 <%= qdto.getQna_joindate().substring(0,16) %><br>
						조회  <%= qdto.getQna_cnt() %>
						<hr/>
					</div>
					
					<!-- 문의글 내용 -->
					<div class="col-12">
						<img src="fileQna/<%= qdto.getQna_file() %>" width="300">
						<span><%= qdto.getQna_content() %></span>
						<hr/>
					</div>


					<!-- 문의글 답변 조회 -->
					<form action="DeleteQnaReplyServiceCon.do" method="post">
					<% if(!qRelist.isEmpty()){ %>
						<% for(QnaReplyDTO qRe : qRelist){ %>
						<div>
							<span>답변자 : 관리자</span><br>
							<span>제목 : <%= qRe.getRep_title() %></span><br>
							<span>답변일 : <%= qRe.getRep_joindate() %></span><br>
							<span><%= qRe.getRep_content() %></span><br>
							<input type="submit" value="삭제" class="button alt small" style="margin-bottom:20px;"/>
							
							<span>
							<input type="hidden" name="rep_seq" value="<%= qRe.getRep_seq()%>"/>
							<input type="hidden" name="qna_seq" value="<%= qRe.getQna_seq()%>"/>
							</span>
						</div>
						<%} %>
					<%} else {%>
						<div class="reply">
						<span>아직 관리자의 답변이 달리지 않았습니다.</span>
						</div>
					<%} %>
					</form>
	
	 				<!-- 문의글 답변 작성 :
	 					 로그인한 아이디가 admin일 경우(관리자), 답변 창 보이도록 제어 -->
	 				<div class="comm-div">
	 					<% if(uid.equals("admin")) {%>
	 						<form action="WriteQnaReplyServiceCon.do" method="post">
	 							<h4>&nbsp;&nbsp;<%= udto.getUser_name() %></h4>
	 							<input type="text" name="rep_title" class="rep_title" placeholder="제목">
								<textarea name="rep_content" cols="8" rows="4" placeholder="관리자 답변" style="resize:none" ></textarea>
								
  								<input type="submit" value="등록" class="button alt small" style="float:right; margin-top:15px;"> 
								<br><br><br>
								
								<!-- 컨트롤러로 넘겨줄 값 -->
								<input type="hidden" name="qna_seq" value="<%= qdto.getQna_seq() %>">
								<input type="hidden" name="user_id" value="<%= udto.getUser_id() %>">
	 							
	 						</form>
	 				</div>
	 				
				
					<div>
						<a href="qnaMain.jsp" class="button">목록</a>
						
						<!-- 글 수정 버튼 제어 -->
						<% if(uid.equals(qdto.getQna_id())) { %>
							<a href="qnaUpdate.jsp?qna_seq=<%= qdto.getQna_seq() %>" class="button" style="float:right;">글 수정</a>
						<% }}%>
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