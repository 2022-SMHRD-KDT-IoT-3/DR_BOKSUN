package Model;

public class QnaReplyDTO {

	/*
	 CREATE TABLE t_qna_reply
(
    rep_seq          NUMBER(12, 0)     NOT NULL, 
    qna_seq          NUMBER(12, 0)     NOT NULL, 
    rep__title       VARCHAR2(200)     NOT NULL, 
    rep__content     VARCHAR2(4000)    NOT NULL, 
    rep__joindate    DATE              DEFAULT SYSDATE NOT NULL, 
    user_id          VARCHAR2(30)      NOT NULL, 
     PRIMARY KEY (rep_seq)
);
	 */
	
	// 응답 순번 
    private int rep_seq;

    // 질의 순번 
    private int qna_seq;

    // 응답 제목 
    private String rep_title;

    // 응답 내용 
    private String rep_content;

    // 응답 작성일자 
    private String rep_joindate;

    // 응답 작성자 
    private String user_id;
    

	public QnaReplyDTO(int rep_seq, int qna_seq, String rep_title, String rep_content, String rep_joindate,
			String user_id) {
		super();
		this.rep_seq = rep_seq;
		this.qna_seq = qna_seq;
		this.rep_title = rep_title;
		this.rep_content = rep_content;
		this.rep_joindate = rep_joindate;
		this.user_id = user_id;
	}
	

	public int getRep_seq() {
		return rep_seq;
	}

	public void setRep_seq(int rep_seq) {
		this.rep_seq = rep_seq;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getRep_title() {
		return rep_title;
	}

	public void setRep_title(String rep_title) {
		this.rep_title = rep_title;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public String getRep_joindate() {
		return rep_joindate;
	}

	public void setRep_joindate(String rep_joindate) {
		this.rep_joindate = rep_joindate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
    
    

}
