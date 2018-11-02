
	function login(){

		var userid =$('#userid').val();
		alert(userid);
		$('#tempUserid').val(userid);
		var userpwd =$('#userpwd').val();
		
		$.ajax({
			url:"loginAjax",
			type:"get",
			data:{"userid":userid,
				  "userpwd":userpwd},
			success:function(data){
			
				if(data=="true"){
				/*	$("#loginDiv").remove();*/
					var temp='';
					temp += '<div class="clear2"><br><h4 style="color: white">WELCOME</h4><h3>'
					temp += $('#tempUserid').val();
					temp += '</h3></div><div class="clear"><span><button onclick="logout()" type="button" class="fleft">ログアウト</button></span></div>'
						
					$("#logoutDiv").html(temp);
					$("#loginDiv").html(temp);
				
				}else{
					alert("該当のユーザーは存在しません。");
					var userid =$('#userid').val('');
					var userpwd =$('#userpwd').val('');
				}
			},
			
			error:function(){
				alert("통신실패");
			}
		});

	}
	
	function logout(){
	
		$.ajax({
			url:"logout",
			type:"get",
			data:{"userid":1,
				  },
			success:function(data){
		
				var temp='';
				temp += '<div class="clear2">'
				temp += 'ID:  <input type="text" name="userid" id="userid">'
				temp += 'PASSWORD:   <input type="password" name="userpwd" id="userpwd"></div>'
				temp +='<div class="clear"><a class="fleft" id="logout" href="joinForm?">新規取得</a><p class="fright"><button type="button" onclick="login()">ログイン</button></p></div>'
				$("#loginDiv").html(temp);
				$("#logoutDiv").html(temp);
			},
			
			error:function(){
				alert("통신실패");
			}
		});
	}





