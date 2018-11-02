
$(function(){
setInterval(function(){
	$.ajax({
		url:"getDday",
		type:"get",
		success:function(data){
	
		 $("#ddays").html(data);
		},
		error:function(){
		
		}
});
}, 1000);
});