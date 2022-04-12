package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.StoryDAO;
import Model.StoryDTO;

public class DeleteStoryService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[DeleteStoryServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int story_seq = Integer.parseInt(request.getParameter("story_seq"));
	
		int cnt = new StoryDAO().deleteBoardOne(story_seq);
		
		if(cnt > 0) {
			System.out.println("글 삭제 성공!");
		} else { 
			System.out.println("글 삭제 실패!");
		}
		
		return "storyMain.jsp";
	}

}