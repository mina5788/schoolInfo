<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/board2.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="./resources/js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="./resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="./resources/js/cufon-replace.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_300.font.js"></script>
<script type="text/javascript" src="./resources/js/Myriad_Pro_400.font.js"></script>
<script type="text/javascript" src="./resources/js/script.js"></script>
<script type="text/javascript" src="./resources/js/schoolnum.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/loginAjax.js" ></script>
<script type="text/javascript" src="./resources/js/wishListAjax.js" ></script>
<script type="text/javascript" src="./resources/js/homeAJax.js" ></script>
</head>

<script>
function schoolnum(schoolnum) {
	location.href="getBoardList?schoolnum="+schoolnum;
}

function boardList(){
	location.href="boardList?";
}
</script>

<body id="page6">
	<input type="hidden"  id="tempUserid">
<div class="wrap">
  <header>
    <div class="container">
      <h1><a href="goHome?">Student's site</a></h1>
      <nav>
        <ul>
          <li class="current"><a href="goHome?" class="m1">Home Page</a></li>
          <li><a href="updateUserInfoForm?" class="m3">My Page</a></li>
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
        <li><span><a href="chat?roomnum=1" onclick="window.open(this.href, 'newWindow1', 'width=1200, height=800'); return false;">高校1年生</a></span></li>
        <li><span><a href="chat?roomnum=2" onclick="window.open(this.href, 'newWindow2', 'width=1200, height=800'); return false;">高校2年生</a></span></li>
        <li><span><a href="chat?roomnum=3" onclick="window.open(this.href, 'newWindow3', 'width=1200, height=800'); return false;">高校3年生</a></span></li>
        <li><span><a href="chat?roomnum=4" onclick="window.open(this.href, 'newWindow4', 'width=1200, height=800'); return false;">大学在学生</a></span></li>
        <li><span><a href="chat?roomnum=5" onclick="window.open(this.href, 'newWindow5', 'width=1200, height=800'); return false;">先生</a></span></li>
        <li><span><a href="chat?roomnum=6" onclick="window.open(this.href, 'newWindow6', 'width=1200, height=800'); return false;">父母</a></span></li>
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
    
      <div class="inside">
        <h2>안녕 <span>Map</span></h2>


<table cellspacing='0'> 
	<col style="width:10%;"/>
	<col style="width:40%;"/>
	<col style="width:20%;"/>
	<col style="width:30%;"/>


	<thead>
		<tr>

			<th class="test">学校名（ふりがな）</th>
			<th class="test">キャンパス名</th>
			<th class="test">掲示板</th>
			<th class="test">
			<c:if test="${sessionScope.loginId!=null}">
			<input type="hidden" id="loginId" value="true">
			</c:if>
			<c:if test="${sessionScope.loginId==null}">
			<input type="hidden" id="loginId" value="false">
			</c:if>
			気になる</th>
			
		</tr>
	</thead>

	<tbody>
	
		<c:forEach var="school" items="${json.results.school}" varStatus="인덱스변수명">
		<%-- (${school.code}) --%>
		<tr class="test2" rowspan="2" height="50px">
		    <td><strong><div style="font-size: 17px">
		    <a href="${school.urls.pc}">${school.name}<br>(${school.kana})</a></div></strong></td>
	
			<td> <c:forEach var="campus" items="${school.campus}">
			${campus.name}<br></c:forEach>
			</td>
			
			<td><a href ="setSchoolnum?schoolnum=${school.code}"><img src="./resources/images/board.png"></a></td>
			<td>
			<input type="hidden" id="schoolnum" value="${school.code}">
			<img src="./resources/images/love.png" onclick=wishList()></td>
		</tr>
		<!-- <tr><td id="title" colspan="4"></td></tr> -->
		</c:forEach>
	</tbody>
	<!-- <tr>
	<th colspan="4">
	<select id="search" name="search">

	<option value="userid" >아이디</option>
	<option value="title">제목</option>
	<option value="content" >내용</option>
	
	</select>
	<input type="text" name="searchText" id="searchText">
	<input type="button" value="검색" >
	</th>
	</tr> -->
	</table>
			
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