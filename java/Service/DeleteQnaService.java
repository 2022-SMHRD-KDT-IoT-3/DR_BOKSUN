package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.QnaDAO;

public class DeleteQnaService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[DeleteQnaServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		
		int cnt = new QnaDAO().deleteQnaOne(qna_seq);
		
		if(cnt > 0) {
			System.out.println("문의글 삭제 성공!");
		} else {
			System.out.println("문의글 삭제 실패!");
			
		}
		
		return "qnaMain.jsp";
	}

}
