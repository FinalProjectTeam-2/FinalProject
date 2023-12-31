function dbSubmit(){
	if(!confirm('DB로 전송하시겠습니까?')){
		return false;
    }      	 
}


$(function(){

//#####################################예약 관리 JS########################################
	
	$("#manageReservationUpdateBtn").on("click", function(){
		if(!confirm('예약을 수정 하시겠습니까?')){
			return false;
		}
	});

//#####################################상품 관리 JS########################################

	$(".manageProductDelete").on("click", function() {
	
		let productno = $(this).attr("data-no");	
		let params = "productno=" + productno	
		let result = confirm("상품을 삭제 하시겠습니까?");

		if(result) {			
			$.ajax({		
				url: "manageFestivalProductDeleteProcess.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
					
				document.location.href = document.location.href;
				alert("삭제 되었습니다.");		
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
		
	});

//#####################################쿠폰 JS########################################

	
	$(document).on("click", ".manageMemberCouponUpdate", function() {
		
		let cnt = $(this).attr("data-no");
		let membercouponno = $("#memberCouponId_" + cnt).val();
		let couponno = $("#couponno_" + cnt).val();
		let couponopendate = $("#couponopendate_" + cnt).val();
		let couponclosedate = $("#couponclosedate_" + cnt).val();
		
		console.log("membercouponno = " + membercouponno);
		console.log("couponno = " + couponno);
		console.log("couponopendate = " + couponopendate);
		console.log("couponclosedate = " + couponclosedate);
		
		
		let result = confirm("쿠폰을 수정 하시겠습니까?");
		
		let params = {
			        "membercouponno": membercouponno,
			        "couponno": couponno,
			        "couponopendate": couponopendate,
			        "couponclosedate": couponclosedate
			  	  	};
		
		
		if(result) {			
			$.ajax({		
				url: "manageMemberCouponUpdate.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
					
				document.location.href = document.location.href;
				alert("수정 되었습니다.");		
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
		
	});
	

	$(document).on("click", "#manageMemberCouponDelete", function() {
	
		let membercouponno = $(this).attr("data-no");	
		let params = "membercouponno=" + membercouponno	
		let result = confirm("쿠폰을 삭제 하시겠습니까?");
		
	
		
		if(result) {			
			$.ajax({		
				url: "manageMemberCouponDelete.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
					
				document.location.href = document.location.href;
				alert("삭제 되었습니다.");		
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
		
	});

//#####################################매출 관리 JS########################################

	$("#dbsubmit1").on("click", dbSubmit);
	$("#dbsubmit2").on("click", dbSubmit);
	$("#dbsubmit3").on("click", dbSubmit);
	$("#dbsubmit4").on("click", dbSubmit);
	$("#dbsubmit5").on("click", dbSubmit);
	$("#dbsubmit6").on("click", dbSubmit);
	$("#dbsubmit7").on("click", dbSubmit);
	$("#dbsubmit8").on("click", dbSubmit);
	$("#dbsubmit9").on("click", dbSubmit);
	$("#dbsubmit10").on("click", dbSubmit);
	$("#dbsubmit11").on("click", dbSubmit);
	$("#dbsubmit12").on("click", dbSubmit);
	

	
	$(".dbAllDelete").off().on("click",function(){
	
		let salesNo = $(this).attr("data-salesNo");
		let params = "salesNo=" + salesNo;	
		let result = confirm("데이터를 초기화 하시겠습니까?\n다음에는 확인 부탁드려요");
		
		if(result) {			
			$.ajax({		
				url: "deleteSalesTotalPrice.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
					
				document.location.href = document.location.href;
				alert("초기화 되었습니다.");		
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
	});



//#####################################관리 페이지 ajax #####################################

	$(document).on("click", "#manageIdDelete", function() {
		let id = $(this).attr("data-id");
		let params = "id=" + id;	
		let result = confirm( id +"를 삭제 하시겠습니까?");
		if(result) {			
			$.ajax({		
				url: "deleteManageMemberProcess.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
					
				document.location.href = document.location.href;
				alert("탈퇴 되었습니다.");		
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
		
	});


	$(document).on("click", "#reservationDelete", function() {
		let reservationno = $(this).attr("data-no");
		let params = "reservationno=" + reservationno;
		let result = confirm( reservationno +"번 예약 번호를 취소하시겠습니까?");
		if(result) {
		
			let params = {reservationno: reservationno};			
			$.ajax({		
				url: "deleteManageReservation.ajax",
				type: "post",
				data: params,
				//dataType: "json",
				success: function(resData, status, xhr) { 
				
				window.open("https://admin.bootpay.co.kr/receipt?s=1|12|60", "_blank");	
				document.location.href = document.location.href;							
				
				
				},
				error: function(xhr, status, error) {
				
				alert("ajax 실패 : " + status + " - " + xhr.status);			
				}
			});		
		}
		
	});

//#####################################채팅 JS#####################################

	$("#chatBtn").on("click", function() {

		var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		
		(function(){
			var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
			s1.async=true;
			s1.src='https://embed.tawk.to/6583d14b70c9f2407f821e50/1hi5ej46i';
			s1.charset='UTF-8';
			s1.setAttribute('crossorigin','*');
			s0.parentNode.insertBefore(s1,s0);
		})();
		

	});

//#####################################회원 관리 JS#####################################

	$("#manageMemberDelete").on("click", function() {
	
		if(confirm("정말 탈퇴시키겠습니까?")){
			$("#checkForm").attr("action", "deleteManageMemberProcess");
			$("#checkForm").attr("method", "post");
			$("#checkForm").submit();
		} else {
		
			return false;
		} 
	});	
	
//#####################################이용 안내 JS#####################################

	$("#informationUseUpdateForm").on("submit", function() {
	
		let title = $("#informationUseTitle").val();
		let context = $("#informationUseContent").val();
	
		$("#informationUseContent").val($("#contenteditable").html().trim());

		if($("#informationUseTitle").val().length <= 0 ) {
			alert("제목을 입력해 주세요");
			$("#informationUseTitle").focus();
			return false;
		}
		
		if($("#informationUseContent").val().length <= 0) {
			alert("내용을 입력해 주세요");
			return false;
		}
		
	});
	
	$("#informationUseWriteForm").on("submit", function() {
	
		$("#informationUseContent").val($("#contenteditable").html().trim());		

		if($("#informationUseTitle").val().length <= 0 ) {
			alert("제목을 입력해 주세요");
			$("#informationUseTitle").focus();
			return false;
		}
		
		if($("#informationUseContent").val().length <= 0) {
			alert("내용을 입력해 주세요");
			return false;
		}

	});


	$("#informationUseDetailDelete").on("click", function() {
	
		$("#checkForm").attr("action", "informationUseDeleteProcess");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
		
	});
	
	
	$("#informationUseDetailUpdate").on("click", function() {

		$("#checkForm").attr("action", "informationUseUpdateProcess");
		$("#checkForm").submit();
		
	});

	$("#img2").off().on("change", function(){	
		
    	const fd = new FormData();
    	const file = $("#img2")[0].files[0]; 	
    	fd.append('informationUseImage',file);

    	$.ajax({

    		url : "imgUpload2.ajax",
    		data:  fd,
    		dataType : "json",
    		type : "post",
    		enctype : "multipart/form-data",
    		processData: false,
    		contentType : false,
    		success : function(resData){

    		document.execCommand('insertImage',false, "resources/img/" + resData.fileName);
    		
   		
       		$("#contenteditable img").each(function() {
				 $(this).attr("width", 600);
				 $(this).attr("height", 400);
			});
			       		
       		
    		$("#contenteditable").focus();

    	}, error : function(err){

    	}
    	});
    });

//#####################################문의 하기 JS#####################################	

	$("#inquiryWriteForm").on("submit", function() {
	
	$("#questionContent").val($("#contenteditable").html().trim());
	
		if($("#questionTitle").val().length <= 0 ) {
			alert("제목을 입력해 주세요");
			$("#qestionTitle").focus();
			return false;
		}
		
		if($("#questionContent").val().length <= 0) {
			alert("내용을 입력해 주세요");
			return false;
		}
		
	});		
	
//#####################################공지 사항 JS#####################################	
	
	$("#img").off().on("change", function(){	
		
    	const fd = new FormData();
    	const file = $("#img")[0].files[0]; 	
    	fd.append('noticeImage',file);

    	$.ajax({

    		url : "imgUpload.ajax",
    		data:  fd,
    		dataType : "json",
    		type : "post",
    		enctype : "multipart/form-data",
    		processData: false,
    		contentType : false,
    		success : function(resData){

    		document.execCommand('insertImage',false, "resources/img/" + resData.fileName);
    		
   		
       		$("#contenteditable img").each(function() {
				 $(this).attr("width", 600);
				 $(this).attr("height", 400);
			});
			       		
       		
    		$("#contenteditable").focus();

    	}, error : function(err){

    	}
    	});
    });


	$("#noticeDetailDelete").on("click", function() {
	
		$("#checkForm").attr("action", "noticeDeleteProcess");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
		
	});
	
	
	$("#noticeDetailUpdate").on("click", function() {

		$("#checkForm").attr("action", "noticeUpdateProcess");
		$("#checkForm").submit();
		
	});
	
	$("#noticeUpdateForm").on("submit", function() {
	
		let title = $("#noticeTitle").val();
		let context = $("#noticeContent").val();
	
		$("#noticeContent").val($("#contenteditable").html().trim());

		if($("#noticeTitle").val().length <= 0 ) {
			alert("제목을 입력해 주세요");
			$("#noticeTitle").focus();
			return false;
		}
		
		if($("#noticeContent").val().length <= 0) {
			alert("내용을 입력해 주세요");
			return false;
		}
		
	});
	
	$("#noticeWriteForm").on("submit", function() {
	
		$("#noticeContent").val($("#contenteditable").html().trim());		

		if($("#noticeTitle").val().length <= 0 ) {
			alert("제목을 입력해 주세요");
			$("#noticeTitle").focus();
			return false;
		}
		
		if($("#noticeContent").val().length <= 0) {
			alert("내용을 입력해 주세요");
			return false;
		}

	});
 
 	


 });