<%@ page language="java" contentType="application/hwp;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% response.setHeader("Content-Disposition", "attachment;filename=chatting.doc");
response.setContentType("application/vnd.ms-word");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>

 <c:forEach var="m" items="${list}" varStatus="status">
		<tr class="test2">
			<td>送信者</td><td>${m.messageSender}</td>
			<td>内容</td><td>${m.content}</td>
			<td>日時</td><td>${m.sendTime}</td>
		</tr>
</c:forEach> 
</table>
</body>
</html>