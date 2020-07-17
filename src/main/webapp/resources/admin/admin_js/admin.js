$(function(){
	$(".accept").on("click",function(){
		var id = $(this).attr("id");
		location.href="/admin/petaccept?id="+id;
	})
	
	$(".cencel").on("click",function(){
		var id = $(this).attr("id");
		location.href="/admin/cencel?id="+id;
	})
	
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
	
	$('.no').on("click",function(){
		$("#msg_title").val("");
		$(".note-editable").html("");
	})
	
	$('.message').on("click",function(){
		var id = $(this).attr("id");
		$("#summernote").attr('class',id);
	})
	
	$(".stop_btn").on("click",function(){
		$("#s_stop_day").val($(this).parent().children('.state').val());
		$("#stop_id").val($(this).parent().parent().children('.id').html());
	})
	
	$("#admin_change").on("submit",function(){
		if(confirm('변경하시겠습니까?')){
			return true;
		}
		return false;
	})	
	$(".messagesend").on("click",function(){
	
		var id = $("#summernote").attr("class");	
		var queryString = $("form[name=message_form]").serialize();
		
		console.log(id);
		$.ajax({
			type: "GET",
			url: "/admin/message?msg_reciever="+ id,
			data : queryString,
			cache: false,
			dataType : "json",
			processData : false,
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('성공적으로 메세지를 전송하였습니다.');
					location.reload();
				}
				else{
					alert('메세지 전송에 실패했습니다.');
				}		
			}	
		})
	})
	
	
	$(".stopsend").on("click",function(){
		var queryString = $("form[name=stop_info]").serialize();
		$.ajax({
			type: "GET",
			url: "/admin/mem_stop",
			cache: false,
			data : queryString,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('해당 아이디를 상태를 변경시켰습니다..');
					location.reload();
				}
				else{
					alert('상태를 시키는 것을 실패했습니다.');
				}		
			}	
		})
	})
	//memboard 
	$(".mem_accept").on("click",function(){
		var seq = $(this).attr("id");
		var writer = $(this).parent().parent().children('.writer').html();
		var booker = $(this).parent().parent().children('.booker').html();
		var point = $(this).parent().parent().children('.point').html();
		$.ajax({
			type: "GET",
			url:"/admin/accept_memboard?mb_seq="+seq+"&mb_writer="+writer+"&mb_booker="+booker+"&mb_point="+point,
			cache: false,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('성공적으로 예약을 진행하였습니다.');
					location.reload();
				}
				else{
					alert('예약을 진행하는 것을 실패하였습니다.');
				}		
			}	
		})
	})
	
	
	$(".mem_cancel").on("click",function(){
		var seq = $(this).parent().parent().children('.p_seq').html();
		var booker = $(this).parent().parent().children('.booker').html();
		var point = $(this).parent().parent().children('.point').html();
		$.ajax({
			type: "GET",
			url:"/admin/cancel_memboard?mb_seq="+seq+"&mb_booker="+booker+"&mb_point="+point,
			cache: false,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('성공적으로 작업이 완료 되었습니다..');
					location.reload();
				}
				else{
					alert('작업이 실패하였습니다.');
				}		
			}	
		})
	})
	
	
	//petboard
	$(".pet_accept").on("click",function(){
		var wait_seq = $(this).attr("id");
		$.ajax({
			type: "GET",
			url:"/admin/accept_petboard?wait_seq="+wait_seq,
			cache: false,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('성공적으로 예약을 진행하였습니다.');
					location.reload();
				}
				else{
					alert('예약을 진행하는 것을 실패하였습니다.');
				}		
			}	
		})
	})
	
	$(".pet_cancel").on("click",function(){
		var wait_seq = $(this).attr("id");
		$.ajax({
			type: "GET",
			url:"/admin/cancel_patsitter?wait_seq="+wait_seq,
			cache: false,
			dataType : "json",
			success: function(data){
				check = data.re;
				if(check > 0 ){
					alert('성공적으로 작업이 완료 되었습니다..');
					location.reload();
				}
				else{
					alert('작업이 실패하였습니다.');
				}		
			}	
		})
	})
})