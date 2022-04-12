package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MediDAO {
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	ArrayList<MediDTO> list = null;
	// DB 연결 메소드
	public void dbConn() {
		try {
			// 1. DB연결(ojdbc6.jar 넣어주기)
			// 1-1. Class찾기 : DB와 이클립스를 연결해주는 Class
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1-2. DB에 접속하기 위한 주소, 아이디, 패스워드 지정
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "campus_b_0310_1";
			String db_pw = "smhrd1";

			// 1-3. Connection 객체 사용해서 DB연결!
			conn = DriverManager.getConnection(url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose() {
		try {
			if(rs != null)
				rs.close();
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertMedi(MediDTO[] list) {
		int totalcnt=0;
		for(MediDTO x : list) {
			try {
				dbConn();
				sql = "INSERT INTO t_medicine\r\n"
						+ "         (h_seq , med_num, med_name, med_hosp, med_way, med_date, med_alarm, med_update, user_id)\r\n"
						+ "         SELECT ?, ?, ?, ?, ?, ?, ?, SYSDATE, ? FROM DUAL A\r\n"
						+ "         WHERE NOT EXISTS (\r\n"
						+ "                        SELECT med_num\r\n"
						+ "                        FROM t_medicine\r\n"
						+ "                        WHERE h_seq = ?\r\n"
						+ "                          and med_num = ?\r\n"
						+ "                        )";

				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, x.getH_seq());
				psmt.setString(2, x.getMed_num());
				psmt.setString(3, x.getMed_name());
				psmt.setString(4, x.getMed_hosp());
				psmt.setString(5, x.getMed_way());
				psmt.setString(6, x.getMed_date());
				psmt.setString(7, x.getMed_alarm());
				psmt.setString(8, x.getUser_id());
				psmt.setInt(9, x.getH_seq());
				psmt.setString(10, x.getMed_num());
				
				cnt = psmt.executeUpdate();
					
				totalcnt+=cnt;
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}
		return totalcnt;
	}
	
	public int deleteMediAll(int h_seq) {
		int totalcnt=0;
		try {
			dbConn();
			sql = "delete from t_medicine where h_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, h_seq);
				
			cnt = psmt.executeUpdate();
					
			totalcnt+=cnt;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return totalcnt;
	}
	
	public ArrayList<MediDTO> SelectMediData(String seq) {
		list = new ArrayList<MediDTO>();
		dbConn();
		try {
			String sql = "select h_seq, med_num, med_name, med_hosp, med_way, "
					+ "to_char(med_date, 'yyyy-mm-dd') as med_date, med_alarm, to_char(med_update, 'yyyy-mm-dd hh:mm:ss') as med_update, user_id "
					+ "from t_medicine "
					+ "where h_seq = ? "
					+ "order by med_num";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int h_seq = rs.getInt(1);
				String med_num = rs.getString(2);
				String med_name = rs.getString(3);
				String med_hosp = rs.getString(4);
				String med_way = rs.getString(5);
				String med_date = rs.getString(6);
				String med_alarm = rs.getString(7);
				String user_id = rs.getString(8);
				
				MediDTO mdto = new MediDTO(h_seq, med_num, med_name, med_hosp, med_way, med_date, med_alarm, user_id);
				
				list.add(mdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} 
		return list;
	}
	
	public int updateMedi(MediDTO[] list) {
		int totalcnt=0;
		for(MediDTO x : list) {
			try {
				dbConn();
				sql = "update t_medicine "
					+    "set med_name=?, med_hosp=?, med_way=?, "
					+    "med_date=?, med_alarm=?, med_update=sysdate, user_id=? "
					+ "where h_seq = ? "
					+ "  and med_num = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, x.getMed_name());
				psmt.setString(2, x.getMed_hosp());
				psmt.setString(3, x.getMed_way());
				psmt.setString(4, x.getMed_date());
				psmt.setString(5, x.getMed_alarm());
				psmt.setString(6, x.getUser_id());
				psmt.setInt(7, x.getH_seq());
				psmt.setString(8, x.getMed_num());
				
				cnt = psmt.executeUpdate();
					
				totalcnt+=cnt;
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}
		return totalcnt;
	}
	
	public int deleteMedi(MediDTO[] list) {
		int totalcnt=0;
		for(MediDTO x : list) {
			try {
				dbConn();
				sql = "update t_medicine "
						+    "set med_name='', med_hosp='', med_way='', "
						+    "med_date='', med_alarm='', med_update=sysdate, user_id=? "
						+ "where h_seq = ? "
						+ "  and med_num = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, x.getUser_id());
				psmt.setInt(2, x.getH_seq());
				psmt.setString(3, x.getMed_num());
				
				cnt = psmt.executeUpdate();
					
				totalcnt+=cnt;
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				dbClose();
			}
		}
		return totalcnt;
	}
	
	   public ArrayList<String> SelectAlram(String seq){
		      ArrayList<String> list = new ArrayList<>();
		      dbConn();
		      try {
		         String sql = "SELECT TO_CHAR(med_alarm, 'HH24:MI:SS') FROM t_medicine where h_seq = ? order by med_num";

		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, seq);
		         rs = psmt.executeQuery();

		         while (rs.next()) {
		            String med_alarm = rs.getString(1);
		            list.add(med_alarm);
		         }

		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         dbClose();
		      }
		      return list;
		   }
}
