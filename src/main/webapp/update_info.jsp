<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>내 정보 수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
				<h2>내 정보 수정</h2>
				<p>정보 수정 페이지입니다.</p>
			</header>
			<div class="box">

            <!-- 사용자와의 관계 : 복지사는 0 보호자는 1 -->
            <form action="UpdateInfoServiceCon.do" method="post">
               <table>
                  <thead>
                     <h3>수정하기</h3>
                  </thead>

                  <tbody>
                     <tr>
						<td>아이디</td>
						<td><%= udto.getUser_id() %></td>
						<input type="hidden" name="user_id" value="<%= udto.getUser_id() %>">
					</tr>
                     <tr>
                        <td>비밀번호</td>
                        <td><input type="password" id="pwd1" name="user_pw"
                           placeholder="5자리 이상 입력해 주세요."></td>
                     </tr>
                     <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" id="pwd2" name="user_pw"
                           placeholder="다시 한 번 입력해 주세요."></td>
                     </tr>

					<!-- 비번 일치 여부 메세지 출력 -->
                     <tr>
                        <td></td>
                        <td>
                           <div class="alert alert-success" id="alert-success">비밀번호가
                              일치합니다.</div>
                           <div class="alert alert-danger" id="alert-danger" style="color:red;">비밀번호가
                              일치하지 않습니다.</div>
                        </td>
                     </tr>

                     <tr>
                        <td>사용자와의 관계</td>
                        <input type="hidden" name="user_type" value="<%= udto.getUser_type() %>">
                        <% if(udto.getUser_type() == '0') { %>
                        	<td>복지사(기관)</td>
		                     <!-- 복지사일 경우 -->
		                     <tr class="comp">
		                        <td>복지관명</td>
		                        <td><input type="text" name="user_company"
		                           placeholder="회사명을 입력해 주세요."></td>
		                     </tr>
		                     <tr class="comp">
		                        <td>복지관 전화번호</td>
		                        <td><input type="text" name="user_comtel"
		                           placeholder="회사 전화번호를 입력해 주세요."></td>
		                     </tr>
		                     <tr class="comp">
		                        <td>복지사 면허번호</td>
		                        <td><input type="text" name="user_license"
		                           placeholder="면허번호를 입력해 주세요."></td>
		                     </tr>
                        <%} else { %>
                        	<td>보호자(가족)</td>
						<%} %>


                     <!-- ------------------------------------------------------ -->
                     <tr>
                        <td>이름</td>
                        <td><input type="text" name="user_name"
                           placeholder="이름을 입력해 주세요."></td>
                     <tr>
                        <td>생년월일</td>
                        <td><input type="date" name="user_birthdate"></td>
                     <tr>
                        <td>연락처</td>
                        <td><input type="text" name="user_phone"
                           placeholder="숫자만 입력해 주세요."></td>
                     <tr>
                        <td>성별</td>
                        <td>
                           <div class="col-4 col-12-narrower">
                              <input type="radio" id="user_gender0" name="user_gender"
                                 value="male" checked> <label for="user_gender0">남자</label>
                              <input type="radio" id="user_gender1" name="user_gender"
                                 value="female"> <label for="user_gender1">여자</label>
                              <input type="radio" id="user_gender2" name="user_gender"
                                 value="none"> <label for="user_gender2">선택안함</label>
                           </div>
                        </td>

                     </tr>
                     <tr>
                        <td>주소</td>
                        <td><input type="text" id="re_postcode" name="re_postcode"
                           placeholder="우편번호"> <input type="button"
                           onclick="user_region()" value="우편번호 찾기"><br> <input
                           type="text" id="re_roadAddress" name="re_roadAddress"
                           placeholder="도로명주소"> 
                           <!-- <input type="hidden" id="re_jibunAddress" name="re_jibunAddress"  placeholder="지번주소">     -->
                           <span id="guide" style="color: #999; display: none"></span> <input
                           type="text" id="re_detailAddress" name="re_detailAddress"
                           placeholder="상세주소" style="margin-top:5px"> <input type="hidden"
                           id="re_extraAddress" name="re_extraAddress" placeholder="법정동">
                        </td>
                     </tr>
                     <tr>
                        <td align="center" colspan="2"><input type="reset"
                           class="button alt" value="재입력"> <input type="submit"
                           id="submit" onClick= "Smessage()" value="수정하기"></td>
                     </tr>
                     <tr>
                     </tr>

                  </tbody>
               </table>

            </form>
		</div>
	</section>
</div>




            <!-- Scripts -->
            
    		<!-- 주소 관련 scripts -->
     		<script>
    			// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 
    			// 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                function user_region() {
                       new daum.Postcode({
                           oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let roadAddr = data.roadAddress; // 도로명 주소 변수
                let extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('re_postcode').value = data.zonecode;
                document.getElementById("re_roadAddress").value = roadAddr;
                /* document.getElementById("re_jibunAddress").value = data.jibunAddress; */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("re_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("re_extraAddress").value = '';
                }

                let guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    let expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    let expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            	}
        		}).open();
   			 }
			</script>

            <script>
            // 카카오 주소 api
            function findAddr(){ new daum.Postcode({ oncomplete: function(data)
            { console.log(data); // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다. // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여
            분기 한다. let roadAddr = data.roadAddress; 
            // 도로명 주소 변수 let jibunAddr =
            data.jibunAddress; 
            // 지번 주소 변수 
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){ document.getElementById("member_addr").value =
            roadAddr; } else if(jibunAddr !== ''){
            document.getElementById("member_addr").value = jibunAddr; } }
            }).open(); }
            </script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


            <!-- 비밀번호 일치 로직 + 불일치 시 전달 막기  제어 -->
            <script type="text/javascript">
            $(function() {
		         $("#alert-success").hide();
		         $("#alert-danger").hide();
		         $("input").keyup(function() {
		            let pwd1 = $("#pwd1").val();
		            let pwd2 = $("#pwd2").val();
		            if (pwd1 != "" || pwd2 != "") {
		               if (pwd1 == pwd2) {
		                  $("#alert-success").show();
		                  $("#alert-danger").hide();
		                  $("#submit").removeAttr("disabled");
		               } else {
		                  $("#alert-success").hide();
		                  $("#alert-danger").show();
		                  $("#submit").attr("disabled", "disabled");
		               }
		            }
		         });
		      });
            
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
            <script src="https://kit.fontawesome.com/8b21a455c5.js"
               crossorigin="anonymous"></script>
</body>
</html>