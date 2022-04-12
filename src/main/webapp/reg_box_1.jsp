<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약 보관함 등록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
@font-face {
    font-family: 'ImcreSoojin';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.3/ImcreSoojin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>
<body class="is-preload" style="font-family: 'ImcreSoojin';">
	<div id="page-wrapper">
		
		<% 
			// handicaped
			
		%>


		<!-- Header -->
		<%@ include file="./header.jsp" %>


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>약 보관함 등록</h2>
				<hr>
			</header>
			
				<div class="row-6 row-12-mobilep">
					<table>
						<thead>
		                     <tr>
		                        <td colspan="7" align="center">
								<h4>
								<i class="fa-solid fa-capsules"></i>
									<!-- 실사용자 이름 출력 (수정 필요)-->
									<strong>고점례</strong>님, 약 보관함 페이지입니다. <br><br>
								</h4>
								
								<span><img src="images/med_box.png"
									style="width:50%; display: block; margin: 0px auto; " title="아침, 점심, 저녁으로 구분하시면 좋아요:)"/>
								</span>
								
								<br><br>
		                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;사용자의 약 보관함 정보를 등록해 주세요.
		                        <br>
		                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;처방의료기관(병원명, 약국명)입력해 주세요.
		                        <br><br>
		                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;7번보관함(바르는약 ex.후시딘,소독약 등)<br>- 복약 및 사용 안내에 (ex.후시딘, 상처)라고 기재해 주세요.
		                        <br><br>
		                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;8번보관함(복용약 ex.타이레놀,종합약 등)<br>- 하루 최대 복용가능 횟수를 기재해 주세요.
		                        <br><br><br>
		                        </td>
		                        
		                     </tr>

		                     <tr>
		                        <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;함&nbsp;&nbsp;&nbsp;&nbsp;</td>
		                        <td align="center">약 이름</td> <!-- med_box -->
		                        <td align="center">처방 의료 기관</td> <!-- med_hosp -->
		                        <td align="center">복약 및 사용안내</td> <!-- med_alert -->
		                        <td align="center">처방 일자</td> <!-- med_date -->
		                        <td align="center">복용시간 알람</td> <!-- med_alarm -->
		                     </tr>
	                     </thead>
	                     
	                     
	                     <tbody>
		                     <tr>
		                        <td align="center">1</td>
		                        <td bgcolor="white"><input type="text" name="med_box1"
		                           style="width: 210px; margin-left:15px" placeholder="입력"></td>
		                            
		                        <td><input type="text" name="med_hosp1"
		                           style="width: 210px; margin-left:15px"></td>
		                           
		                        <td><input type="text" name="med_alert1" style="width: 210px; margin-left:15px"></td>   
		                        <td><input type="date" name="med_date1" style="margin-left:15px;"></td>    
		                        <td><input type="time" name="med_alarm1" style="margin-left:15px"></td>    

		                     </tr>
                                 
							<tr id="event_box"> 
								<td colspan="7">
                    	     	 <class>
           							<input type="button" value="+" onclick="add_boxes()">
           							<input type="button" value="-" onclick="remove_tr()">
					        	 </class>
					        	</td> 
		                    </tr>
		                    
		                      <tr>
		                        <td colspan="7" align="center">
		                        <input type="submit" value="등록 완료">
		                        <input type="reset" value="초기화" class="button alt">
		                        </td> 
		                     </tr>
	                     </tbody>
						
					</table>
		
			<!-- --------------------------------------------------------------------------------------------------- -->
		  
				</div>
			
		</section>



		<!-- Footer -->




		<!-- Scripts -->
		
		<!-- 박스 추가, 삭제 기능 -->
		<script type="text/javascript">
	    	let cnt = 2;
	    	function add_boxes() {
	    		
	    		let tr = `
	    		<tr id="one`+ cnt +`">
	                <td align="center">` + (cnt++) + `</td>
	                <td bgcolor="white"><input type="text" name="med_box1"
	                   style="width: 170px;" placeholder="입력"></td>
	                    
	                <td><input type="text" name="med_hosp1"
	                   style="width: 170px;"></td>
	                   
	                <td><input type="text" name="med_alert1" style="width: 170px;"></td>   
	                <td><input type="date" name="med_date1"></td>    
	                <td><input type="date" name="med_visit1" style="margin-left:15px"></td> 
	                <td><input type="time" name="med_alarm1" style="margin-left:15px"></td>    
	
	             </tr>
	    		`
	    		
	    		$('#event_box').before(tr);
			}
	    	function remove_tr(){
	    		cnt--;
				$('#one'+cnt).remove();
				
				//<tr id="one`+ cnt +`">    배열의 특징을 이용했기때문에  id="one`+ cnt +`"  는 지워도 됨.
				//let trArray = $('tr');		
				//let removeTr = trArray[(trArray.length - 3)];			
				//$(removeTr).remove();
				
				
	    	}
	    </script>
	    
	    <!-- Footer -->
		<%@ include file="./footer.jsp" %>
	    
	    
	    
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
