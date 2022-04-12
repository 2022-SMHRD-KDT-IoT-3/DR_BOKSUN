package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.UserDAO;
import Model.UserDTO;

public class UpdateInfoService implements Command{
@Override
public String execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

	System.out.println("[UpdateInfoServiceCon.do]");
	request.setCharacterEncoding("utf-8");
	String nextpage = "";
	
	// 파라미터 값 가져오기
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");  
	char user_type = (request.getParameter("user_type")).charAt(0); 
	
	String user_name = request.getParameter("user_name");  
	String user_birthdate = request.getParameter("user_birthdate");  
	char user_gender = (request.getParameter("user_gender")).charAt(0);  
	String user_phone = request.getParameter("user_phone");  
	String re_roadAddress = request.getParameter("re_roadAddress");  
	String re_detailAddress = request.getParameter("re_detailAddress");  
	String user_Addr = re_roadAddress + " " + re_detailAddress; 
	
	// 복지사일 경우
	String user_license = "";
	String user_company = "";
	String user_com_tel = "";
	
	if(user_type == '0') {
		user_license = request.getParameter("user_license");
		user_company = request.getParameter("user_company");
		user_com_tel = request.getParameter("user_com_tel");
	}
	
	// 전역변수 선언
	UserDTO udto = null;
	int cnt = 0;
	
	System.out.println("user_type ; " + user_type);
	
	// 복지사는 0 
	if(user_type == '0') {
		udto = new UserDTO(user_id, user_pw, user_type, user_name, user_birthdate, user_gender, user_phone, user_Addr, user_license, "", user_company, user_com_tel);
		cnt = new UserDAO().updateInfoWork(udto);		
	
	// 보호자는 1
	} else {
		udto = new UserDTO(user_id, user_pw, user_type, user_name, user_birthdate, user_gender, user_phone, user_Addr, "");
		cnt = new UserDAO().updateInfoFam(udto);
	}

	if(cnt > 0) {
		System.out.println("회원정보 수정 성공!");
		nextpage += "Mypage.jsp?status=1";
		
	} else {
		System.out.println("회원정보 수정 실패!");
		nextpage += "Mypage.jsp?status=0";
	}
	
	return nextpage;
	}
}
