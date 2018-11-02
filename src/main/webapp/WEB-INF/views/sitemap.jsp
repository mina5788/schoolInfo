<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

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
      <form action="#" id="search-form">
        <fieldset>
          <div class="rowElem">
            <input type="text">
            <a href="#">Search</a></div>
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
          	 <div class="rowElem" id="loginDiv">
 				<div class="clear2">
        		  ID:  <input type="text" name="userid" id="userid">
          		  PASSWORD:   <input type="password" name="userpwd" id="userpwd">
         		</div>
            	<div class="clear"><a class="fleft" id="logout">新規取得</a><p class="fright"><button type="button" onclick="login()">ログイン</button></p></div>
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
      <div id="banner">
        <h2>Professional <span>Online Education <span>Since 1992</span></span></h2>
      </div>
      <div class="inside">
        <h2>Site <span>Map</span></h2>
        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>
        <ul class="sitemap">
          <li><a href="${pageContext.request.contextPath}">Home</a></li>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Articles</a>
            <ul>
              <li><a href="article.html">Article 1</a></li>
              <li><a href="#">Article 2</a></li>
              <li><a href="#">Article 3</a></li>
            </ul>
          </li>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">Site Map</a></li>
        </ul>
        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
        <p class="p0">Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>
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