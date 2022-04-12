package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;
import Model.UserDAO;
import Model.UserDTO;

public class LoginService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[LoginServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		System.out.println("user_id : " + user_id);
		System.out.println("user_pw : " + user_pw);
		
		UserDTO udto = new UserDAO().login(user_id, user_pw);

		PrintWriter out = response.getWriter();
		
		if(udto != null) {
			System.out.println("로그인 성공!");
			
			HttpSession session = request.getSession();
			session.setAttribute("udto", udto);
			out.print(1);
			out.close();
			
		}else {
			System.out.println("로그인 실패!");
			out.print(0);
			out.close();
			
		}
		
		String nextpage = null;
		return nextpage;
	}
	

}
