package Model;

import java.sql.Date;

public class CommDTO {
	
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
	
	// ��� ���� 
    private int cmt_seq;

    // ���� ���� 
    private int story_seq;

    // ��� ���� 
    private String cmt_content;

    // ��� �ۼ����� 
    private String cmt_joindate;

    // ��� �ۼ��� 
    private String user_id;
    

	public CommDTO(int cmt_seq, int story_seq, String cmt_content, String cmt_joindate, String user_id) {
		super();
		this.cmt_seq = cmt_seq;
		this.story_seq = story_seq;
		this.cmt_content = cmt_content;
		this.cmt_joindate = cmt_joindate;
		this.user_id = user_id;
	}

	
	public int getCmt_seq() {
		return cmt_seq;
	}

	public void setCmt_seq(int cmt_seq) {
		this.cmt_seq = cmt_seq;
	}

	public int getStory_seq() {
		return story_seq;
	}

	public void setStory_seq(int story_seq) {
		this.story_seq = story_seq;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getCmt_joindate() {
		return cmt_joindate;
	}

	public void setCmt_joindate(String cmt_joindate) {
		this.cmt_joindate = cmt_joindate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
    
    


}
