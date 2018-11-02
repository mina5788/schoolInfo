package org.school.test.dao;

import org.school.test.vo.User;

public interface UserDAO {

	public void insertUser(User user);

	public String getCheckedId(String userid);

	public User login(User user);

	public User getUserInfo(String loginId);

	public void updateUser(User user);

}
