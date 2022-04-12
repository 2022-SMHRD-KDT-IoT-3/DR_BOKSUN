package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.QnaReplyDAO;

public class DeleteQnaReplyService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[DeleteQnaReplyServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int rep_seq = Integer.parseInt(request.getParameter("rep_seq"));
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		
		int cnt = new QnaReplyDAO().deleteQnaReply(rep_seq);
		
		if(cnt > 0) {
			System.out.println("문의 답변 삭제 성공!");
		} else { 
			System.out.println("문의 답변 삭제 실패!");
		}
		
		return "qnaSelect.jsp?qna_seq="+qna_seq;
	}
}
