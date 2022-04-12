package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.UserDAO;
import Model.UserDTO;

public class EditPwService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[EditPwServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		int cnt = new UserDAO().editPw(user_id, user_pw);
		
		if(cnt > 0) {
			System.out.println("비밀번호 변경 성공!");
		} else {
			System.out.println("비밀번호 변경 실패!");
		}
		
		String nextpage = "Index.jsp";
		return nextpage;
	}

}
