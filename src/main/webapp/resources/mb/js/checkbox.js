$(function(){
	$("#checkAll").on("click",function(){
		if($("#checkAll").prop("checked")){ $("input[name='service']").prop("checked",true);
		} else {
			$("input[name='service']").prop("checked",false);
		}
	});
	var mpet = [];
	$(".petname").on("click",function(){
		var img = $(this).data("imgsrc");
		if($(this).is(":checked")==true){			
			$("#photo").attr("src","/upload/"+img);			
		}
	})

})



