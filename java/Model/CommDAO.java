package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommDAO {
	
	// 전역변수 선언
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	int cnt = 0;
	String sql = null;
	
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
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 CREATE TABLE t_comment
(
   cmt_seq         NUMBER(12, 0)     NOT NULL, 
   story_seq       NUMBER(12, 0)     NOT NULL, 
   cmt_content     VARCHAR2(4000)    NOT NULL, 
   cmt_joindate    DATE              DEFAULT SYSDATE NOT NULL, 
   user_id         VARCHAR2(30)      NOT NULL, 
    PRIMARY KEY (cmt_seq)
);
	 */
	
	
	// 댓글 작성 메소드 
	public int insertComm(CommDTO commdto) {
		dbConn();
		try {
			sql = "insert into t_comment values(t_comment_SEQ.NEXTVAL, ?, ?, sysdate, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, commdto.getStory_seq());
			psmt.setString(2, commdto.getCmt_content());
			psmt.setString(3, commdto.getUser_id());
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 댓글 조회 메소드
	public ArrayList<CommDTO> selectComm(int story_seq){
		dbConn();
		ArrayList<CommDTO> commlist = new ArrayList<CommDTO>(); 
				
		try {
			sql = "select * from t_comment where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			   int cmt_seq = rs.getInt(1);
			   story_seq = rs.getInt(2);
			   String cmt_content = rs.getString(3);
			   String cmt_joindate = rs.getString(4);
			   String user_id = rs.getString(5);

			  CommDTO commdto = new CommDTO(cmt_seq, story_seq, cmt_content, cmt_joindate, user_id);
			  commlist.add(commdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return commlist;
	}
	
	// 총 댓글 수 조회 메소드
	public int totalComm(int story_seq) {
		dbConn();
		try {
			sql = "select count(*) from t_comment where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_seq);
			rs = psmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 댓글 삭제 메소드
	public int deleteComm(int cmt_seq) {
		dbConn();
		try {
			sql = "delete from t_comment where cmt_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cmt_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}

}
