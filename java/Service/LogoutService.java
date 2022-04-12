package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Inter.Command;

public class LogoutService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		System.out.println("[LogoutServiceCon.do]");
		
		HttpSession session = request.getSession();
		session.removeAttribute("udto");
		
		System.out.println("로그아웃 성공!");
		
		String nextpage = "Index.jsp";
		return nextpage;
	}

}
