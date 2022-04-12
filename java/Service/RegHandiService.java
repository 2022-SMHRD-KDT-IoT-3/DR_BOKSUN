package Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Inter.Command;
import Model.handiDAO;
import Model.handiDTO;

public class RegHandiService implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[RegHandiServiceCon.do]");
		
		request.setCharacterEncoding("UTF-8");	
		
		String h_relationship = request.getParameter("hRelation");
		String h_name = request.getParameter("hName");
		String h_birthdate = request.getParameter("hBirth");
		String h_gender = request.getParameter("hGender");
		String h_phone = request.getParameter("hPhone");
		String h_roadAddress = request.getParameter("hRoadAdr");
		String h_detailAddress = request.getParameter("hDetailAdr");
		String h_Addr = h_roadAddress + " " + h_detailAddress;
		String user_id = request.getParameter("user_id");
		
		handiDTO hdto = new handiDTO(h_name, h_relationship, h_birthdate, h_gender, h_phone,h_Addr, user_id);
		
		int cnt = new handiDAO().regiHandi(hdto);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("200");
		
		System.out.println(h_relationship);
		System.out.println(h_name);
		System.out.println(h_birthdate);
		System.out.println(h_gender);
		System.out.println(h_phone);
		System.out.println(h_Addr);
		System.out.println(user_id);
		
		return "reg_handi.jsp";
	}
}
