<%@page import="Model.CommDAO"%>
<%@page import="Model.CommDTO"%>
<%@page import="Model.StoryDAO"%>
<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>정보 공유 글조회</title>
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
	
		// 게시글
		StoryDAO stdao = new StoryDAO();
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		StoryDTO stdto = stdao.selectBoardOne(story_seq);
		int totalLike = stdao.totalLike(story_seq);
		
		// 댓글 
		CommDAO commdao = new CommDAO();
		ArrayList<CommDTO> commlist = commdao.selectComm(story_seq);
		int totalComm = commdao.totalComm(story_seq);
		
	%>


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>커뮤니티</h2>
				<p>정보 공유</p>
			</header>
			
			<div class="box">
				<blockquote><h3>글 조회</h3></blockquote>
			
				<div class="col-12">
					<h3><%= stdto.getStory_title() %></h3>
					
					<div align="right">
						작성자 <%= stdto.getUser_id() %><br>
						작성일 <%= stdto.getStory_joindate().substring(0,16) %><br>
						조회  <%= stdto.getStory_cnt() %>
						<hr/>
					</div>
					
					<div class="col-12">
						<img src="file/<%=stdto.getStory_file()%>" width="300">
						<span><%= stdto.getStory_content() %></span>
						<hr/>
					</div>
					
					<span class="story-select" id="like">
						<i class="fa-regular fa-heart like"> &nbsp;좋아요</i>
						&nbsp;&nbsp;<span id="likeCnt"><%= stdto.getStory_like() %></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
					
					<span id="comm" class="story-select">
						<i class="fa-regular fa-comment-dots" onclick="#writeComm"></i>
						&nbsp;
						댓글
						&nbsp;&nbsp;<%= totalComm %><br><br> <!-- 총 댓글 수 출력 -->
					</span>
					
					
					<!-- Comment -->
					<section>
						<h3>댓글</h3>
						<!-- 댓글 출력 -->
						<form action="DeleteCommServiceCon.do" method="post">
						<div id="selectCmt">
							 <% for(CommDTO l : commlist){ %>
							 <div>
					 			<h4><%= l.getUser_id() %></h4> 
			            		<%= l.getCmt_content() %><br> 
			            		<%= l.getCmt_joindate() %> 
			            		
			            		<input type="hidden" name="cmt_seq" value="<%= l.getCmt_seq()%>"/>
			            		<input type="hidden" name="story_seq" value="<%= l.getStory_seq()%>"/>
			            		
			            		<!-- 로그인한 아이디와 댓글을 쓴 아이디가 같을 때만 삭제 버튼 보이기 -->
			            		<% if(uid.equals(l.getUser_id())){ %>
			            			<input type="submit" value="삭제" class="button small alt"/>
			            		<%} %>
			            	</div>
							<%} %>
						</div> 
						</form>

						<!-- 댓글 달기 -->
						<div class="comm-div">
							<% if(udto != null){ %>
							<form action="WriteCommServiceCon.do" method="post">
								
								<h4>&nbsp;&nbsp;&nbsp;<%= udto.getUser_id() %></h4>
								<textarea id="cmt" name="cmt_content" cols="8" rows="4" placeholder="댓글을 남겨보세요 :)" style="resize:none" ></textarea>
								
  								<input id="writeCmt" type="submit" value="등록" class="button alt small"  style="float:right"> 
								<br><br><br>
								
								<!-- 컨트롤러로 넘겨줄 값 -->
								<input type="hidden" name="story_seq" value="<%= stdto.getStory_seq()%>">
								<input type="hidden" name="user_id" value="<%= udto.getUser_id() %>">
							</form>
							<%} else {%>
								<p>로그인이 필요합니다.</p>
							<%} %>
						</div>
						
						
						<%
							int story_like = stdto.getStory_like();
						%>

						<script>
						// 좋아요 아이콘 변경
						// 1. id가 like인 '좋아요' 눌렀을 때, 멘트 변경
				        // 속성값 변경일 경우에는 on메소드 사용해야 함!
				        $(document).on('click', '#like', function(){
				            // 내용이 좋아요 -> id : like
				            // 내용이 좋아요 취소 -> id : dislike
				            let str = '<i class="fa-solid fa-heart fa-spin fa-fw"></i>&nbsp;좋아요 취소&nbsp;&nbsp;'
				            	str += '<span><%= stdto.getStory_like()+1 %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
				            $(this).html(str)
				            
				            // id 속성을 다시 부여 : attr
				            $(this).attr('id', 'dislike')
				            
				            // 1-1.story_like에 +1
				            let story_seq = "<%= story_seq %>";
							let story_like = "<%= story_like+1 %>";
							console.log(story_like);
				            
				        	// 1-2. ajax로 like 보내기
							$.ajax({
								url : 'StoryLikeServiceCon.do', /* 어디로 보낼지*/
								type : 'post',
								data : { /* data보내기 */
									story_seq : story_seq,
									story_like : story_like
								},
								dataType : "text",
								success : function(result) {
									$('#likeCnt').html('<%= totalLike %>');
								},
								error : function() {
									alert('실패');
								}

							}); 
						
						})
				        // 2. id가 dislike인 '좋아요 취소' 눌렀을 때, 
				        // 아이콘도, 멘트도 다시 '좋아요'로, id도 다시 like로
				        $(document).on('click', '#dislike', function(){
				        	let str = '<i class="fa-regular fa-heart like">&nbsp;</i>좋아요&nbsp;&nbsp;'
				            	str += '<span><%= stdto.getStory_like() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
				            $(this).html(str)
				
				            // id 속성 다시 부여
				            $(this).attr('id', 'like')
				            
				        	// 2-1.story_like 되돌리기(-1)
				            let story_seq = "<%= story_seq %>";
							let story_like = "<%= story_like-1 %>";
							console.log(story_like);
				            
				        	// 2-2. ajax로 like 보내기
							$.ajax({
								url : 'StoryLikeServiceCon.do', /* 어디로 보낼지*/
								type : 'post',
								data : { /* data보내기 */
									story_seq : story_seq,
									story_like : story_like
								},
								dataType : "text",
								success : function(result) {
									$('#likeCnt').html('<%= totalLike %>');
								},
								error : function() {
									alert('실패');
								}

							}); 
				        })
						
						
						<%-- 새로고침하기 때문에 이벤트 필요 x
						
						$(document).ready(function(){
								
							$('.removeCmt').on('click', function(){
								console.log('test')
					            // 여러 개의 댓글 중, 내가 원하는 댓글만 삭제-!
					            $(this).parent().remove() // p태그 삭제
					        })
	
						})
						--%>

						</script>

					</section>

					<div>
						<a href="storyMain.jsp" class="button">목록</a>
						
						<!-- 글 수정 버튼 제어 -->
						<% if(uid.equals(stdto.getUser_id())){ %>
							<a href="storyUpdate.jsp?story_seq=<%= stdto.getStory_seq() %>" class="button" style="float:right;">글 수정</a>
						<%} %>
					</div>
					
				</div>
			</div>
		</section>
</div>


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