package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Inter.Command;
import Model.SelectHandiDAO;
import Model.SelectHandiDTO;

public class SelectHandiService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[RegHandiServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");	
		String user_id = request.getParameter("user_id");
		
		ArrayList<SelectHandiDTO> list = new SelectHandiDAO().SelectHandiData(user_id);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println(json);
		
		return null;
	}
}
