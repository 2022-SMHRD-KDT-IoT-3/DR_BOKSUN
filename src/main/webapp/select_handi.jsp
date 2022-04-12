<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 조회</title>
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
				<h2>회원 정보 조회</h2>
				<p>회원 정보 조회 페이지입니다.</p>
			</header>
			<div class="box">
				
				<% if(!udto.getUser_id().isEmpty()){%>
					<input type="hidden" name="user_id" id = "user_id" value="<%= udto.getUser_id() %>"/>  <!-- 다른방법물어볼것 -->
				<%}%>
				<h3>회원 전체 리스트</h3>
				<p></p>
				<input type="button" onclick = "regbox()" value="약 보관함 등록" class = "button"/>
				<input type="button" onclick = "delhandi()" value="회원정보 삭제" class = "button" />
				<div class="row">
				<table style="text-align:center">
					<thead>
						<tr>
						<td>선 택</td>
						<td>순 번(id)</td>
						<td>성 명</td>
						<td>성 별 </td>
						<td>생년월일</td>
						<td>주 소</td>
						<td>전화번호</td>
						<%if(udto.getUser_type()=='0'){ %>
							<td>복지사 성명</td>
							<%} else{%>
								<td>보호자 성명</td>
							<%} %>
						</tr>
					</thead>
 					<tbody id = "tbody">
					</tbody>
				</table>	
				</div>
			</div>
		</section>

		<!-- Footer -->
		<%@ include file="./footer.jsp" %>

	</div>

	<!-- Scripts -->
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		$.ajax({
	        url : 'SelectHandiServiceCon.do',
	        type : 'post',
	        data : {
	        	"user_id" : $('input[name=user_id]').val()
	        },
	        dataType: 'json',
	        success : function(res) {
	            $('#tbody').html('');
	            if(res.length == 0){
	            	alert('등록된 환자정보가 없습니다.\n회원정보등록 창으로 이동합니다.');
	            	document.location.href="reg_handi.jsp";
	            }
	            else{
	            	let table ="";
	            	for (let i = 0; i < res.length; i++) {
						table = '<tr>';
						table +='<td><div style = "margin-left: 1.3em"><input type="radio" id="'+res[i].h_seq+'" name="rboChk"><label for="'+res[i].h_seq+'"></label></div></td>'
						table += '<td>'+ (i+1) +'('+res[i].h_seq+')</td>';
						table += '<td>'+ res[i].h_name +'</td>';
						if(res[i].h_gender === "M"){
							table += '<td>남</td>';
						}else{
							table += '<td>여</td>';
						}
						table += '<td>'+ res[i].h_birthdate.slice(0, 10) +'</td>';
						table += '<td>'+ res[i].h_addr +'</td>';
						table += '<td>'+ res[i].h_phone +'</td>';
						table += '<td>'+ res[i].user_id +'</td>';
						table += '</tr>';
						$('#tbody').append(table);
					}
	            }
	        },
	        error : function() {
	            alert('조회실패!')
	        }
	    })
	});
	</script>
	
	<script>
	//선택된 라디오버튼의 행의 값을 가져온다.
	function regbox(){
		let rdoCheck = $("input[name=rboChk]:checked");
		let rdoId = $("input[name=rboChk]:checked").attr("id");
		let name;
		
		rdoCheck.each(function(i){
			let tr = rdoCheck.parent().parent().parent().eq(i);
			let td = tr.children();
			
			name = td.eq(2).text();
			
		})
		
		// 단순 페이지 이동만 할거면 쿼리 스트링이용해서 seq값을 보내주면 되죠
		if(rdoId != null){
			location.href="reg_box.jsp?seq="+rdoId+"&name="+name;
		}
		else{
			alert('등록되거나 선택된 환자가 없습니다.');
		}
		// ajax는 비동기 통신이기 때문에 페이지끼리(jsp -> jsp)이동을 할 수 없다.
		// 그래서 값은 전달이 되더라도 에러를 발생시킨다. success부분 실행x
		/* $.ajax({
	        url : 'reg_box.jsp',
	        type : 'post',
	        dataType:'json',
	        data : {
	        	'json' : JSON.stringify(putData)
	        },
	        success : function(res) {
	            alert('성공' + res);
	            location.href="reg_box.jsp";
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	    }); */
	}
	
	function delhandi(){
		let rdoCheck = $("input[name=rboChk]:checked");
		let seq = $("input[name=rboChk]:checked").attr("id");  //rdoid
		
		// 단순 페이지 이동만 할거면 쿼리 스트링이용해서 seq값을 보내주면 되죠
		if(seq != null){
			$.ajax({
		        url : 'DeleteHandiServiceCon.do',
		        type : 'post',
		        data : {
		        	'h_seq' : seq
		        },
		        dataType : 'text',
		        success : function(res) {
		        	if(res == '1'){
		        		alert('회원정보 삭제 성공');
		        		
		        	}else{
		        		alert('회원정보 삭제 실패');
		        	}
		            	
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		    });
		}
		else{
			alert('등록되거나 선택된 환자가 없습니다.');
		}
		document.location.href="select_handi.jsp";
	}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>