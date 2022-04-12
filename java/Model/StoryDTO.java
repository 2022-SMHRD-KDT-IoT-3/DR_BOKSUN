package Model;

public class StoryDTO {
	
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
    story_like        NUMBER(12, 0)     NOT NULL, 
     PRIMARY KEY (story_seq)
	);
	*/
	
	private int story_seq;
	private String story_title;
	private String story_content;
	private String story_file;
	private String story_joindate;
	private String user_id;
	private int story_cnt;
	private int story_like;
	
	

	public StoryDTO(int story_seq, String story_title, String story_content, String story_file, String story_joindate,
			String user_id, int story_cnt, int story_like) {
		super();
		this.story_seq = story_seq;
		this.story_title = story_title;
		this.story_content = story_content;
		this.story_file = story_file;
		this.story_joindate = story_joindate;
		this.user_id = user_id;
		this.story_cnt = story_cnt;
		this.story_like = story_like;
	}

	
	public int getStory_seq() {
		return story_seq;
	}

	public void setStory_seq(int story_seq) {
		this.story_seq = story_seq;
	}

	public String getStory_joindate() {
		return story_joindate;
	}

	public void setStory_joindate(String story_joindate) {
		this.story_joindate = story_joindate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStory_title() {
		return story_title;
	}

	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}

	public String getStory_content() {
		return story_content;
	}

	public void setStory_content(String story_content) {
		this.story_content = story_content;
	}

	public String getStory_file() {
		return story_file;
	}

	public void setStory_file(String story_file) {
		this.story_file = story_file;
	}

	public int getStory_cnt() {
		return story_cnt;
	}

	public void setStory_cnt(int story_cnt) {
		this.story_cnt = story_cnt;
	}

	public int getStory_like() {
		return story_like;
	}

	public void setStory_like(int story_like) {
		this.story_like = story_like;
	}
	

}
