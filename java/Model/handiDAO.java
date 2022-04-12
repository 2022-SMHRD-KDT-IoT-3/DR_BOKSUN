package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class handiDAO {
	// 전역변수 선언
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	handiDTO hdto = null;

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

	// DB close 메소드
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
	
	public int regiHandi(handiDTO hdto) {
		dbConn();
		
		try {
			sql = "insert into t_handicaped values(T_HANDICAPED_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, hdto.getH_name());
			psmt.setString(2, hdto.getH_relationship());
			psmt.setString(3, hdto.getH_birthdate());
			psmt.setString(4, hdto.getH_addr());
			psmt.setString(5, hdto.getH_gender());
			psmt.setString(6, hdto.getH_phone());
			psmt.setString(7, hdto.getUser_id());
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				System.out.println("성공");
			}
			else {
				System.out.println("실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	public int deleteHandi(int seq) {
		dbConn();
		
		try {
			sql = "delete from t_handicaped where h_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
}
