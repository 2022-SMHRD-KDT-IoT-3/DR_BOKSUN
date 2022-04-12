package Model;

public class QnaDTO {
	
	/*
	 CREATE TABLE t_qna
(
    qna_seq         NUMBER(12, 0)     NOT NULL, 
    qna_title       VARCHAR2(200)     NOT NULL, 
    qna_content     VARCHAR2(4000)    NOT NULL, 
    qna_file        VARCHAR2(200)     NOT NULL, 
    qna_joindate    DATE              DEFAULT SYSDATE NOT NULL, 
    qna_id          VARCHAR2(30)      NOT NULL, 
    qna_cnt         NUMBER(12, 0)     DEFAULT 0 NOT NULL, 
     PRIMARY KEY (qna_seq)
);
	 */

	 // 질의 순번 
    private int qna_seq;

    // 질의 제목 
    private String qna_title;

    // 질의 내용 
    private String qna_content;

    // 질의 첨부파일 
    private String qna_file;

    // 질의 작성일자 
    private String qna_joindate;

    // 질의 작성자 
    private String qna_id;

    // 질의 조회수 
    private int qna_cnt;

    // 질의 답변 시퀀스
    private int rep_seq;
    
    
	public QnaDTO(int qna_seq, String qna_title, String qna_content, String qna_file, String qna_joindate,
			String qna_id, int qna_cnt) {
		super();
		this.qna_seq = qna_seq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_joindate = qna_joindate;
		this.qna_id = qna_id;
		this.qna_cnt = qna_cnt;
	}
	
	// 질의 답변 추가 생성자
	public QnaDTO(int qna_seq, String qna_title, String qna_content, String qna_file, String qna_joindate,
			String qna_id, int qna_cnt, int rep_seq) {
		super();
		this.qna_seq = qna_seq;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_file = qna_file;
		this.qna_joindate = qna_joindate;
		this.qna_id = qna_id;
		this.qna_cnt = qna_cnt;
		this.rep_seq = rep_seq;
	}


	
	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_file() {
		return qna_file;
	}

	public void setQna_file(String qna_file) {
		this.qna_file = qna_file;
	}

	public String getQna_joindate() {
		return qna_joindate;
	}

	public void setQna_joindate(String qna_joindate) {
		this.qna_joindate = qna_joindate;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public int getQna_cnt() {
		return qna_cnt;
	}

	public void setQna_cnt(int qna_cnt) {
		this.qna_cnt = qna_cnt;
	}
    
    


}
