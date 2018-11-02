package org.school.test.vo;

public class WishList {
	private String schoolnum;
	private String userid;
	
	public WishList(String schoolnum, String userid) {
		super();
		this.schoolnum = schoolnum;
		this.userid = userid;
	}

	public WishList() {
		super();
	}

	public String getSchoolnum() {
		return schoolnum;
	}

	public void setSchoolnum(String schoolnum) {
		this.schoolnum = schoolnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "WishList [schoolnum=" + schoolnum + ", userid=" + userid + "]";
	}
	
	
}
