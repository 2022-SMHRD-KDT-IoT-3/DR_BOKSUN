<%@page import="Model.SelectHandiDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.PrintWriter"%>
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

<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
li{
    list-style:none;
    padding-left:0px;
}
</style>

</head>	
<body class="is-preload" style="font-family: 'GangwonEdu_OTFBoldA';">
	<div id="page-wrapper">
		<% 
			request.setCharacterEncoding("UTF-8");
			
			String seq = request.getParameter("seq");
			String name = request.getParameter("name");
		%>

		<!-- Header -->
		<%@ include file="./header.jsp" %>


		<!-- Main -->
		<section id="main" class="container">
			<header>
				<h2>약 보관함 등록</h2>
				<hr>
				<h4>
				<i class="fa-solid fa-capsules"></i>
					<!-- 실사용자 이름 출력 (수정 필요)-->
					<strong><%=name %></strong>님, 약 보관함 페이지입니다.
				</h4>
				<span></span>
			</header>
			
			
				<div>
					<div class="row-6 row-12-mobilep">
						<table style="margin-left:-65px;">
							<thead>
			                     <tr>
			                        <td colspan="7" align="center">
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;사용자의 약 보관함 정보를 등록해 주세요.<br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;처방의료기관(병원명, 약국명)입력해 주세요.<br><br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;7번보관함(바르는약 ex.후시딘,소독약 등)<br>- 복약 및 사용 안내에 (ex.후시딘, 상처)라고 기재 해 주세요.<br><br>
			                        <i class="fa-solid fa-check"></i> &nbsp;&nbsp;8번보관함(복용약 ex.타이레놀,종합약 등)<br>- 하루 최대 복용가능 횟수를 기재 해 주세요.</td>
			                     </tr>

			                     <tr id = "colSize">
			                        <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;함&nbsp;&nbsp;&nbsp;&nbsp;</td>
			                        <td align="center">약 이름</td> <!-- med_box -->
			                        <td align="center">처방 의료 기관</td> <!-- med_hosp -->
			                        <td align="center">용 법</td> <!-- way -->
			                        <td align="center">처방 일자</td> <!-- med_date -->
			                        <td align="center">복용시간 알람</td> <!-- med_alarm -->
			                        <td align="center">개별수정</td> <!-- med_update -->
			                        <td align="center">개별삭제</td> <!-- med_remove -->
			                     </tr>
		                     </thead>
		                     
		                     
		                     <tbody id = "data_list">
			                     <tr>
			                        <td align="center">1</td>
			                        <td bgcolor="white"><input type="text" name="med_box1"style="width: 170px;"></td>             
			                        <td><input type="text" name="med_hosp1" style="width: 170px;"></td>
			                        <td><input type="text" name="med_way1" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date1"></td>    
			                        <td><input type="time" name="med_alarm1" style="margin-left:15px"></td>  
			                        <td><input type="button" class="button updatebtn" id="med_update1" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button" id="med_remove1" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                     </tr>
			
			                     <tr>
			                        <td   align="center">2</td>
			                        <td bgcolor="white"><input type="text" name="med_box2"></td>
			                        <td><input type="text" name="med_hosp2" style="width: 170px;"></td>
                                    <td><input type="text" name="med_way2" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date2"></td>    
                                    <td><input type="time" name="med_alarm2" style="margin-left:15px"></td>
                                    <td><input type="button" class="button updatebtn" id="med_update2" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove2" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>  
			                     </tr>
			
			                     <tr>
			                        <td   align="center">3</td>
			                        <td bgcolor="white"><input type="text" name="med_box3"></td>
			                        <td><input type="text" name="med_hosp3" style="width: 170px;"></td>
                                    <td><input type="text" name="med_way3" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date3"></td>    
                                    <td><input type="time" name="med_alarm3" style="margin-left:15px"></td> 
                                    <td><input type="button" class="button updatebtn" id="med_update3" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove3" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                     </tr>
			
			                     <tr>
			                        <td   align="center">4</td>
			                        <td bgcolor="white"><input type="text" name="med_box4"></td>
			                        <td><input type="text" name="med_hosp4" style="width: 170px;"></td>
                                    <td><input type="text" name="med_way4" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date4"></td>    
                                    <td><input type="time" name="med_alarm4" style="margin-left:15px"></td>
                                    <td><input type="button" class="button updatebtn" id="med_update4" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove4" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>    
			                     </tr>
			
			                     <tr>
			                        <td   align="center">5</td>
			                        <td bgcolor="white"><input type="text" name="med_box5"></td>
			                        <td><input type="text" name="med_hosp5" style="width: 170px;"></td>
                                    <td><input type="text" name="med_way5" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date5"></td>    
                                    <td><input type="time" name="med_alarm5" style="margin-left:15px"></td>
									<td><input type="button" class="button updatebtn" id="med_update5" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove5" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>     
			                     </tr>
			
			                     <tr>
			                        <td   align="center">6</td>
			                        <td bgcolor="white"><input type="text" name="med_box6"></td>
			                        <td><input type="text" name="med_hosp6" style="width: 170px;"></td>
                                    <td><input type="text" name="med_way6" style="width: 170px;"></td>   
                                    <td><input type="date" name="med_date6"></td>    
                                    <td><input type="time" name="med_alarm6" style="margin-left:15px"></td>
                                    <td><input type="button" class="button updatebtn" id="med_update6" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove6" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>      
			                     </tr>
			                     
			                    <tr>
			                        <td   align="center">7</td>
			                        <td bgcolor="white"><input type="text" name="med_box7"></td>
			                        <td><input type="text" name="med_hosp7" style="width: 170px;"></td>
			                        <td><input type="text" name="med_way7" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date7"></td>    
                                    <td><input type="time" name="med_alarm7" style="margin-left:15px"></td>
                                    <td><input type="button" class="button updatebtn" id="med_update7" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove7" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>    
			                    </tr>
			                    
			                    <tr>
			                        <td   align="center">8</td>
			                        <td bgcolor="white"><input type="text" name="med_box8"></td>
			                        <td><input type="text" name="med_hosp8" style="width: 170px;"></td>
			                        <td><input type="text" name="med_way8" style="width: 170px;"></td>   
			                        <td><input type="date" name="med_date8"></td>    
                                    <td><input type="time" name="med_alarm8" style="margin-left:15px"></td>
                                    <td><input type="button" class="button updatebtn" id="med_update8" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>
			                        <td><input type="button" class="button deletebtn" id="med_remove8" style="margin-left:15px; font-family: 'GangwonEdu_OTFBoldA';" value ="클릭"></td>    
			                    </tr>
			                    
			                     <tr>
			                        <td colspan="7" align="center">
			                        <input type="button" onclick="RegBoxAll()" value="전체 일괄 정보등록"> 
			                        <input type="reset" onclick="DelBoxAll()" value="전체 초기화" class="button alt">
			                        </td> 
			                     </tr>
			                    </span>
		                     </tbody>
							
						</table>
			
			  			<script>
			  			</script>
					</div>
				</div>
			
		</section>


		<!-- Footer -->
		<%@ include file="./footer.jsp" %>



		<!-- Scripts -->
		<script>
		document.addEventListener("DOMContentLoaded", function() {
			$.ajax({
		        url : 'SelectMediServiceCon.do',
		        type : 'post',
		        data : {
		        	"h_seq" : <%=seq%>
		        },
		        dataType: 'json',
		        success : function(res) {
		        	if(res.length !== 0){
		        		$('#data_list').html('');
			            let table ="";
			            let med_name;
			            let med_hosp;
			            let med_way;
			            for (let i = 0; i < res.length; i++) {
			            	med_name='';
				            med_hosp='';
				            med_way='';
				            if(res[i].med_name !== undefined)
				            	med_name = res[i].med_name;
				            if(res[i].med_hosp !== undefined)
				            	med_hosp = res[i].med_hosp;
				            if(res[i].med_name !== undefined)
				            	med_way = res[i].med_way;
				            
							table = '<tr id="'+i+1+'">';
							table +='<td align="center" >'+res[i].med_num+'</td>'
							table += '<td bgcolor="white"><input type="text" name="med_box'+(i+1)+'"style="width: 170px;" value='+med_name+'></td>';
							table += '<td><input type="text" name="med_hosp'+(i+1)+'" style="width: 170px;" value="'+med_hosp+'"></td>';
							table += '<td><input type="text" name="med_way'+(i+1)+'" style="width: 170px;" value="'+med_way+'"></td>';
							table += '<td><input type="date" name="med_date'+(i+1)+'" value="'+res[i].med_date+'"></td>';
							table += '<td><input type="time" name="med_alarm'+(i+1)+'" style="margin-left:15px" value="'+res[i].med_alarm+'"></td>';  
							table += '<td><input type="button" class="button updatebtn" id="med_update'+(i+1)+'" style="margin-left:15px; font-family: "ImcreSoojin";" value ="클릭"></td>'; 
							table += '<td><input type="button" class="button deletebtn" id="med_delete'+(i+1)+'" style="margin-left:15px; font-family: "ImcreSoojin";" value ="클릭"></td>';
							table += '</tr>';
							$('#data_list').append(table);
						}
			            table += '<tr><td colspan="7" align="center">'
			            table += '<input type="button" onclick="RegBoxAll()" value="전체 일괄 정보등록" style="font-family: "ImcreSoojin";">';
			            table += '<input type="reset" onclick="DelBoxAll()" value="전체 초기화" class="button alt" style="font-family: "ImcreSoojin";"></td></tr>';
			            $('#data_list').append(table);
		        	}
		           },
		        error : function() {
		            alert('조회실패!')
		        }
		    })
		});
		</script>
		
		<script>	
		function RegBoxAll(){
			let putData=[];
			
			$("#data_list tr").each(function(i){
				let td = $(this).children();
				
				//if(td.children().eq(0).val()!='' || td.children().eq(1).val() != '') 테스트중
				putData.push({
					"h_seq"   : <%=seq%>,
					"med_num"   : td.eq(0).text(),
					"med_name"  : td.children().eq(0).val(),
					"med_hosp"  : td.children().eq(1).val(),
					"med_way"   : td.children().eq(2).val(),
					"med_date"  : td.children().eq(3).val(),
					"med_alarm" : td.children().eq(4).val(),
					"user_id"   : '<%=udto.getUser_id()%>'
				});
				
			})
			putData.pop();  //마지막 배열 값 제거
			console.log(putData);
			// ajax는 비동기 통신이기 때문에 페이지끼리(jsp -> jsp)이동을 할 수 없다.
			// 그래서 값은 전달이 되더라도 에러를 발생시킨다. success부분 실행x
			$.ajax({
		        url : 'RegMediboxServiceCon.do',
		        type : 'post',
		        dataType:'json',
		        data : {
		        	'func' : 'regboxall',
		        	'json' : JSON.stringify(putData)
		        },
		        success : function(res) {
		        	console.log(res);
		        	if(res == "2")
		            	alert('전체 정보 등록 성공');
		        	else if(res == "1")
		        		alert('일부 정보 등록 실패!\n기존에 등록되어 있는 정보는 \n"개별수정"으로 정보를 변경해주세요! 없는 정보만 새로 생성되었습니다.');
		        	else
		        		alert('전체 정보 등록 실패!\n기존에 전체 등록을 한번 하셨다면\n전체 초기화 후 새로 일괄 등록하시거나\n기존에 등록되어 있는 정보만 수정은 \n"개별수정"으로 변경해주세요!');
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		    });
		}
		</script>
		
		<script>
		function DelBoxAll(){
			$.ajax({
		        url : 'RegMediboxServiceCon.do',
		        type : 'post',
		        dataType:'json',
		        data : {
		        	'func' : 'delboxall',
		        	"h_seq"   : <%=seq%>
		        },
		        success : function(res) {
		        	console.log(res);
		        	if(res == "1"){
		        		alert('전체 정보 삭제 성공!');	
		        	}
		        	else{
		        		alert('전체 정보 삭제 실패!\n기존에 등록되어 있는 정보는 \n"개별삭제"으로 정보를 삭제해주세요!');
		        	}
		        		
		        	location.reload();
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		        
		    });
		}
		</script>
		
		<script>	
        // 버튼 클릭시 Row 값 가져오기
    	$(document).on("click", ".updatebtn", function(){
            let putData1 = [];    // 배열 선언
            let btnUpdate = $(this);

            // checkBtn.parent() : checkBtn의 부모는 <td>이다.
            // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
            let tr = btnUpdate.parent().parent();
            let td = tr.children();
            
            console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
            // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
            putData1.push({
				"h_seq"   : <%=seq%>,
				"med_num"   : td.eq(0).text(),
				"med_name"  : td.children().eq(0).val(),
				"med_hosp"  : td.children().eq(1).val(),
				"med_way"   : td.children().eq(2).val(),
				"med_date"  : td.children().eq(3).val(),
				"med_alarm" : td.children().eq(4).val(),
				"user_id"   : '<%=udto.getUser_id()%>'
			});
            
            console.log("배열에 담긴 값 : "+putData1);
            
            $.ajax({
		        url : 'RegMediboxServiceCon.do',
		        type : 'post',
		        dataType:'json',
		        data : {
		        	'func' : 'regbox',
		        	'json' : JSON.stringify(putData1)
		        },
		        success : function(res) {
		        	console.log(res);
		        	if(res == "1")
		            	alert('개별 정보 등록 성공');
		        	else
		        		alert('개별 정보 등록 실패');
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		    }); 
        });
		</script>
		
				<script>	
        // 버튼 클릭시 Row 값 가져오기
    	$(document).on("click", ".deletebtn", function(){
            let putData2 = [];    // 배열 선언
            let btnDelete = $(this);

            // checkBtn.parent() : checkBtn의 부모는 <td>이다.
            // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
            let tr = btnDelete.parent().parent();
            let td = tr.children();
            
            console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
            // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
            putData2.push({
				"h_seq"   : <%=seq%>,
				"med_num"   : td.eq(0).text(),
				"med_name"  : td.children().eq(0).val(),
				"med_hosp"  : td.children().eq(1).val(),
				"med_way"   : td.children().eq(2).val(),
				"med_date"  : td.children().eq(3).val(),
				"med_alarm" : td.children().eq(4).val(),
				"user_id"   : '<%=udto.getUser_id()%>'
			});
            
            console.log("배열에 담긴 값 : "+putData2);
            
            $.ajax({
		        url : 'RegMediboxServiceCon.do',
		        type : 'post',
		        dataType:'json',
		        data : {
		        	'func' : 'delbox',
		        	'json' : JSON.stringify(putData2)
		        },
		        success : function(res) {
		        	console.log(res);
		        	if(res == "1")
		            	alert('개별 정보 삭제 성공');
		        	else
		        		alert('개별 정보 삭제 실패');
		        	
		        	
		        },
		        error:function(request,status,error){
		            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		    });
            location.ref = "reg_box.jsp";
        });
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
