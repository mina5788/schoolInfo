
	var sock;

	function connect() {
		
		sock = new SockJS("echo");
		
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	}
	function disconnect() {

        msg = "内容を保存しますか?";
            if (confirm(msg)!=0) {
            	sock.send("messageSave");
            } else {
            	sock.send("notMessageSave");
        }
           /* sock.close();*/
	}
	
	function appendMessage(content,sendId) {
		
		var d = new Date();
		var nowHour = d.getHours();
		var nowMt = d.getMinutes();
		if (nowHour < 12 ) {
			var str = ' am';}
		else {
			nowHour = nowHour-12;
			var str = ' pm';}
			var time = nowHour+":"+nowMt+str;
		if(sendId==$("#userid").val()){
		var temp = 	'<li class="msg-left"><div class="msg-left-sub">'
			temp += '<img src="./resources/images/man03.png">'
			temp += '<div class="msg-desc">'+content+'</div>'
			temp += '<small>'+time+'</small></div></li>';
		
		$("#chatcontent").append(temp);}
		else {
			var temp = 	'<li class="msg-right"><div class="msg-left-sub">'
				temp += '<img src="./resources/images/man04.png">'
				temp += '<div class="msg-desc">'+content+'</div>'
				temp += '<small>'+time+'</small></div></li>';
		
		$("#chatcontent").append(temp);}
	/*	*/
		/*// 채팅창의 heigth를 할당
		var chatAreaHeight = $("#chatArea").height();

		// 쌓인 메세지의 height에서 채팅창의 height를 뺀다
		// 이를 이용해서 바로 밑에서 스크롤바의 상단여백을 설정한다
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;

		.scrollTop(int) : Set the current vertical position of the scroll bar
		                     for each of the set of matched elements.
		// .scrollTop(int) : 파라미터로 들어간 px 만큼 top에 공백을 둔 채
		//                   스크롤바를 위치시킨다
		$("#chatArea").scrollTop(maxScroll);*/
		/*document.body.scrollTop = document.body.scrollHeight;
		*/
		/*$("#scroll").scrollTop($("#scroll").scrollHeight);*/

	}
	
	function send() {
		
		  message = {};
		  message.content = $("#message").val();
		  if(message.content.length==0){
			  return;
		  }
	  	  message.messageSender = $("#userid").val();   
	  	  
	  	  sock.send(JSON.stringify(message));
	      $("#message").val("");

	}

    
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt) {
		var data = evt.data;
		//메세지 저장할경우
		if(data.match(/jsonMessage::::/)){
			location.href="messageSave?data="+encodeURI(data);
			sock.close();
			return;
		}else if(data.match(/socketClose::::/)){
			sock.close();
			return;
		}
		var message=JSON.parse(data);
	    appendMessage(message.content, message.messageSender);
	}
	
	function onOpen(evt) {
		
		alert("연결됨");

		roomName = $("#roomName").val();
	/*	if(index>1){
		window.open("chat",'newWindow', 'width=1200, height=800');}*/
		sock.send("ROOMNUM::::"+roomName+"::::userid::::"+$("#userid").val());
		
	}
	function onClose(evt) {
		alert("연결끊김");
	}

	$(document).ready(function() {
		$('#message').keypress(function(event){

			var keycode = (event.keyCode ? event.keyCode : event.which);
			//keypress.event.keyCode 는 유저가 입력한 정해진 keycode값을 가져온다
			//keycode값을 가져올때 event.keCode는 IE환경(인터넷익스플로러환경)에서 사용가능
			//event.which는 비IE환경(firefox등)에서 사용가능
			 if(keycode == '13'){ // 엔터 키보드가 13
				 
				 send(); 
	            }
			////엔터키 입력하면 send()함수 호출하는 로직
			 event.stopPropagation(); /// 이벤트 발생 범위 한정하는 코드 
			//<ul><li><div onclick="">이 있으면 div만 onclick 이벤트가 실행되는게아니라
			//부모도 전부 이벤트가 실행되는데....
			////event.stopPropagation()는 이벤트의 범위를 나자신에게만 한정하는거야.
        });
        $('#sendBtn').click(function() { send(); });
        $('#enterBtn').click(function() { connect(); });
        $('#exitBtn').click(function() { disconnect(); });
	});
	
