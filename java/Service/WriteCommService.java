package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.CommDAO;
import Model.CommDTO;

public class WriteCommService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextpage = null;
		
		System.out.println("[CommServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		String cmt_content = request.getParameter("cmt_content");
		String user_id = request.getParameter("user_id");
		
		CommDTO commdto = new CommDTO(0, story_seq, cmt_content, null, user_id);
		
		int cnt = new CommDAO().insertComm(commdto);
		
		if(cnt > 0) {
			System.out.println("댓글 등록 성공!");
		} else {
			System.out.println("댓글 등록 실패!");
		}

		nextpage = "storySelect.jsp?story_seq="+story_seq;
		return nextpage;
	}

}
