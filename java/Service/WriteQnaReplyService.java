package Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.QnaReplyDAO;
import Model.QnaReplyDTO;

public class WriteQnaReplyService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[WriteQnaReplyServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
		String rep_title = request.getParameter("rep_title");
		String rep_content = request.getParameter("rep_content");
		String user_id = request.getParameter("user_id");
		
		QnaReplyDTO qRedto = new QnaReplyDTO(0, qna_seq, rep_title, rep_content, "", user_id);
		
		int cnt = new QnaReplyDAO().writeQnaReply(qRedto);
		
		if(cnt > 0) {
			System.out.println("문의 답변 작성 성공!");
		} else { 
			System.out.println("문의 답변 작성 실패!");
		}
		
		return "qnaSelect.jsp?qna_seq="+qna_seq;
	}
	
	
}
