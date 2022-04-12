package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Inter.Command;
import Model.QnaDAO;
import Model.QnaDTO;

public class SelectQnaService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[SelectQnaServiceCon.do]");
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		System.out.println("user_id : " + user_id);
		
		ArrayList<QnaDTO> myqlist = new QnaDAO().selectMyQnaAll(user_id);
		
		Gson gson = new Gson();
		String json = gson.toJson(myqlist);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println(json);
		
		return null;
	}
}
