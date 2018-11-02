package org.school.test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.school.test.vo.Log;
import org.school.test.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class webSocketRepository {
	@Autowired
	SqlSession session;
	
	public int insertLog(Log log) {

		webSocketDAO mapper = session.getMapper(webSocketDAO.class);
		int result = mapper.insertLog(log);
		return result;
	}
	

	public int insertMessage(Message m) {
		
		webSocketDAO mapper = session.getMapper(webSocketDAO.class);
		int result = mapper.insertMessage(m);
		return result;
	}


	public int insertEndTimeLog(Log log) {
	
		webSocketDAO mapper = session.getMapper(webSocketDAO.class);
		int result = mapper.insertEndTimeLog(log);
		return result;
		
	}


	public List<Message> getMessageList(String id, String roomNum) {
		webSocketDAO mapper = session.getMapper(webSocketDAO.class);
		Map<String, String> map =new HashMap<>();
		map.put("sessionId", id);
		map.put("roomName", roomNum);
		List<Message> list = mapper.getMessageList(map);
		return list;
	}
	
}
