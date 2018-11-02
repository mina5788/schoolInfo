<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/boardUpdate.css"/>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function boardList(){
	location.href="getBoardList?";
}
function update(boardnum) {
	location.href="update?boardnum="+boardnum;
}
function deleteBoard(boardnum) {
	location.href="deleteBoard?boardnum="+boardnum;
}
function hitGood(boardnum) {
	
	location.href="hitGood?boardnum="+boardnum;
}
/* function download(boardnum) {
	location.href="download?boardnum="+boardnum;
}
 */

$(function(){
	var overlap =document.getElementById("overlap").value;
	if(overlap=="true"){
	alert('いいね!は一回しか押せません');
	}
	$("#download").on('click',function(){
		$.ajax({
			url:"download",
			type:"get",
			data:{"boardnum":$("#boardnum").val()},
			success:function(data){
				alert(data);
			},
			error:function(){
				alert("실패");
			}
	
	});
});
});



/* function insertReview(boardnum) {
	var reviewContent =document.getElementById("reviewContent").value;
	location.href="insertReview?boardnum="+boardnum+"&reviewContent="+reviewContent;
} */


</script>
<body>
<form>

<table width="97%" align="center" cellpadding="0" cellspacing="0"><tr><td>


<br><br>

<table width="680" cellspacing="0" cellpadding="0" border=0 align="center">

<tr><td height="34">
    <table class="tab" width=100% cellpadding=0 cellspacing=0>
    <tr>
    	<td style='word-break:break-all; height:28px; padding-left:34px;'>
		<strong>件名</strong>&nbsp;&nbsp;&nbsp;&nbsp;${board.title}</td>

    </tr>
    </table></td></tr>


<tr>
<td>
<table class="tab" border=0 w/f;flidth="100%"><tr>
<td height=28 style='padding-left:20px' width="50%">

	<strong>作成者</strong>&nbsp;&nbsp;&nbsp;&nbsp;${board.userid}&nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>日付</strong>&nbsp;&nbsp; ${board.regdate} &nbsp;&nbsp;&nbsp;&nbsp;
    </td><td style='padding-left:20px'>
	<strong>閲覧数</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${board.hitcount}&nbsp;&nbsp;&nbsp;&nbsp;
    
    </td>
     <c:if test="${board.originalfile==null}">
     <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
     </c:if>
   <c:if test="${board.originalfile!=null}">
    <td style='padding-left:20px'>
	<strong>添付ファイル</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${board.originalfile}&nbsp;&nbsp;&nbsp;&nbsp;
  	<input type="button" value="ダウンロード" id="download">
    </td></c:if> 
</tr></table>
</td></tr>
<tr><td height=1 bgcolor=#A1B4E1></td></tr>


<tr> 
    <td id="content" height="600">
     ${board.content}    
</td>
</tr>

<tr>
<td id="btn" height="40" align="center">
<img src="./resources/images/good2.jpg" onclick="hitGood(${board.boardnum})">
<input type="hidden" id="overlap" value="${overlap}"> 
<h3>いいね！${goodCount}</h3>
<div class="div">
<p class="p">
<input type="button" value="목록으로" onclick="boardList()"/>
<input type="hidden" value="${board.boardnum}" id="boardnum"/>
<c:if test="${sessionScope.loginId!=null }">
	<c:if test="${board.userid==sessionScope.loginId}">
		<input type="button" value="수정" onclick="update(${board.boardnum})"/>
		<input type="button" value="삭제" onclick="deleteBoard(${board.boardnum})"/>
	</c:if>
</c:if> 
</p>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</form>


</body>
</html>