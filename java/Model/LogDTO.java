package Model;

import java.sql.Date;

public class LogDTO {
	
	/*
	 CREATE TABLE t_log
(
    log_seq     NUMBER(12, 0)    NOT NULL, 
    log_type    CHAR(1)          NOT NULL, 
    log_time    DATE             DEFAULT SYSDATE NOT NULL, 
    user_id     VARCHAR2(30)     NOT NULL, 
     PRIMARY KEY (log_seq)
);
	 */
	
    // �α� ���� 
    private Double log_seq;

    // �α� ���� 
    private String log_type;

    // �α� �ð� 
    private Date log_time;

    // �α� ����� 
    private String user_id;
    
    
	public LogDTO(Double log_seq, String log_type, Date log_time, String user_id) {
		super();
		this.log_seq = log_seq;
		this.log_type = log_type;
		this.log_time = log_time;
		this.user_id = user_id;
	}

	
	public Double getLog_seq() {
		return log_seq;
	}

	public void setLog_seq(Double log_seq) {
		this.log_seq = log_seq;
	}

	public String getLog_type() {
		return log_type;
	}

	public void setLog_type(String log_type) {
		this.log_type = log_type;
	}

	public Date getLog_time() {
		return log_time;
	}

	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

   
    
	

}
