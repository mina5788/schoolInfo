<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
	<title>Chat</title>
<meta charset="utf-8">
	<link rel="stylesheet" href="./resources/css/chat.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<body>
	<input type="hidden" id="roomName" value="${roomName}"/>
	<div class="main-section">
		<div class="head-section">
			<div class="headLeft-section">
				<div class="headLeft-sub">
					<!-- <input type="text" name="search" placeholder="Search...">
					<button> <i class="fa fa-search"></i> </button>
 -->				</div>
			</div>
			<div class="headRight-section">
				<div class="headRight-sub">
					<h3>WELCOME!${sessionScope.loginId}</h3>
					<small><%-- ようこそ${roomName}のルームへ --%></small>
				</div>
			</div>
		</div>
		<div class="body-section">
			<div class="left-section mCustomScrollbar" data-mcs-theme="minimal-dark">
				 <ul>
					<li>
						<div class="chatList">
							<div class="img">
							
								
							<!-- 	<img src="./resources/images/man01.png"> -->
							</div>
							<div class="desc">
									<input type="hidden" id="userid" value="${sessionScope.loginId}"><br>
<!--    방번호:<input type="text" id="roomNum"> -->
    <input type="button" id="enterBtn" value="入場">
    <input type="button" id="exitBtn" value="退場">
								
								
							<small class="time"></small>
								<h5></h5>
								<small> </small>
							</div>
						</div>
					</li>
					<li>
					 <div class="chatList">
							<div class="img">
								<i class="fa fa-circle"></i>
								<img src="./resources/images/man02.png">
							</div>
							<div class="desc">
								<small class="time"></small>
								<h5>mina5788</h5>
								<small></small>
							</div>
						</div>
					</li>
					<li class="chatList">
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man03.png">
							</div>
							<div class="desc">
								<small class="time"></small>
								<h5>zlrziw11</h5>
								<small></small>
							</div>
						</div>
					</li>
					<li>
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man04.png">
							</div>
							<div class="desc">
								<small class="time"></small>
								<h5>Lod Kine</h5>
								<small></small>
							</div>
						</div>
					</li>
					<li> 
				<!-- 		<div class="chatList">
							<div class="img">
								<i class="fa fa-circle"></i>
								<img src="./resources/images/man01.png">
							</div>
							<div class="desc">
								<small class="time">11:50 am</small>
								<h5>Nik Minaj</h5>
								<small>Lorem ipsum dolor sit amet...</small>
							</div>
						</div>
					</li>
					<li>
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man02.png">
							</div>
							<div class="desc">
								<small class="time">20 day</small>
								<h5>Win Sina</h5>
								<small>Lorem ipsum dolor sit amet...</small>
							</div>
						</div>
					</li>
					<li>
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man03.png">
							</div>
							<div class="desc">
								<small class="time">18 day</small>
								<h5>Jack Clerk</h5>
								<small>Lorem ipsum dolor sit amet...</small>
							</div>
						</div>
					</li>
					<li>
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man02.png">
							</div>
							<div class="desc">
								<small class="time">20 day</small>
								<h5>Win Sina</h5>
								<small>Lorem ipsum dolor sit amet...</small>
							</div>
						</div>
					</li>
					<li>
						<div class="chatList">
							<div class="img">
								<img src="./resources/images/man03.png">
							</div>
							<div class="desc">
								<small class="time">18 day</small>
								<h5>Jack Clerk</h5>
								<small>Lorem ipsum dolor sit amet...</small>
							</div>
						</div> -->
					</li>
				</ul> 
			</div> 
			<div class="right-section">
				<div class="message mCustomScrollbar" id="scroll" data-mcs-theme="minimal-dark">
					<ul>
					<div id="chatcontent"></div>
					</ul>
				</div>
				<div class="right-section-bottom">
					<form>
						<div class="upload-btn">
						  	<button class="btn"><i class="fa fa-photo"></i></button>
						  	
						</div>
						
						<input type="text" id="message" name="" placeholder="type here...">
						<!-- <input value="전송"> -->

						<button type="button" id="sendBtn" class="btn-send"><i class="fa fa-send"></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	 -->
<script type="text/javascript" src="./resources/js/websocket.js" ></script>
	<!-- custom scrollbar plugin -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
</body>
</html>