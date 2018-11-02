package org.school.test.vo;

public class User {
	private String userid;
	private String userpwd;
	private String userpwd2;
	private String email;
	private String email2;
	private String name;
	private String namekana;
	private int birthYear;
	private int birthMonth;
	private int birthDate;
	private String birthday;
	private String gender;
	private String work;
	private String phone;
	private String address;
	
	public User() {
		super();
	}

	public User(String userid, String userpwd, String userpwd2, String email, String email2, String name,
			String namekana, int birthYear, int birthMonth, int birthDate, String birthday, String gender, String work,
			String phone, String address) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.userpwd2 = userpwd2;
		this.email = email;
		this.email2 = email2;
		this.name = name;
		this.namekana = namekana;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.birthDate = birthDate;
		this.birthday = birthday;
		this.gender = gender;
		this.work = work;
		this.phone = phone;
		this.address = address;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUserpwd2() {
		return userpwd2;
	}

	public void setUserpwd2(String userpwd2) {
		this.userpwd2 = userpwd2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNamekana() {
		return namekana;
	}

	public void setNamekana(String namekana) {
		this.namekana = namekana;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}

	public int getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(int birthMonth) {
		this.birthMonth = birthMonth;
	}

	public int getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(int birthDate) {
		this.birthDate = birthDate;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [userid=" + userid + ", userpwd=" + userpwd + ", userpwd2=" + userpwd2 + ", email=" + email
				+ ", email2=" + email2 + ", name=" + name + ", namekana=" + namekana + ", birthYear=" + birthYear
				+ ", birthMonth=" + birthMonth + ", birthDate=" + birthDate + ", birthday=" + birthday + ", gender="
				+ gender + ", work=" + work + ", phone=" + phone + ", address=" + address + "]";
	}

	
}
