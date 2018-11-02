package org.school.test.vo;

public class goodHit {
	String userid;
	int boardnum;
	
	public goodHit(String userid, int boardnum) {
		super();
		this.userid = userid;
		this.boardnum = boardnum;
	}


	public goodHit() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	@Override
	public String toString() {
		return "goodHit [userid=" + userid + ", boardnum=" + boardnum + "]";
	}
	
	
}
