<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/registBoard.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="./resources/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="./resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="./resources/js/cufon-replace.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_300.font.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>

</head>

<body id="page6">

<div class="wrap">
  <header>
    <div class="container">
      <h1><a href="#">Student's site</a></h1>
      <nav>
        <ul>
          <li><a href="${pageContext.request.contextPath}" class="m1">Home Page</a></li>
          <li><a href="about-us.html" class="m2">About Us</a></li>
         <li><a href="updateUserInfoForm?" class="m3">My Page</a></li>
          <li><a href="contact-us.html" class="m4">Contact Us</a></li>
          <li class="last current"><a href="sitemap.html" class="m5">Sitemap</a></li>
        </ul>
      </nav>
      <form action="keywordSearch" id="search-form">
        <fieldset>
          <div class="rowElem">
            <input type="text" name="search" style="height: 20px">
        <button>キーワードで学校検索</button></div>
        </fieldset>
      </form>
    </div>
  </header>
  <div class="container">
    <aside>
      <h3>Categories</h3>
      <ul class="categories">
        <li><span><a href="#">Programs</a></span></li>
        <li><span><a href="#">Student Info</a></span></li>
        <li><span><a href="#">Teachers</a></span></li>
        <li><span><a href="#">Descriptions</a></span></li>
        <li><span><a href="#">Administrators</a></span></li>
        <li><span><a href="#">Basic Information</a></span></li>
        <li><span><a href="#">Vacancies</a></span></li>
        <li class="last"><span><a href="#">Calendar</a></span></li>
      </ul>
   
<!--LOGIN  -->
      <form action="login" id="newsletter-form">
        <fieldset>
         
          	<c:if test="${sessionScope.loginId==null}">
          	 <div class="rowElem">
 				<div class="clear2">
        		  ID:  <input type="text" name="userid">
          		  PASSWORD:   <input type="password" name="userpwd">
         		</div>
            	<div class="clear"><a href="joinForm?" class="fleft">新規取得</a><p class="fright"><button>ログイン</button></p></div>
          	</div>
          	</c:if>
          
          	<c:if test="${sessionScope.loginId!=null}">
          	 <div class="rowElem">
 				<div class="clear2">
 				<br>
          		<h4 style="color: white">WELCOME</h4>
          		<h3>${sessionScope.loginId}</h3>
          		</div>
          		
          		<div class="clear"><span><a href="logout?" class="fleft">ログアウト</a></span></div>
          	</div>
          	</c:if>
        </fieldset>
      </form>
   
      <h2>Fresh <span>News</span></h2>
      <ul class="news">
        <li><strong>June 30, 2010</strong>
          <h4><a href="#">Sed ut perspiciatis unde</a></h4>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. </li>
        <li><strong>June 14, 2010</strong>
          <h4><a href="#">Neque porro quisquam est</a></h4>
          Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni. </li>
        <li><strong>May 29, 2010</strong>
          <h4><a href="#">Minima veniam, quis nostrum</a></h4>
          Uis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae. </li>
      </ul>
    </aside>
    <section id="content">  
  	<div class="inside"> 
  	<form action="writeBoard" method="post" encType="multipart/form-data">

<table>
	<col style="width:40%;"/>
	<col style="width:70%;"/>
    <tbody>
            <tr>
                <th>タイトル: </th>
                <td><input type="text" name="title" style="width:437px; height:22px; "/></td>
            </tr>
            <tr>
                <th>内容:
                <td><textarea name="content" cols="60" rows="40"></textarea></td>
            </tr>
       		<tr>
                <th align="left">添付ファイル: </th>
                <td><input type="file" name="uploadfile"></td>
            </tr>
           <!-- <tr>
                <th>비밀번호: </th>
                <td><input type="password" placeholder="비밀번호를 입력하세요"/></td>
            </tr> -->
            <tr> 
                <td colspan="2">
                    <input type="hidden" name="schoolnum" value="${sessionScope.schoolnum}">
                    <input type="submit" value="登録"/>
                    <a href="getBoardList?"><input type="button" value="戻る"/></a>
                </td>
            </tr>
   
    </tbody>
</table>
</form>

   </div> 
    </section>
  </div>
</div>

<footer>
  <div class="footerlink">
    <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
    <p class="rf">Design by <a href="http://www.templatemonster.com/">TemplateMonster</a></p>
    <div style="clear:both;"></div>
  </div>
</footer>
<script type="text/javascript"> Cufon.now(); </script>

</body>
</html>