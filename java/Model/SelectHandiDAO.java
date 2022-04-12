package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class SelectHandiDAO {
	// �������� ����
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	ArrayList<SelectHandiDTO> list = null;
	
	// DB ���� �޼ҵ�
		public void dbConn() {
			try {
				// 1. DB����(ojdbc6.jar �־��ֱ�)
				// 1-1. Classã�� : DB�� ��Ŭ������ �������ִ� Class
				Class.forName("oracle.jdbc.driver.OracleDriver");

				// 1-2. DB�� �����ϱ� ���� �ּ�, ���̵�, �н����� ����
				String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
				String db_id = "campus_b_0310_1";
				String db_pw = "smhrd1";

				// 1-3. Connection ��ü ����ؼ� DB����!
				conn = DriverManager.getConnection(url, db_id, db_pw);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// DB close �޼ҵ�
		public void dbClose() {
			try {
				if (rs != null)
					rs.close();
				if (psmt != null)
					psmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public ArrayList<SelectHandiDTO> SelectHandiData(String select_id) {
			list = new ArrayList<SelectHandiDTO>();
			dbConn();
			try {
				String sql = "select h_seq, h_name, h_relationship, h_birthdate,"
						+           "h_addr, h_gender, h_phone,"
						+           "(select user_name "
						+              "from t_user "
						+             "where user_id = ?) as user_name "
						+      "from t_handicaped "
						+     "where user_id =?"
						+     "order by h_seq";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, select_id);
				psmt.setString(2, select_id);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int h_seq = rs.getInt(1);
					String h_name = rs.getString(2);
					String h_relationship = rs.getString(3);
					String h_birthdate = rs.getString(4);
					String h_addr = rs.getString(5);
					String h_gender = rs.getString(6);
					String h_phone = rs.getString(7);
					String user_name = rs.getString(8);
					
					SelectHandiDTO dto = new SelectHandiDTO(h_seq, h_name, h_relationship, h_birthdate, h_addr,
							h_gender, h_phone, user_name);
					list.add(dto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			} 
			return list;
		}
}
