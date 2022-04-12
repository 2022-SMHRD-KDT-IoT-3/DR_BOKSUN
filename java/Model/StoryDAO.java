package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StoryDAO {
	
	// 전역변수 선언
	PreparedStatement psmt = null;
	Connection conn = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;
	
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
	CREATE TABLE t_story
	(
	    story_seq         NUMBER(12, 0)     NOT NULL, 
	    story_title       VARCHAR2(200)     NOT NULL, 
	    story_content     VARCHAR2(4000)    NOT NULL, 
	    story_file        VARCHAR2(200)     NOT NULL, 
	    story_joindate    DATE              DEFAULT SYSDATE NOT NULL, 
	    user_id           VARCHAR2(30)      NOT NULL, 
	    story_cnt         NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
	    story_like        NUMBER(12, 0)     DEFAULT 0 NOT NULL,
	     PRIMARY KEY (story_seq)
	)
	*/
	
	// 게시글 작성 메소드
	public int insertBoard(StoryDTO stdto) { 
		dbConn();
		
		try {
			sql = "insert into t_story values(t_story_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, stdto.getStory_title());
			psmt.setString(2, stdto.getStory_content());
			psmt.setString(3, stdto.getStory_file());
			psmt.setString(4, stdto.getUser_id());
			psmt.setInt(5, stdto.getStory_cnt());
			psmt.setInt(6, stdto.getStory_like());
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	
	// 게시글 목록 조회 메소드
	public ArrayList<StoryDTO> selectBoardAll(){
		dbConn();
		
		ArrayList<StoryDTO> stlist = new ArrayList<>();
		try {
			sql = "select * from t_story order by story_joindate desc";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while(rs.next()) {
				int story_seq = rs.getInt(1);
				String story_title = rs.getString(2);
				String story_content = rs.getString(3);
				String story_joindate = rs.getString(5);
				String user_id = rs.getString(6);
				int story_cnt = rs.getInt(7);
				int story_like = rs.getInt(8);
				
				StoryDTO stdto = new StoryDTO(story_seq, story_title, story_content, "", story_joindate, user_id, story_cnt, story_like);
				stlist.add(stdto);
			};
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return stlist;
	}
	

	// 게시글 상세페이지 조회 메소드
	public StoryDTO selectBoardOne(int story_seq) {
		dbConn();
		StoryDTO stdto = null;
		
		try {
			sql = "select * from t_story where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				story_seq = rs.getInt(1);
				String story_title = rs.getString(2);
				String story_content = rs.getString(3);
				String story_file = rs.getString(4);
				String story_joindate = rs.getString(5);
				String user_id = rs.getString(6);
				int story_cnt = rs.getInt(7);
				int story_like = rs.getInt(8);
				story_cnt++;
				updateCount(story_cnt, story_seq);
				
				stdto = new StoryDTO(story_seq, story_title, story_content, story_file, story_joindate, user_id, story_cnt, story_like);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return stdto;
	}
	
	
	// 게시글 조회수 업데이트 메소드
	public int updateCount(int story_cnt, int story_seq) {
		dbConn();
		try {
			sql = "update t_story set story_cnt = ? where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_cnt);
			psmt.setInt(2, story_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}

	// 게시글 수정 메소드
	public int updateBoardOne(StoryDTO stdto) {
		dbConn();
		try {
			sql = "update t_story set story_title = ?, story_content = ?, story_file = ? where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, stdto.getStory_title());
			psmt.setString(2, stdto.getStory_content());
			psmt.setString(3, stdto.getStory_file());
			psmt.setInt(4, stdto.getStory_seq());
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 게시글 삭제 메소드
	public int deleteBoardOne(int story_seq) {
		dbConn();
		try {
			sql = "delete from t_story where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 게시글 좋아요 업데이트 메소드
	public int updateLike(int story_seq, int story_like) {
		dbConn();
		try {
			sql = "update t_story set story_like = ? where story_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, story_like);
			psmt.setInt(2, story_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	// 총 좋아요 수 조회 메소드
	public int totalLike(int story_seq) {
		dbConn();
		try {
			sql = "select count(*) from t_story where story_seq = ?";
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
	
	
	// 내가 쓴 게시글 목록 조회 메소드
		public ArrayList<StoryDTO> myBoardAll(String user_id){
			dbConn();
			
			ArrayList<StoryDTO> stlist = new ArrayList<>();
			try {
				sql = "select * from t_story where user_id = ? order by story_joindate desc";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, user_id);
				rs = psmt.executeQuery();

				while(rs.next()) {
					int story_seq = rs.getInt(1);
					String story_title = rs.getString(2);
					String story_content = rs.getString(3);
					String story_joindate = rs.getString(5);
					user_id = rs.getString(6);
					int story_cnt = rs.getInt(7);
					int story_like = rs.getInt(8);
					
					StoryDTO stdto = new StoryDTO(story_seq, story_title, story_content, "", story_joindate, user_id, story_cnt, story_like);
					stlist.add(stdto);
				};
						
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose();
			} return stlist;
		}
}
