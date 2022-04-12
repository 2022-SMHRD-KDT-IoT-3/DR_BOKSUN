package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Inter.Command;
import Model.StoryDAO;
import Model.StoryDTO;


public class StoryBoardService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			System.out.println("[StoryBoardServiceCon.do]");
			request.setCharacterEncoding("utf-8");
			
			/* ���� ���ε� --------------------------------------------------------------------*/
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
			
			// ������ ��������
			String story_title = multi.getParameter("story_title");
			String story_content= multi.getParameter("story_content");
			String user_id = multi.getParameter("user_id");
			int story_cnt = Integer.parseInt(multi.getParameter("story_cnt"));
			int story_like = Integer.parseInt(multi.getParameter("story_like"));
			
			// ���
			System.out.println("story_title : " + story_title);
			System.out.println("story_content : " + story_content);
			System.out.println("user_id : " + user_id);
			System.out.println("story_cnt : " + story_cnt);
			System.out.println("story_like : " + story_like);
			System.out.println("story_file : " + story_file);
			
			StoryDTO stdto = new StoryDTO(0, story_title, story_content, story_file, story_file, user_id, story_cnt, story_like);
			
			
			// ���̵� ���� ������ 
			int cnt = new StoryDAO().insertBoard(stdto);
			
			if(cnt > 0) {
				System.out.println("������ �ۼ� ����!");
				
			} else {
				System.out.println("������ �ۼ� ����!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "storyMain.jsp";
	}

}
