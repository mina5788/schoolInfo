
	function wishList(){

		var loginId =$('#loginId').val();
		alert(loginId);
		var schoolnum =$('#schoolnum').val();
		if(loginId=="true"){
		$.ajax({
			url:"wishList",
			type:"get",
			data:{"schoolnum":schoolnum},
			success:function(data){
				alert("気になるリストに追加されました。");
			},
			error:function(){
				alert("失敗");
			}
		});
		}
		else{
			location.href="loginForm?wishList=true";
		}
		
	}


