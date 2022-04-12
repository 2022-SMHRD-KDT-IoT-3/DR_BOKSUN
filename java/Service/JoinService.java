package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.UserDAO;
import Model.UserDTO;

public class JoinService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[JoinServiceCon.do]");
		
		// post 인코딩
		request.setCharacterEncoding("utf-8");
		
		/*	
		CREATE TABLE t_user
		(
		    user_id           VARCHAR2(30)    NOT NULL, 
		    user_pw           VARCHAR2(30)    NOT NULL, 
		    user_type         CHAR(1)         NOT NULL, 
		    user_name         VARCHAR2(30)    NOT NULL, 
		    user_birthdate    DATE            NOT NULL, 
		    user_gender       CHAR(1)         NOT NULL, 
		    user_phone        VARCHAR2(30)    NOT NULL, 
		    user_region       VARCHAR2(30)    NOT NULL, 
		    user_license      VARCHAR2(30)    NULL, 
		    user_joindate     DATE            DEFAULT SYSDATE NOT NULL, 
		    user_company      VARCHAR2(30)    NULL, 
		    user_comtel       VARCHAR2(30)    NULL, 
		     PRIMARY KEY (user_id)
		);
		*/
		
		
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
		
		String user_license = request.getParameter("user_license");
		String user_company = request.getParameter("user_company");
		String user_com_tel = request.getParameter("user_com_tel");
		
		// 전역변수 선언
		UserDTO udto = null;
		int cnt = 0;
		String nextpage = "Index.jsp";
		
		
		System.out.println("user_type ; " + user_type);
		
		// 복지사는 0 
		if(user_type == '0') {
			udto = new UserDTO(user_id, user_pw, user_type, user_name, user_birthdate, user_gender, user_phone, user_Addr, user_license, "", user_company, user_com_tel);
			cnt = new UserDAO().join0(udto);		
		
		// 보호자는 1
		} else {
			udto = new UserDTO(user_id, user_pw, user_type, user_name, user_birthdate, user_gender, user_phone, user_Addr, "");
			cnt = new UserDAO().join1(udto);
		}

		if(cnt > 0) {
			nextpage = nextpage + "?check=1&status=1";
			System.out.println("회원가입 성공!");
			
		} else {
			nextpage = nextpage + "?check=1&status=2";
			System.out.println("회원가입 실패!");

		}
		
		return nextpage;
	}

}
