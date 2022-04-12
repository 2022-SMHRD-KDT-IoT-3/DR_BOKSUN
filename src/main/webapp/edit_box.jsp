<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약 보관함 수정</title>
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
				<h2>약 보관함 수정</h2>
				<hr>
				<h4>
					<i class="fa-solid fa-capsules"></i>
					<!-- 실사용자 이름 출력 (수정 필요)-->
					<strong>고점례</strong>님, 약 보관함 페이지입니다.
				</h4>
			</header>
			<div class="box">
				<span class="image featured"><img src="images/med_box.png"
					style="width:50%; display: block; margin: 0px auto;" align="center" alt="" />
				</span>

				<div>
					<div class="row-6 row-12-mobilep">
						<table>
							<thead>
			                     <tr>
			                        <td colspan="7" align="center">
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;사용자의 약 보관함 정보를 등록해 주세요.<br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;시간대별로 나누어 입력해 주세요. (아침, 점심, 저녁) </td>
			                     </tr>

			                     <tr>
			                        <td align="center">함</td>
			                        <td align="center">약 이름</td>
			                        <td align="center">처방 의료 기관</td>
			                        <td align="center">복약 안내</td>
			                        <td align="center">처방 일자</td>
			                        <td align="center">약 유통기한</td>
			                     </tr>
		                     </thead>
		                     
		                     <form action="" method="post">
		                     <tbody>
			                     <tr>
			                        <td bgcolor="white" align="center">1</td>
			                        <td bgcolor="white"><input type="text" name="med_box1"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp1"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert1" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date1"></td>    
			                        <td><input type="date" name="med_exp_date1" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">2</td>
			                        <td bgcolor="white"><input type="text" name="med_box2"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp2"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert2" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date2"></td>    
			                        <td><input type="date" name="med_exp_date2" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">3</td>
			                        <td bgcolor="white"><input type="text" name="med_box3"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp3"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert3" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date3"></td>    
			                        <td><input type="date" name="med_exp_date3" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">4</td>
			                        <td bgcolor="white"><input type="text" name="med_box4"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp4"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert4" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date4"></td>    
			                        <td><input type="date" name="med_exp_date4" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">5</td>
			                        <td bgcolor="white"><input type="text" name="med_box5"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp5"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert5" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date5"></td>    
			                        <td><input type="date" name="med_exp_date5" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">6</td>
			                        <td bgcolor="white"><input type="text" name="med_box6"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp6"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert6" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date6"></td>    
			                        <td><input type="date" name="med_exp_date6" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">7</td>
			                        <td bgcolor="white"><input type="text" name="med_box7"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp7"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert7" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date7"></td>    
			                        <td><input type="date" name="med_exp_date7" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td bgcolor="white" align="center">8</td>
			                        <td bgcolor="white"><input type="text" name="med_box8"
			                           style="width: 150px" placeholder="입력"></td>
			                            
			                        <td><input type="text" name="med_hosp8"
			                           style="width: 150px;"></td>
			                           
			                        <td><input type="text" name="med_alert8" style="width: 150px;"></td>   
			                        <td><input type="date" name="med_date8"></td>    
			                        <td><input type="date" name="med_exp_date8" style="margin-left:15px"></td>    
			                     </tr>
			
			                     <tr>
			                        <td colspan="6" align="center">
			                        <input type="submit" value="수정 완료">
			                        <input type="reset" value="수정 취소" class="button alt">
			                        </td> 
			                     </tr>
		                     </tbody>
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
