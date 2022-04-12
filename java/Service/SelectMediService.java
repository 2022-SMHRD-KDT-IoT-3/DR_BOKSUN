package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Inter.Command;
import Model.MediDAO;
import Model.MediDTO;

public class SelectMediService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[SelectMediServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");	
		String seq = request.getParameter("h_seq");
		
		ArrayList<MediDTO> list = new MediDAO().SelectMediData(seq);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println(json);
		
		return null;
	}
}
