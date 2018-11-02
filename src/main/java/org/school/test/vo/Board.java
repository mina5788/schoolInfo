package org.school.test.vo;
public class Board {
	private int boardnum;
	private String userid;
	private String title;
	private String content;
	private int hitcount;
	private String regdate;
	private String originalfile;
	private String savefile;
	private String schoolnum;
	
	public Board(int boardnum, String userid, String title, String content, int hitcount, String regdate,
			String originalfile, String savefile, String schoolnum) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.hitcount = hitcount;
		this.regdate = regdate;
		this.originalfile = originalfile;
		this.savefile = savefile;
		this.schoolnum = schoolnum;
	}

	public Board() {
		super();
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavefile() {
		return savefile;
	}

	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}

	public String getSchoolnum() {
		return schoolnum;
	}

	public void setSchoolnum(String schoolnum) {
		this.schoolnum = schoolnum;
	}

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", hitcount=" + hitcount + ", regdate=" + regdate + ", originalfile=" + originalfile + ", savefile="
				+ savefile + ", schoolnum=" + schoolnum + "]";
	}
	

	
}
	