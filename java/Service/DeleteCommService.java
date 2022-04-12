package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.CommDAO;
import Model.CommDTO;

public class DeleteCommService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextpage = null;
		
		System.out.println("[DeleteCommServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		
		int cnt = new CommDAO().deleteComm(cmt_seq);
		
		if(cnt > 0) {
			System.out.println("댓글 삭제 성공!");
		} else {
			System.out.println("댓글 삭제 실패!");
		}

		nextpage = "storySelect.jsp?story_seq="+story_seq;
		return nextpage;
	}

}
