package org.school.test.handler;

import java.util.ArrayList;
import java.util.List;

import org.school.test.dao.webSocketRepository;
import org.school.test.vo.ChatRoom;
import org.school.test.vo.Log;
import org.school.test.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;


public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	webSocketRepository repository;
	
	private List<ChatRoom> RoomList = new ArrayList<>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	 System.out.println("연결");
	}

//5////파일다운로드 확인
//6////관심목록css

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub

		String userid="";
		String roomNum="";
		String talkerRoom = "";
		String jsonStr = message.getPayload();
		
		Message m = new Message();

		//나가기버튼을 누른후 그 정보를 워드에 저장하길 원할때
		if (jsonStr.equals("messageSave")) {
			System.out.println("메세지저장시");
			for (ChatRoom chat : RoomList) {
				if (chat.getSession().getId().equals(session.getId())) {
					roomNum = chat.getRoomName();
				}
			}
			Log log = new Log();
			log.setRoomName(roomNum);
			log.setSessionId(session.getId());
			repository.insertEndTimeLog(log);
			System.out.println(1);
			List<Message> list=repository.getMessageList(session.getId(),roomNum);
			System.out.println(2);
			System.out.println(list);
			Gson gson = new Gson();
			String jsonMessageList = gson.toJson(list);
			System.out.println("list를 json타입으로"+jsonMessageList);
			session.sendMessage(new TextMessage("jsonMessage::::"+jsonMessageList));
		
		}
		//나가기버튼을 누른후 저장안할때
		else if (jsonStr.equals("notMessageSave")) {
			session.sendMessage(new TextMessage("socketClose::::"));
		}
		//처음 채팅방에 들어온 사람일 경우	
		else if (jsonStr.contains("::::")) {
			System.out.println(3);
			roomNum = message.getPayload().split("::::")[1];
			userid = message.getPayload().split("::::")[3];
			ChatRoom chat = new ChatRoom(roomNum, userid, session);
			System.out.println(4);
			RoomList.add(chat);
			System.out.println(5);
			Log log = new Log();
			System.out.println(6);
			log.setRoomName(roomNum);
			log.setSessionId(session.getId());
			System.out.println(7);
			System.out.println(log);
			repository.insertLog(log);
			System.out.println(8);
		}
		//이미 들어와 있는 사람일 경우
		else{
			
			System.out.println("제이슨 객체생성전");
			Gson gson = new Gson();
			System.out.println("제이슨 객체생성후");
			m = gson.fromJson(jsonStr,  Message.class);
			for (ChatRoom chat : RoomList) {
				if (chat.getSession().getId().equals(session.getId())) {
					talkerRoom = chat.getRoomName();
					m.setRoomName(talkerRoom);
					System.out.println(m.toString());
					repository.insertMessage(m);
					
					
				}
			}
			for (ChatRoom chat : RoomList) {
				if (talkerRoom.equals(chat.getRoomName())) {
					chat.getSession().sendMessage(new TextMessage(jsonStr));
					System.out.println(5);
				}
			}
	}

	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("끊김");
		for (int i=0;i<RoomList.size();i++) {
			if (RoomList.get(i).getSession().getId().equals(session.getId())) {
				RoomList.remove(i);
			}
		}
	}

}
