package org.school.test.vo;

public class Log {
	String startMessageNum;
	String endMessageNum;
	String sessionId;
	String roomName;
	
	public Log(String startMessageNum, String endMessageNum, String sessionId, String roomName) {
		super();
		this.startMessageNum = startMessageNum;
		this.endMessageNum = endMessageNum;
		this.sessionId = sessionId;
		this.roomName = roomName;
	}

	public Log() {
		super();
	}

	public String getStartMessageNum() {
		return startMessageNum;
	}

	public void setStartMessageNum(String startMessageNum) {
		this.startMessageNum = startMessageNum;
	}

	public String getEndMessageNum() {
		return endMessageNum;
	}

	public void setEndMessageNum(String endMessageNum) {
		this.endMessageNum = endMessageNum;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "Log [startMessageNum=" + startMessageNum + ", endMessageNum=" + endMessageNum + ", sessionId="
				+ sessionId + ", roomName=" + roomName + "]";
	}
	
	
	
	
}