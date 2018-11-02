<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/schoolBoard.css" type="text/css" media="all">
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
<script type="text/javascript" src="./resources/js/homeAJax.js" ></script>

</head>
<script>
function beforePage(page,end) {
	if(page>1)
	location.href="getBoardList?page="+(page-1);
}
function afterPage(page,end,group,perPage) {
	location.href="getBoardList?page="+(page+1);
}
function search(page) {
	
	var search="";
	var searches = document.getElementById("search");
	for(var i=0;i<searches.length;i++){
			if(searches[i].selected==true){
			search=searches[i].value;
		}
	}
	
	var searchText =document.getElementById("searchText").value;
	location.href="getBoardList?searchText="+searchText+"&search="+search+"&page="+page;
}

window.onload = function() {
	var returnSearch=document.getElementById("selectBox").value;
	var search="";
	var searches = document.getElementById("search");
	for(var i=0;i<searches.length;i++){
		if(returnSearch==searches[i].value){
			searches.value=returnSearch;
	}
	}
}
function goback() {
	var keyword=document.getElementById("keyword").value;
	location.href="keywordSearch?search="+keyword;
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
    
   <!--    <div class="inside"> -->

<table cellspacing='0'> 
	<col style="width:13%;"/>
	<col style="width:28%;"/>
	<col style="width:16%;"/>
	<col style="width:16%;"/>
	<col style="width:16%;"/>
	<col style="width:18%;"/>
	
	<thead>
		<tr>

			<th class="test">番号</th>
			<th class="test">件名</th>
			<th class="test">作成者</th>
			<th class="test">閲覧数</th>
			<th class="test">いいねの数</th>
			<th class="test">日付</th>
			
		</tr>
	</thead>

	<tbody>
<c:forEach var="board" items="${list}" varStatus="status">
		<tr class="test2">
		    <td id="seq"></td>
			<td id="title"><a href="boardDetail?boardnum=${board.boardnum}">${board.title}</a></td>
			<td>${board.userid}</td>
			<td>${board.hitcount}</td>
			<td></td>
			<td>${board.regdate}</td>
		</tr>
</c:forEach>
	</tbody>
	<tr>
	<th colspan="6">
	<select id="search" name="search">

	<option value="userid" >作成者</option>
	<option value="title">件名</option>
	<option value="content" >内容</option>
	
	</select>
	<input type="hidden" id="selectBox" value="${search}">
	<input type="text" name="searchText" id="searchText" value="${searchText}">
	<input type="button" value="검색" onclick="search(1)">

	</th>
	</tr>
	
	<tr>
	<th colspan="6">
	<a href="javascript:beforePage(${page},${navi.endPageGroup})"> <<<<<< </a>
	<c:forEach var="x" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
		<c:if test="${x==page}"><div id="num"></c:if>
		<a href="javascript:search('${x}')">${x}</a>
		<c:if test="${x==page}"></div></c:if>
	</c:forEach>
	<a href="javascript:afterPage(${page},${navi.endPageGroup},${navi.currentGroup},${navi.pagePerGroup})">>>>>>></a>
	</th>
	</tr>
	
	<tr class="even">
			<th colspan="6" align="center"> 
			<a href="boardRegistForm?"><button>掲示板に投稿する</button></a>
			<input type="hidden" id="keyword" value="${sessionScope.keyword}">
			<%-- <a href="keywordSearch?search='${sessionScope.schoolnum}'"> --%>
			<input type="button" onclick="goback()" value="学校リストに戻る">
			</th>
	</tr>
	
	
	
</table>

    <!--   </div> -->
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