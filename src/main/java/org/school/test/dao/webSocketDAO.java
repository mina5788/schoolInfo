package org.school.test.dao;

import java.util.List;
import java.util.Map;

import org.school.test.vo.Log;
import org.school.test.vo.Message;


public interface webSocketDAO {

	public int insertLog(Log log);

	public int insertMessage(Message m);

	public int insertEndTimeLog(Log log);
	
	public List<Message> getMessageList(Map<String, String> map);

	
}
