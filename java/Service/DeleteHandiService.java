package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.handiDAO;

public class DeleteHandiService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[DeleteHandiServiceCon.do]");
		request.setCharacterEncoding("UTF-8");
		int h_seq = Integer.parseInt(request.getParameter("h_seq"));
		
		int cnt = new handiDAO().deleteHandi(h_seq);
		
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		if(cnt >0) {
			out.print("1");
		}
		else {
			out.print("0");
		}
		return null;
	}

}
