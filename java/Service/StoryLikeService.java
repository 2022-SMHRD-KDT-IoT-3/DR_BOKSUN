package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.StoryDAO;
import Model.StoryDTO;

public class StoryLikeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[StoryLikeServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
		int story_like = Integer.parseInt(request.getParameter("story_like"));
		
		if(story_like < 0) {
			story_like = 0;
		}
		
		//StoryDTO stdto = new StoryDTO(story_seq, "", "", "", "", "", 0, story_like);
		int cnt = new StoryDAO().updateLike(story_seq, story_like);
		
		if(cnt > 0) {
			System.out.println("좋아요 업데이트 성공!");
		} else {
			System.out.println("좋아요 업데이트 실패!");
		}
		
		PrintWriter out = response.getWriter();
		out.print(cnt);
		out.close();
		
		return null;
	}

}
