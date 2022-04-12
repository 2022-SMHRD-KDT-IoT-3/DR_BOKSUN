package Model;

public class UserDTO {
	
	/*
	CREATE TABLE t_user
(
    user_id           VARCHAR2(30)    NOT NULL, 
    user_pw           VARCHAR2(30)    NOT NULL, 
    user_type         CHAR(1)         NOT NULL, 
    user_name         VARCHAR2(30)    NOT NULL, 
    user_birthdate    DATE            NOT NULL, 
    user_gender       CHAR(1)         NOT NULL, 
    user_phone        VARCHAR2(30)    NOT NULL, 
    user_region       VARCHAR2(30)    NOT NULL, 
    user_license      VARCHAR2(30)    NULL, 
    user_joindate     DATE            DEFAULT SYSDATE NOT NULL, 
    user_company      VARCHAR2(30)    NULL, 
    user_comtel       VARCHAR2(30)    NULL, 
     PRIMARY KEY (user_id)
);
	 */

	
	private String user_id;
	private String user_pw;
	private char user_type;
	private String user_name;
	private String user_birthdate;
	private char user_gender;
	private String user_phone;
	private String user_region;
	private String user_license; 
	private String user_joindate;
	private String user_company;
	private String user_comtel;
	
	
	// 복지사는 0
	public UserDTO(String user_id, String user_pw, char user_type, String user_name, String user_birthdate,
			char user_gender, String user_phone, String user_region, String user_license, String user_joindate,
			String user_company, String user_comtel) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_type = user_type;
		this.user_name = user_name;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_region = user_region;
		this.user_license = user_license;
		this.user_joindate = user_joindate;
		this.user_company = user_company;
		this.user_comtel = user_comtel;
	}
	
	
	// 보호자는 1
	public String getUser_id() {
		return user_id;
	}
	public UserDTO(String user_id, String user_pw, char user_type, String user_name, String user_birthdate,
			char user_gender, String user_phone, String user_region, String user_joindate) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_type = user_type;
		this.user_name = user_name;
		this.user_birthdate = user_birthdate;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_region = user_region;
		this.user_joindate = user_joindate;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public char getUser_type() {
		return user_type;
	}


	public void setUser_type(char user_type) {
		this.user_type = user_type;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_birthdate() {
		return user_birthdate;
	}


	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}


	public char getUser_gender() {
		return user_gender;
	}


	public void setUser_gender(char user_gender) {
		this.user_gender = user_gender;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}


	public String getUser_region() {
		return user_region;
	}


	public void setUser_region(String user_region) {
		this.user_region = user_region;
	}


	public String getUser_license() {
		return user_license;
	}


	public void setUser_license(String user_license) {
		this.user_license = user_license;
	}


	public String getUser_joindate() {
		return user_joindate;
	}


	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}


	public String getUser_company() {
		return user_company;
	}


	public void setUser_company(String user_company) {
		this.user_company = user_company;
	}


	public String getUser_comtel() {
		return user_comtel;
	}


	public void setUser_comtel(String user_comtel) {
		this.user_comtel = user_comtel;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	

}
