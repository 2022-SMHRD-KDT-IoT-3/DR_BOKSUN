<%@page import="Model.QnaDAO"%>
<%@page import="Model.QnaDTO"%>
<%@page import="Model.StoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.StoryDAO"%>
<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
tr, th, td {
	text-align: center;
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


   <div id="page-wrapper">

      <!-- Header -->
		<%@ include file="./header.jsp" %>

   <%
   		// 회원
   		String user_id = udto.getUser_id();
   		
   		// 정보 공유
   		ArrayList<StoryDTO> mystories = new StoryDAO().myBoardAll(user_id);
   		
   		// 문의하기 
   		QnaDTO qdto;
   		
   		// 문의하기 답변
   %>

      <!-- Main -->
      <section id="main" class="container" >
         <header>
            <h2>마이페이지</h2>
            <p>내 정보 관리</p>
         </header>
         <div class="box">
        	<div class="row-6 row-12-mobilep">
            
            <div class="mypage" style="text-align:center;">
            <h3><span class="big-font"><%= udto.getUser_name() %></span>&nbsp;&nbsp;님의 페이지입니다.</h3>
            
			<!-- 회원 정보 수정 : 페이지 이동-->
            <h4><input type="button" style="width:fit-content; margin:5px 5px; border-radius:25px !important;" class="button" value="내 정보 수정" onclick="updateInfo()"></h4>
            </div><br><br>
            
            <!-- 내가 쓴 게시글 보기 -->
            <h4 style="text-align:center;">내가 쓴 게시글</h4><br>
           	<table>
           	<thead>
           		<tr>
           			<th style="text-align:center">번호</th>
           			<th style="text-align:center">게시글 제목</th>
           			<th style="text-align:center">작성일</th>
           			<th style="text-align:center"><i class="fa-solid fa-eye"></i></th>
           			<th style="text-align:center"><i class="fa-solid fa-heart"></i></th>
           		</tr>
           	</thead>
           	
           	<tbody>
            <% if(!mystories.isEmpty()){  int num=1; %>
            	<% for (StoryDTO st : mystories){ %>
           		<tr>
           			<td><%= num %></td>
	           		<td>
	           			<a href="storySelect.jsp?story_seq=<%= st.getStory_seq() %>"><%= st.getStory_title() %></a>
	           		</td>
	           		<td><%= st.getStory_joindate() %></td>
	           		<td><%= st.getStory_cnt() %></td>
	           		<td><%= st.getStory_like() %></td>
           		</tr>
            	<% num++; } %>
            <!-- 게시글이 없을 경우 -->
            <%} else {%>  
        		<tr style="text-align:center">
           			<td colspan="5">게시물이 없습니다.</td>
           		</tr>
            <%} %>
            </tbody>
           	</table>
            <br><br>
            
            <!-- 답변 달렸을 경우, 업데이트 : ajax -->
            <br>
            <h4 style="text-align:center;">내 문의글 답변 확인하기</h4><br>
            <table>
            <thead>
	            <tr>
	            	<th style="text-align:center">번호</th>
	            	<th style="text-align:center">문의글 제목</th>
	            	<th style="text-align:center">작성일</th>
	            	<th style="text-align:center">답변</th>
	            </tr>
            
            <tbody id = "tbody">
	           <!-- 문의글 답변 조회 리스트 -->
            </tbody>
            </table>
            	

		</div>	
   </div>
 </section>
 </div>


   <!-- Scripts -->
   
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		let user_id = "<%= user_id %>";
		console.log(user_id);
		
		
		// 내 문의글 전체 조회 + 답변 여부
   		$.ajax({
   			url : "SelectQnaReplyServiceCon.do",
   			type : "post",
   			data : {
	        	user_id : user_id,
	        },
   			dataType : "json", 
   			success : function(res){
   				$('#tbody').html('');
   				if(res.length == 0){
	            	table = '<tr><td colspan="4" align="center">내가 작성한 문의글이 없습니다.</td></tr>'
	            }
	            else{  
	            	let table ="";
	            	for (let i = 0; i < res.length; i++) {
	            		table = '<tr>';
	            		table += '<td>'+ (i+1) +'</td>';
	            		let qna_seq = res[i].qna_seq;
	            		console.log(qna_seq);
	            		table += '<td><a href=qnaSelect.jsp?qna_seq='+qna_seq+'>'+ res[i].qna_title +'</a></td>';
						table += '<td>'+ res[i].qna_joindate +'</td>';
						if(res[i].rep_seq != ""){
							/*
							if(res[i].qna_seq == res[i].qna_seq){
								table += '<td><i class="fa-solid fa-envelope"></i>'
											+'&nbsp;&nbsp;<i class="fa-solid fa-plus fa-1x"></i></td>';
							} else{ */
								table += '<td><i class="fa-solid fa-envelope"></i></td>';
							//}
							
						} else {
							table += '<td></td>'
						}
						table += '</tr>';
						$('#tbody').append(table);
	            	}
	            }
	        },
	        error : function() {
	            alert('문의 답변 조회 실패!')
	        }
	    })
	});
	
	</script>
   
   
   <script type="text/javascript">

   <!-- 회원 정보 수정 페이지 이동 -->
   	function updateInfo() {
   		location.href="update_info.jsp?user_id=<%= udto.getUser_id() %>";
   	};
   	
   	document.addEventListener("DOMContentLoaded", function() {
   		let succ = <%= request.getParameter("status") %>
   		if(succ == 1){
   			alert("회원 정보가 수정되었습니다.")
   		}
   	});
   </script>
   
   <!-- Footer -->
   <%@ include file="./footer.jsp" %>
   
   
   
   <script src="https://kit.fontawesome.com/8b21a455c5.js" crossorigin="anonymous"></script>
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/jquery.dropotron.min.js"></script>
   <script src="assets/js/jquery.scrollex.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>