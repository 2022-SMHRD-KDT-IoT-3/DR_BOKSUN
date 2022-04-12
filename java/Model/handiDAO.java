package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class handiDAO {
	// �������� ����
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	handiDTO hdto = null;

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
				System.out.println("����");
			}
			else {
				System.out.println("����");
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
