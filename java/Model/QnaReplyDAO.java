package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QnaReplyDAO {
	
	// �������� ����
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;
	
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
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// ���� �亯 �ۼ� �޼ҵ�
	public int writeQnaReply(QnaReplyDTO qRedto) {
		dbConn();
		try { 
			sql = "insert into t_qna_reply values(t_qna_reply_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qRedto.getQna_seq());
			psmt.setString(2, qRedto.getRep_title());
			psmt.setString(3, qRedto.getRep_content());
			psmt.setString(4, qRedto.getUser_id());
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			dbClose();
		}
		return cnt;
	}
	
	// ���� �亯 ��ȸ �޼ҵ�
	public ArrayList<QnaReplyDTO> selectQnaReply(int qna_seq){
		dbConn();
		ArrayList<QnaReplyDTO> qRelist = new ArrayList<QnaReplyDTO>();
		
		try {
			sql = "select * from t_qna_reply where qna_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qna_seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int rep_seq = rs.getInt(1);
				qna_seq = rs.getInt(2);
				String rep_title = rs.getString(3);
				String rep_content = rs.getString(4);
				String rep_joindate = rs.getString(5);
				String user_id = rs.getString(6);
				
				QnaReplyDTO qRedto = new QnaReplyDTO(rep_seq, qna_seq, rep_title, rep_content, rep_joindate, user_id);
				qRelist.add(qRedto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return qRelist;
	}
	
	// ���� �亯 ���� �޼ҵ�
	public int deleteQnaReply(int rep_seq) {
		dbConn();
		try { 
			sql = "delete from t_qna_reply where rep_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rep_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			dbClose();
		}
		return cnt;
	}

}
