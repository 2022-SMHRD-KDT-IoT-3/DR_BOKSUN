package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.UserDAO;

public class IdCheckService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[IdCheckServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		boolean result = new UserDAO().idCheck(user_id);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
		
		return null;
	}
	
	

}
