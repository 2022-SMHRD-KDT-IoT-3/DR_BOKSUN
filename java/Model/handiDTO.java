package Model;

import java.sql.Date;

public class handiDTO {

	/*
	 * CREATE TABLE t_handicaped ( h_seq NUMBER(12, 0) NOT NULL, h_name VARCHAR2(30)
	 * NOT NULL, h_relationship VARCHAR2(30) NOT NULL, h_birthdate DATE NOT NULL,
	 * h_addr VARCHAR2(200) NOT NULL, h_gender CHAR(1) NOT NULL, h_phone
	 * VARCHAR2(30) NOT NULL, user_id VARCHAR2(30) NOT NULL, PRIMARY KEY (h_seq) );
	 */

	private int h_seq;
	private String h_name;
	private String h_relationship;
	private String h_birthdate;
	private String h_addr;
	private String h_gender;
	private String h_phone;
	private String user_id;

	public handiDTO(int h_seq, String h_name, String h_relationship, String h_birthdate, String h_addr,
			String h_gender, String h_phone, String user_id) {
		this.h_seq = h_seq;
		this.h_name = h_name;
		this.h_relationship = h_relationship;
		this.h_birthdate = h_birthdate;
		this.h_addr = h_addr;
		this.h_gender = h_gender;
		this.h_phone = h_phone;
		this.user_id = user_id;
	}

	public handiDTO(String h_name, String h_relationship, String h_birthdate, String h_gender, String h_phone,
			String h_addr, String user_id) {
		this.h_name = h_name;
		this.h_relationship = h_relationship;
		this.h_birthdate = h_birthdate;
		this.h_addr = h_addr;
		this.h_gender = h_gender;
		this.h_phone = h_phone;
		this.user_id = user_id;
	}

	public int getH_seq() {
		return h_seq;
	}

	public void setH_seq(int h_seq) {
		this.h_seq = h_seq;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_relationship() {
		return h_relationship;
	}

	public void setH_relationship(String h_relationship) {
		this.h_relationship = h_relationship;
	}

	public String getH_birthdate() {
		return h_birthdate;
	}

	public void setH_birthdate(String h_birthdate) {
		this.h_birthdate = h_birthdate;
	}

	public String getH_addr() {
		return h_addr;
	}

	public void setH_addr(String h_addr) {
		this.h_addr = h_addr;
	}

	public String getH_gender() {
		return h_gender;
	}

	public void setH_gender(String h_gender) {
		this.h_gender = h_gender;
	}

	public String getH_phone() {
		return h_phone;
	}

	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
