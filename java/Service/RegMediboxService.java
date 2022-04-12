package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Inter.Command;
import Model.MediDAO;
import Model.MediDTO;
import Model.SelectHandiDAO;

public class RegMediboxService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[RegMediboxServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");	
		
		String func = request.getParameter("func");
		String json = request.getParameter("json");
		
		Gson gson = new Gson();		
		MediDTO[] list = gson.fromJson(json, MediDTO[].class);
		
		int totalcnt = 0;
		String msg = "";
		
		if(func.equals("regboxall")) {
			totalcnt = new MediDAO().insertMedi(list);
			
			if(totalcnt == 8)
				msg="2";
			else if(totalcnt < 8 && totalcnt > 0)
				msg = "1";
			else
				msg = "0";
		}
		else if(func.equals("delboxall")) {
			int h_seq = Integer.parseInt(request.getParameter("h_seq"));
			
			totalcnt = new MediDAO().deleteMediAll(h_seq);
			
			if(totalcnt > 0)
				msg = "1";
			else
				msg = "0";
		}
		else if(func.equals("regbox")) {
			totalcnt = new MediDAO().updateMedi(list);
			if(totalcnt > 0)
				msg = "1";
			else
				msg = "0";
		}
		
		else if(func.equals("delbox")) {
			totalcnt = new MediDAO().deleteMedi(list);
			if(totalcnt > 0)
				msg = "1";
			else
				msg = "0";
		}
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(msg);
		
		return null;
	}
}
