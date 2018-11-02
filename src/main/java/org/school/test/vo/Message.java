package org.school.test.vo;

import java.util.Date;

public class Message {
	
	private String messageNum;
	private String messageSender;
	private String content;
	private Date sendTime;
	private String roomName;
	
	public Message(String messageNum, String messageSender, String content, Date sendTime, String roomName) {
		super();
		this.messageNum = messageNum;
		this.messageSender = messageSender;
		this.content = content;
		this.sendTime = sendTime;
		this.roomName = roomName;
	}

	public Message() {
		super();
	}

	public String getMessageNum() {
		return messageNum;
	}

	public void setMessageNum(String messageNum) {
		this.messageNum = messageNum;
	}

	public String getMessageSender() {
		return messageSender;
	}

	public void setMessageSender(String messageSender) {
		this.messageSender = messageSender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "Message [messageNum=" + messageNum + ", messageSender=" + messageSender + ", content=" + content
				+ ", sendTime=" + sendTime + ", roomName=" + roomName + "]";
	}
	
	
	
}