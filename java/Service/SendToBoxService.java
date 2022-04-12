package Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MediDAO;
import Model.MediDTO;

@WebServlet("/SendToBoxService")
public class SendToBoxService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			SimpleDateFormat format1 = new SimpleDateFormat("HH:mm:ss");
			Calendar timer = Calendar.getInstance();
			String ft = format1.format(timer.getTime());

			PrintWriter out = response.getWriter();
			
			String data = request.getParameter("data");
			int idx = Integer.parseInt(data);

			String seq = request.getParameter("seq");
			
			if(!data.isEmpty() && !seq.isEmpty()) {
				MediDAO dao = new MediDAO();
				ArrayList<MediDTO> medilist = dao.SelectMediData(seq);
				ArrayList<String> alramlist = dao.SelectAlram(seq);
				String result = "";
				String alram = "";
				String date = "";
				String time = "";

//			      2022-12-31

				if (idx == 0 || idx == 1 || idx == 2 || idx == 3 || idx == 4 || idx == 5 || idx == 6 || idx == 7 || idx == 8) {

					date = Integer.parseInt(medilist.get(idx).getMed_date().substring(0, 4)) + "년, "
							+ Integer.parseInt(medilist.get(idx).getMed_date().substring(5, 7)) + "월, "
							+ Integer.parseInt(medilist.get(idx).getMed_date().substring(8, 10)) + "일,";

					result += idx + 1 + "번, 보관함, 입니다." + medilist.get(idx).getMed_hosp() + "의,, "
							+ medilist.get(idx).getMed_name() + "약이며, 복용법은, " + medilist.get(idx).getMed_way() + "이고, 처방일은, "
							+ date + "입니다앙";

					out.print(result);
				}
				for (int i = 0; i < alramlist.size(); i++) {
					String ti = alramlist.get(i)+":10";
					String tih = ti.substring(0, 2);
					String tim = ti.substring(3, 5);
					String tis = ti.substring(6, 7);
					String fmth = ft.substring(0, 2);
					String fmtm = ft.substring(3, 5);
					String fmts = ft.substring(6, 7);
					if ((fmth.equals(tih) && fmtm.equals(tim) && fmts.equals(tis)) && idx == 1234) {
						time = Integer.parseInt(ti.substring(0, 2)) + "시," + Integer.parseInt(ti.substring(3, 5)) + "분,";
						alram = "현재 시간," + time + "이며, 약 복용시간 입니다." + (i + 1) + "번, 보관함 약을, 복용하세요오옹";
						out.print(alram);
						System.out.println(alram);
						System.out.println(ti);

					} else {
						out.print("");
						System.out.println(ft);
					}
				}

				System.out.println("requestServlet Value : Success");
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인페이지 이동 방지");
		}
		
	}

}
