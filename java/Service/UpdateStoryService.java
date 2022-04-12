package Service;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Inter.Command;
import Model.StoryDAO;
import Model.StoryDTO;

public class UpdateStoryService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[UpdateStoryServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		/* 파일 업로드 --------------------------------------------------------------------*/
		String savePath = request.getServletContext().getRealPath("./file"); 
		System.out.println("savePath : " + savePath);
		
		int maxsize = 10*1024*1024; // 10MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy filePolicy = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(request, savePath, maxsize, encoding, filePolicy);
		
		String story_file = multi.getFilesystemName("story_file");
		if(story_file != null) {
			story_file = URLEncoder.encode(multi.getFilesystemName("story_file"), "UTF-8");
		}
		/*--------------------------------------------------------------------------------*/
		
		int story_seq = Integer.parseInt(multi.getParameter("story_seq"));
		System.out.println("story_seq : " + story_seq);
		String story_title = multi.getParameter("story_title");
		String story_content = multi.getParameter("story_content");
		
		StoryDTO stdto = new StoryDTO(story_seq, story_title, story_content, story_file, "", "", 0, 0);
		int cnt = new StoryDAO().updateBoardOne(stdto);
		
		if(cnt > 0) {
			System.out.println("글 수정 성공!");
		} else { 
			System.out.println("글 수정 실패!");
		}
		
		return "storyMain.jsp";
	}

}
