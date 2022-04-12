package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QnaDAO {

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
	
	
	// QnA 작성 메소드
	public int insertQna(QnaDTO qdto) {
		dbConn();
		
		try {
			sql = "insert into t_qna values(t_qna_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qdto.getQna_title());
			psmt.setString(2, qdto.getQna_content());
			psmt.setString(3, qdto.getQna_file());
			psmt.setString(4, qdto.getQna_id());
			psmt.setInt(5, qdto.getQna_cnt());
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	} 
	
	
	// QnA 목록 조회 메소드
	public ArrayList<QnaDTO> selectQnaAll(){
		dbConn();
		ArrayList<QnaDTO> qlist = new ArrayList<QnaDTO>();
		
		try {
			sql = "select * from t_qna order by qna_joindate desc";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int qna_seq = rs.getInt(1);
				String qna_title = rs.getString(2);
				String qna_content = rs.getString(3);
				String qna_file = rs.getString(4);
				String qna_joindate = rs.getString(5);
				String qna_id = rs.getString(6);
				int qna_cnt = rs.getInt(7);
				
				QnaDTO qdto = new QnaDTO(qna_seq, qna_title, qna_content, qna_file, qna_joindate, qna_id, qna_cnt);
				qlist.add(qdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return qlist;
	}

	
	// 내 QnA 목록 조회 메소드
	public ArrayList<QnaDTO> selectMyQnaAll(String qna_id){
		dbConn();
		ArrayList<QnaDTO> myqlist = new ArrayList<QnaDTO>();
		try {
			sql = "select qna_seq, qna_title, qna_joindate "
					+ "from t_qna "
					+ "where qna_id = ? "
					+ "order by qna_joindate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qna_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int qna_seq = rs.getInt(1);
				String qna_title = rs.getString(2);
				String qna_joindate = rs.getString(3);

				QnaDTO qdto = new QnaDTO(qna_seq, qna_title, "", "", qna_joindate, qna_id, 0);
				myqlist.add(qdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return myqlist;
	}
	
	
	// 내 QnA 답변 목록 조회 메소드
	// 아우터 조인(+) : 사용자가 작성한 문의글 모두 조회, 답변 유무 구분을 위해
	public ArrayList<QnaDTO> selectMyQnaReplyAll(String qna_id){
		dbConn();
		ArrayList<QnaDTO> myqRelist = new ArrayList<QnaDTO>();
		try {
			sql = "select a.qna_seq, a.qna_title, a.qna_joindate, b.rep_seq "
					+ "from t_qna a, t_qna_reply b "
					+ "where a.qna_id = ? "
					+ "        and a.qna_seq = b.qna_seq(+) "
					+ "order by a.qna_joindate desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qna_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int qna_seq = rs.getInt(1);
				String qna_title = rs.getString(2);
				String qna_joindate = rs.getString(3);
				int rep_seq = rs.getInt(4);
				
				QnaDTO qdto = new QnaDTO(qna_seq, qna_title, "", "", qna_joindate, qna_id, 0, rep_seq);
				myqRelist.add(qdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return myqRelist;
	}

	
	
	// QnA 상세페이지 조회 메소드
	public QnaDTO selectQnaOne(int qna_seq) {
		dbConn();
		QnaDTO qdto = null;
		try {
			sql = "select * from t_qna where qna_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qna_seq);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				qna_seq = rs.getInt(1);
				String qna_title = rs.getString(2);
				String qna_content = rs.getString(3);
				String qna_file = rs.getString(4);
				String qna_joindate = rs.getString(5);
				String qna_id = rs.getString(6);
				int qna_cnt = rs.getInt(7);
				qna_cnt++;
				updateCount(qna_seq, qna_cnt);
				
				qdto = new QnaDTO(qna_seq, qna_title, qna_content, qna_file, qna_joindate, qna_id, qna_cnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return qdto;
	}
	
	
	// QnA 조회수 업데이트 메소드
	public void updateCount(int qna_seq, int qna_cnt) {
		dbConn();
		try {
			sql = "update t_qna set qna_cnt = ? where qna_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qna_cnt);
			psmt.setInt(2, qna_seq);
			
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} 
	}
	
	
	// QnA 수정 메소드
	public int updateQnaOne(QnaDTO qdto) {
		dbConn();
		try {
			sql = "update t_qna set qna_title = ?, qna_content = ?, qna_file = ? where qna_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qdto.getQna_title());
			psmt.setString(2, qdto.getQna_content());
			psmt.setString(3, qdto.getQna_file());
			psmt.setInt(4, qdto.getQna_seq());
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
	
	// QnA 삭제 메소드
	public int deleteQnaOne(int qna_seq) {
		dbConn();
		try {
			sql = "delete from t_qna where qna_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qna_seq);
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		} return cnt;
	}
	
}
