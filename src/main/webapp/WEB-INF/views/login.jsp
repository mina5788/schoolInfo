<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

<link rel="stylesheet" href="./resources/css/loginForm.css"/>
</head>


<body>
<div id="wrap">
<div class="login-page">
  <div class="form">

<c:if test="${match!=null}">
<script type="text/javascript">
alert("該当のユーザーは存在しません。");
</script>
</c:if>
<c:if test="${match==null}">
<script type="text/javascript">
alert("ログインしてから利用可能なサービスです。");
</script>
</c:if>
	
    <form class="login-form" action="login">
    	<c:if test="${sessionScope.goodhitBoardnum!=null}">
			<input type="hidden" name="boardnum" value="${sessionScope.goodhitBoardnum}">
		</c:if>
		<c:if test="${forBoardForm!=null}">
			<input type="hidden" name="forBoardForm" value="${forBoardForm}">
		</c:if>
    	<c:if test="${wishList==true}">
			<input type="hidden" name="keyword" value="${sessionScope.keyword}">
		</c:if>
		<c:if test="${sessionScope.roomnum!=null}">
			<input type="hidden" name="roomnum" value="${sessionScope.roomnum}">
		</c:if>
      <input type="text" placeholder="userid" name="userid"/>
      <input type="password" placeholder="password" name="userpwd"/>
      <button type="submit">login</button>
      <p class="message">新規取得 <a href="joinForm?">Create an account</a></p>
    </form>
  </div>
</div>
 -->
</div>


</body>
</html>