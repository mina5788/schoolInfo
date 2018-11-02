<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<title>Student's Site</title>
<meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="./resources/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="./resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="./resources/js/cufon-replace.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_300.font.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/loginAjax.js" ></script>
</head>
<script type="text/javascript" src="./resources/js/homeAJax.js" ></script>

<body id="page1">
<!-- START PAGE SOURCE -->

<div class="wrap">
  <header>
    <div class="container">
      <h1><a href="#"></a></h1>
      <nav>
        <ul>
          <li class="current"><a href="${pageContext.request.contextPath}" class="m1">Home Page</a></li>
          <li><a href="updateUserInfoForm?" class="m3">My Page</a></li>
         
         <!--  <li><a href="contact-us.html" class="m4">Contact Us</a></li>
          <li class="last"><a href="sitemap?" class="m5">Sitemap</a></li> -->
        </ul>
      </nav>
      <form action="keywordSearch" id="search-form">
        <fieldset>
          <div class="rowElem">
            <input type="text" name="search" style="height: 25px">
        <button>キーワードで学校検索</button></div>
        </fieldset>
      </form>
    </div>
  </header>
  <div class="container">
    <aside>
      <h3>Chatting Room</h3>
      <ul class="categories">
        <li><span><a href="goChat?roomnum=1" onclick="window.open(this.href, 'newWindow1', 'width=1200, height=800'); return false;">高校1年生</a></span></li>
        <li><span><a href="goChat?roomnum=2" onclick="window.open(this.href, 'newWindow2', 'width=1200, height=800'); return false;">高校2年生</a></span></li>
        <li><span><a href="goChat?roomnum=3" onclick="window.open(this.href, 'newWindow3', 'width=1200, height=800'); return false;">高校3年生</a></span></li>
        <li><span><a href="goChat?roomnum=4" onclick="window.open(this.href, 'newWindow4', 'width=1200, height=800'); return false;">大学在学生</a></span></li>
        <li><span><a href="goChat?roomnum=5" onclick="window.open(this.href, 'newWindow5', 'width=1200, height=800'); return false;">先生</a></span></li>
        <li><span><a href="goChat?roomnum=6" onclick="window.open(this.href, 'newWindow6', 'width=1200, height=800'); return false;">父母</a></span></li>
      </ul>
      
  
<!--LOGIN  -->
      <form id="newsletter-form">
        <fieldset>
         	<input type="hidden"  id="tempUserid">
          	<c:if test="${sessionScope.loginId==null}">
          	 <div class="rowElem" id="loginDiv">
 				<div class="clear2">
        		  ID:  <input type="text" name="userid" id="userid">
          		  PASSWORD:   <input type="password" name="userpwd" id="userpwd">
         		</div>
            	<div class="clear"><a class="fleft" id="logout" href="joinForm?">新規取得</a><p class="fright"><button type="button" onclick="login()">ログイン</button></p></div>
          	</div>
          	</c:if>
          
          	<c:if test="${sessionScope.loginId!=null}">
          	 <div class="rowElem" id="logoutDiv">
 				<div class="clear2">
 				<br>
          		<h4 style="color: white">WELCOME</h4>
          		<h3>${sessionScope.loginId}</h3>
          		</div>
          		<div class="clear"><span><button onclick="logout()" type="button" class="fleft">ログアウト</button>></span></div>

          	</div>
          	</c:if> 
        </fieldset>
      </form>
    	<div id="test">センター試験</div>
    	<br>
     <h2><span>D-<div id="ddays"></div></span></h2>
      <!-- <ul class="news">
        <li><strong>June 30, 2010</strong>
          <h4><a href="#">Sed ut perspiciatis unde</a></h4>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. </li>
        <li><strong>June 14, 2010</strong>
          <h4><a href="#">Neque porro quisquam est</a></h4>
          Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit consequuntur magni. </li>
        <li><strong>May 29, 2010</strong>
          <h4><a href="#">Minima veniam, quis nostrum</a></h4>
          Uis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae. </li>
      </ul> -->
    </aside>
    <section id="content">
     <div id="banner">
        <h2> For Student<span>campus navigation <span>Homepage</span></span></h2>
      </div> 
      <div class="inside">
        <h2>for <span> entrance examination</span></h2>
        <ul class="list">
          <li><span></span>
            <h4>AO入試</h4>
           <!--  <p>Eusus consequam vitae habitur amet nullam vitae condis phasellus sed justo. Orcivel mollis intesque eu sempor ridictum a non laorem lacingilla wisi.</p> -->
          </li>
          <li><span></span>
            <h4>推薦入学</h4>
          <!--   <p>Eusus consequam vitae habitur amet nullam vitae condis phasellus sed justo. Orcivel mollis intesque eu sempor ridictum a non laorem lacingilla wisi.</p> -->
          </li>
          <li class="last"><span></span>
            <h4>進学相談</h4>
           
          </li>
        </ul>
        <h2>Move Forward <span>With Your Education</span></h2>
        <p><span class="txt1">情報共有</span>  </p>
        <div class="img-box"></div>
        <p class="p0"></p>
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
<!-- END PAGE SOURCE -->
</body>
</html>





