<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 공유 글쓰기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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
				<h2>커뮤니티</h2>
				<p>정보 공유</p>
			</header>
			
			<div class="box">
				<div class="row"> 
					<div class="row-6 row-12-mobilep">
						<!-- Form -->
						<form action="StoryBoardServiceCon.do" method="post" enctype="multipart/form-data">
							<div class="row gtr-uniform gtr-50">
								<blockquote><h3>글쓰기</h3></blockquote>
							
								<div class="col-12">
									<input type="text" name="story_title" placeholder="제목을 작성해 주세요."/>
									<input type="hidden" name="user_id" value="<%= udto.getUser_id()%>"/>
									<input type="hidden" name="story_cnt" value=0>
									<input type="hidden" name="story_like" value=0>
								</div>
								
								<div class="col-12">
									<input name="story_file" type="file" style="float: right;"/>
								</div>
								
								<div class="col-12">
									<textarea name="story_content" placeholder="내용을 작성해 주세요." rows="6"></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="submit" value="작성" /></li>
										<li><input type="reset" value="초기화" class="alt"/></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>  
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

</body>
</html>