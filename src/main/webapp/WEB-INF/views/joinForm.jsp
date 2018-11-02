<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Form</title>
 
<link rel="stylesheet" href="./resources/css/joinForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script type="text/javascript" src="./resources/js/joinForm.js" ></script>
<script type="text/javascript" src="./resources/js/joinFormAJax.js" ></script>
</head>

<script>

</script>

    <body>

      <form action="join" method="post" >
      
        <h1>Sign Up</h1>
   
        <fieldset>
          <legend><span class="number">1</span>ログイン情報</legend>
          
          <label for="name"><strong class="star">*</strong>ログインID</label>
          <div id="inputBox"><input type="text" id="userid" name="userid"></div>
          <div id="checkid"><button id="btn" type="button">ID CHECK</button></div>
	
          <label for="password"><strong class="star">*</strong>パスワード </label>
          <input type="password" id="userpwd" name="userpwd"　placeholder="半角数字11桁">
        　　　　　　<label for="password2"><strong class="star">*</strong>パスワードを再入力してください</label>
          <input type="password" id="userpwd2" name="userpwd2">
    
    　		  <label for="email"><strong class="star">*</strong>email</label>
          <input type="email" id="email" name="email">
        　　　　　　<label for="email2"><strong class="star">*</strong>emailを再入力してください</label>
          <input type="email" id="email2" name="email2">
		
         
          <legend><span class="number">2</span>あなたの情報</legend>
         
         
          <label for="username"><strong class="star">*</strong>氏名 </label>
          <input type="text" id="name" name="name">
          <label for="namekana"><strong class="star">*</strong>氏名（カナ) </label>
          <input type="text" id="namekana" name="namekana"> 
          <br><br>
         
         <label for="birth"><strong class="star">*</strong>生年月日:</label>
         <select id="birthYear" name="birthYear">
         <c:forEach begin="1920" end="2018" var="x" step="1">
         <option value="${3938-x}">${3938-x}</option>
         </c:forEach>
       	 </select>年 
        
         <select id="birthMonth" name="birthMonth">
         <c:forEach begin="1" end="12" var="x" step="1">
         <option value="${x}">${x}</option>
         </c:forEach>
       	 </select>月 
       	 
       	 <select id="birthDate" name="birthDate">
         <c:forEach begin="1" end="31" var="x" step="1">
         <option value="${x}">${x}</option>
         </c:forEach>
       	 </select>日
       	 
   		
        <br>
        <br>
          <label><strong class="star">*</strong>学生・職業 :</label>
          <select id="work" name="work">
          <option value="高校１年生">高校１年生</option>
      	  <option value="高校２年生">高校２年生</option>
      	  <option value="高校３年生">高校３年生</option>
      	  <option value="高校４年生">高校４年生</option>
      	  <option value="高校生以外の学生">高校生以外の学生</option>
      	  <option value="社会人">社会人</option>
      	  <option value="先生">先生</option>
      	  <option value="保護者">保護者</option>
      	  <option value="日本への留学生">日本への留学生</option>
      	  <option value="その他">その他</option>
      	  </select>
     	
     	<label>性別 :</label>
          <input type="radio" id="male" value="male" name="gender">男性  
          <input type="radio" id="female" value="female" name="gender">女性 
          <br>
         
        
     	<br><br>
          <label for="phone">電話番号:</label>
          <input type="text" id="phone" name="phone" placeholder="ハイフンなしの半角数字11桁">
        
        </fieldset>
     
        <button id="btn2" onclick="return check()">완료</button>
      </form>
      
    </body>
</html>
  
