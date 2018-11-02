package org.school.test.vo;

import java.util.*;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {
	private String roomName;
	private String userid;
	private WebSocketSession session;

	public ChatRoom(String roomName, String userid, WebSocketSession session) {
		super();
		this.roomName = roomName;
		this.userid = userid;
		this.session = session;
	}

	public ChatRoom() {
		super();
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public WebSocketSession getSession() {
		return session;
	}

	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomName=" + roomName + ", userid=" + userid + ", session=" + session + "]";
	}

}
