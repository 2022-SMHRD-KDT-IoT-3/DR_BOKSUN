package Service;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Inter.Command;
import Model.QnaDAO;
import Model.QnaDTO;

public class UpdateQnaService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[UpdateQnaServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		/* 파일 업로드 --------------------------------------------------------------------*/
		String savePath = request.getServletContext().getRealPath("./fileQna"); 
		System.out.println("savePath : " + savePath);
		
		int maxsize = 10*1024*1024; // 10MB
		String encoding = "UTF-8";
		DefaultFileRenamePolicy filePolicy = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(request, savePath, maxsize, encoding, filePolicy);
		
		String qna_file = multi.getFilesystemName("qna_file");
		if(qna_file != null) {
			qna_file = URLEncoder.encode(multi.getFilesystemName("qna_file"), "UTF-8");
		}
		/*--------------------------------------------------------------------------------*/
		
		String qna_title = multi.getParameter("qna_title");
		String qna_content = multi.getParameter("qna_content");
		System.out.println("qna_title : " + qna_title);
		System.out.println("qna_content : " + qna_content);
		
		int qna_seq = Integer.parseInt(multi.getParameter("qna_seq"));
		System.out.println("qna_seq : " + qna_seq);
		
		QnaDTO qdto = new QnaDTO(qna_seq, qna_title, qna_content, qna_file, "", "", 0);
		int cnt = new QnaDAO().updateQnaOne(qdto);
		
		if(cnt > 0) {
			System.out.println("문의글 수정 성공!");
		} else { 
			System.out.println("문의글 수정 실패!");
		}
		
		return "qnaMain.jsp";
	}

}
