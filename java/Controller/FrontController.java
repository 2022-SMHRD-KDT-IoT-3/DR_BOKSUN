package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Service.DeleteCommService;
import Service.DeleteHandiService;
import Service.DeleteQnaReplyService;
import Service.DeleteQnaService;
import Service.DeleteStoryService;
import Service.EditPwService;
import Service.IdCheckService;
import Service.JoinService;
import Service.LoginService;
import Service.LogoutService;
import Service.QnaBoardService;
import Service.RegHandiService;
import Service.RegMediboxService;
import Service.SelectHandiService;
import Service.SelectMediService;
import Service.SelectQnaReplyService;
import Service.SelectQnaService;
import Service.StoryBoardService;
import Service.StoryLikeService;
import Service.UpdateInfoService;
import Service.UpdateQnaService;
import Service.UpdateStoryService;
import Service.WriteCommService;
import Service.WriteQnaReplyService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[FrontController]");
		
		Command com = null;
		String nextpage = null;
		
		String uri = request.getRequestURI();
//		System.out.println("uri : " + uri);
		String path = request.getContextPath();
//		System.out.println("path : " + path);
		String command = uri.substring(path.length() + 1);
		System.out.println("command : " + command);
		
		// 회원 가입 기능
		if(command.equals("JoinServiceCon.do")) {
			com = new JoinService();
			nextpage = com.execute(request, response);	
			
		// 아이디 중복 확인 기능
		} else if(command.equals("IdCheckServiceCon.do")) {
			com = new IdCheckService();
			nextpage = com.execute(request, response);
		
		// 로그인 기능
		} else if(command.equals("LoginServiceCon.do")) {
			com = new LoginService();
			nextpage = com.execute(request, response);
		
		// 로그아웃 기능
		} else if(command.equals("LogoutServiceCon.do")) {
			com = new LogoutService();
			nextpage = com.execute(request, response);
		
		// 비밀번호 변경 기능
		} else if(command.equals("EditPwServiceCon.do")) {
			com = new EditPwService();
			nextpage = com.execute(request, response);
		
		// 장애인 정보 등록 기능
		} else if(command.equals("RegHandiServiceCon.do")) {
			com = new RegHandiService();
			nextpage = com.execute(request, response);	
			
		// 장애인 정보 삭제 기능
		} else if(command.equals("DeleteHandiServiceCon.do")) {
			com = new DeleteHandiService();
			nextpage = com.execute(request, response);	
			
		// 약 등록 기능
		} else if(command.equals("RegMediboxServiceCon.do")) {
			com = new RegMediboxService();
			nextpage = com.execute(request, response);	
			
			// 장애인 전체 조회 기능
		}else if(command.equals("SelectMediServiceCon.do")) {
			com = new SelectMediService();
			nextpage = com.execute(request, response);	
							
		// 장애인 전체 조회 기능
		}else if(command.equals("SelectHandiServiceCon.do")) {
			com = new SelectHandiService();
			nextpage = com.execute(request, response);	
			
			
		// 정보 공유 글 작성 기능
		} else if(command.equals("StoryBoardServiceCon.do")) {
			com = new StoryBoardService();
			nextpage = com.execute(request, response);
		
		// 정보 공유 글 수정 기능
		} else if(command.equals("UpdateStoryServiceCon.do")) {	
			com = new UpdateStoryService();
			nextpage = com.execute(request, response);
		
		// 정보 공유 글 삭제 기능
		} else if(command.equals("DeleteStorySeriveCon.do")) {
			com = new DeleteStoryService();
			nextpage = com.execute(request, response);
			
		// 댓글 작성 기능
		} else if(command.equals("WriteCommServiceCon.do")) {
			com = new WriteCommService();
			nextpage = com.execute(request, response);
		
		// 댓글 삭제 기능
		} else if(command.equals("DeleteCommServiceCon.do")) {
			com = new DeleteCommService();
			nextpage = com.execute(request, response);
			
		// 좋아요 업데이트 기능
		} else if(command.equals("StoryLikeServiceCon.do")) {
			com = new StoryLikeService();
			nextpage = com.execute(request, response);
		
		// 문의하기 글 작성 기능
		} else if(command.equals("QnaBoardServiceCon.do")) {
			com = new QnaBoardService();
			nextpage = com.execute(request, response);
		
		// 문의하기 글 수정 기능
		} else if(command.equals("UpdateQnaServiceCon.do")) {
			com = new UpdateQnaService();
			nextpage = com.execute(request, response);
		
		// 문의하기 글 삭제 기능
		} else if(command.equals("DeleteQnaServiceCon.do")) {
			com = new DeleteQnaService();
			nextpage = com.execute(request, response);
		
		// 문의 답변 작성 기능
		} else if(command.equals("WriteQnaReplyServiceCon.do")) {
			com = new WriteQnaReplyService();
			nextpage = com.execute(request, response);
			
		// 문의 답변 삭제 기능
		} else if(command.equals("DeleteQnaReplyServiceCon.do")) {
			com = new DeleteQnaReplyService();
			nextpage = com.execute(request, response);
		
		// 내 문의글 조회 기능
		} else if(command.equals("SelectQnaServiceCon.do")) {
			com = new SelectQnaService();
			nextpage = com.execute(request, response);
			
		// 내 문의 답변 조회 기능
		} else if(command.equals("SelectQnaReplyServiceCon.do")) {
			com = new SelectQnaReplyService();
			nextpage = com.execute(request, response);
		
		// 내 정보 수정 기능
		} else if(command.equals("UpdateInfoServiceCon.do")) {
			com = new UpdateInfoService();
			nextpage = com.execute(request, response);
		}
		
		
		
		
		
		

		
		// nextpage로 이동
		if(nextpage != null) {
			response.sendRedirect(nextpage);
		}
	
	} // service 메소드 마지막라인
	

}
