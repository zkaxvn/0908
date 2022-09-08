<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.css">
<!--content css-->
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/admin.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/adminCommon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/comn_layout.css'/>">
<!-- google material-icons -->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">

<!-- ajax -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.css">

<!-- js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>
<script src="resources/common/js/common.js"></script>


<!-- ajax -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>


<title>프로 메인</title>
<script>
$(function() {
	//아이디
	// let accountCheck = RegExp(/^[a-zA-Z0-9]*$/);
	$("#regiUserId").on("keyup", function() {
		var valueLen = $(this).val().length; // 입력 값 갯수
	     if (valueLen<4) {
			$('#iMessage').html('~~ id는 4글자 이상 입력 하세요 ~~');
			$('#regiUserid').focus();
			return false;
		}else{
			$('#iMessage').html('4글자이상임');
		}
	});
	
	var pwCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,24}$/);
	$("#regiUserPw").each(function(){
        $("#regiUserPw").on("keyup", function () {
            let valueLen = $(this).val().length; // 입력 값 갯수
            if ($(this).val() === "" || !pwCheck.test($("#regiUserPw").val())) {
                $(this).parents(".input-box").find(".form-checker").remove();
                $(this).parents(".input-box").append("<div class=\"form-checker wrong c-red\">비밀번호를 제대로 입력해주세요.</div>");
                if($(this).val().length >= 17){
                    $(this).val($(this).val().substr(0, valueLen - 1));
                }
            } else if ($(this).val().length >= 17) {
                $(this).val($(this).val().substr(0, valueLen - 1));
            } else {
                $(this).parents(".input-box").find(".form-checker").remove();
            }

            if ($(this).val() === "") {
                $(this).parents(".input-box").find(".form-checker").remove();
            }// 값이 비었을 때 체크 없애기
        });
        $("#regiUserPw").on("keypress", function () {
            let valueLen = $(this).val().length; // 입력 값 갯수
            if ($(this).val() === "" || !pwCheck.test($("#regiUserPw").val())) {
                $(this).parents(".input-box").find(".form-checker").remove();
                $(this).parents(".input-box").append("<div class=\"form-checker wrong c-red\">비밀번호를 제대로 입력해주세요.</div>");
                if($(this).val().length >= 17){
                    $(this).val($(this).val().substr(0, valueLen - 1));
                }
            } else if ($(this).val().length >= 17) {
                $(this).val($(this).val().substr(0, valueLen - 1));
            } else {
                $(this).parents(".input-box").find(".form-checker").remove();
            }

            if ($(this).val() === "") {
                $(this).parents(".input-box").find(".form-checker").remove();
            }// 값이 비었을 때 체크 없애기
    });
    });
    $("#regiUserPwConfirm").each(function(){
        $("#regiUserPwConfirm").on("keyup", function () {
            let valueLen = $(this).val().length; // 입력 값 갯수
            if ($(this).val() !== $("#regiUserPw").val()) {
                $(this).parents(".input-box").find(".form-checker").remove();
                $(this).parents(".input-box").append("<div class=\"form-checker wrong c-red\">비밀번호가 맞지 않습니다.</div>");
                if($(this).val().length >= 17){
                    $(this).val($(this).val().substr(0, valueLen - 1));
                }
            } else {
                $(this).parents(".input-box").find(".form-checker").remove();
            }

            if ($(this).val() === "") {
                $(this).parents(".input-box").find(".form-checker").remove();
            }// 값이 비었을 때 체크 없애기
        });
        $("#regiUserPwConfirm").on("keypress", function () {
            let valueLen = $(this).val().length; // 입력 값 갯수
            if ($(this).val() !== $("#regiUserPw").val()) {
                $(this).parents(".input-box").find(".form-checker").remove();
                $(this).parents(".input-box").append("<div class=\"form-checker wrong c-red\">비밀번호가 맞지 않습니다.</div>");
                if($(this).val().length >= 17){
                    $(this).val($(this).val().substr(0, valueLen - 1));
                }
            } else {
                $(this).parents(".input-box").find(".form-checker").remove();
            }

            if ($(this).val() === "") {
                $(this).parents(".input-box").find(".form-checker").remove();
            }// 값이 비었을 때 체크 없애기
        });
    });
		/*
		if($(this).val() === "" || !accountCheck.test($("regiUserId").val())){
			$(this).parents(".input-box").find(".form-checker").remove();
			$(this).parents(".input-box").append("<div class=\"form-checker wrong c-red\">아이디를 제대로 입력해주세요. </div>");
		} else if ($(this).val().length >= 17) {
			$(this).val($(this).val().substr(0, valueLen-1));
		} else {
			$(this).parents(".input-box").find(".form-checker").remove();
		}
		
		if($(this).val() === ""){
			$(this).parents(".input-box").find(".form-checker").remove();
		} // 값이 비었을 때 체크 없애기
	});
	let pwCheck = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8-24}$/);
	$("#regiUserPw").on("keyup", function(){
		if($(this).val() === "" || !pwCheck.test($("#regiUserPw").val())) {
			$(this).parents(".input-box").find(".form-checker").remove();
			$(this).parents(".input-box").append("<div class = \"form-checker wrong c-red\">비밀번호를 제대로 입력해주세요.</div>");
		} else if ($(this).val().length >= 17){
			$(this).val($(this).val().substr(0,valueLen-1));
		} else {
			$(this).parents(".input-box").find(".form-checker").remove();
		} // 값이 비었을 때 체크 없애기
	}
	$("#regiUserPwConfirm").on("keyup", function(){
		 if($(this).val() !== $("regiUserPw").val()){
			 $(this).parents(".input-box").find(".form-checker").remove();
			 $(this).parents(".input-box").append("<div class= \"form-checker wrong c-red\">비밀번호가 맞지 않습니다.</div>");
		 } else {
			 $(this).parents(".input-box").find(".form-checker").remove();
		 }//값이 비었을 때 체크 없애기
	});
	*/
});
function idCheck(){
/* 	var idVal = $('#regiUserId').val(); // id= "" 동일 
	if (idVal.length<4) {
		$('#iMessage').html('~~ id는 4글자 이상 입력 하세요 ~~');
		$('#regiUserid').focus();
		return false;
	} else if (idVal.replace(/[a-z.0-9]/gi,'').length > 0){
		$('#iMessage').html(' ~~ id는 영문자, 숫자 로만 입력 하세요 ~~');
		$('#regiUserid').focuse();
		iCheck =false;
	} else {
		$('#iMessage').html('');
		return true;
	} */
	
	var idVal = $("#regiUserId").val();
	if (idVal == "") {
		alert ("아이디를 입력해주세요.");
		return false;
	}

	
	<!-- 
	//var RegExp = /^[a-zA-Z0-9]{6,16}$/; //추가
	var idVal = $("#regiUserId").val(); // id ="" 동일
	
	if (idVal == '') {
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	/*
	// 추가
	if(!RegExp.test(idVal)){
		alert("6~16자, 영문, 숫자로 입력해주세요.");
		return false;
	}
	*/
	-->
	
	
	$.ajax({
		url : "idCheck",
		type : 'get',
		dataType : "json",
		data : {
			id : idVal
		},
		success: function(data) {
			if(data){
				$("#idZone").append("<div class=\"form-checker c-black\"> 사용가능한 아이디입니다.</div>");
				$("idCheckVal").val("true");	
			} else {
				$("#idZone").append("<div class=\"form-checker wrong c-red\">중복된 아이디 입니다. 다시 입력해주세요.</div>");
			}
		},
		error: function(){
			alert('데이터를 가져올 수 없습니다.');
		}
	});
}

function pwCheck(){
	var password = $('#regiUserPw').val();
	var pLength = password.length;
	if (pLength<4) {
		$('#pMessage').html('~~ password는 4글자 이상 입력 하세요 ~~');
		$('#regiUserPw').focus();
		return false;
	} else if (password.replace(/[!-*]/gi,'').length >= pLength) {
		// ^ 특정문자를 제거한 길이가 비밀번호길이보다 같거나 길 때 
		$('#pMessage').html('~~ password는 특수문자를 반드시 1개 이상 입력 하세요 ~~');
		$('#regiUserPw').focus();
		return false;
	} else if (password.replace(/[0-9.!-*]/gi,'').length>0){
		$('#pMessage').html('~~ password는 숫자와 특수문자 만 입력 하세요 ~~');
		$('#regiUserPw').focus();
		return false;
	} else {
		$('#pMessage').html('');
		return true;
	}
}// pwCheck



</script>

</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">회원가입 페이지</h1>
				</div>
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">회원가입</div>
					<div class="panel-body">
						<form action="join" method="POST">
							<div class="input-box btnIn" id="idZone">
								<h4>아이디 *</h4>
								<label for="regiUserId"> 
								<input type="text" id="regiUserId" name="memberId" placeholder="6~16자, 영문, 숫자를 입력해주세요."> 
								<br>
								<span id="iMessage" style="color: red"></span>
								<input type="hidden" id="idCheckVal" value="false">
									<button type="button" class="btn line-btn" onclick="idCheck();">중복확인</button>
								</label>
							</div>
							
							<div class="input-box">
								<h4> 비밀번호 *</h4>
								<label for="regiUserPw">
									<input type="password" id="regiUserPw" name="memberPwd" placeholder="6~16자, 영문, 숫자, 특수문자를 입력해주세요."> 
								</label>
								<div class="form-checker wrong c-red">비밀번호를 제대로 입력해주요.</div>
								<!--  <span class="final_pw_ck">비밀번호 입력해주세요.</span> -->
							</div>
							<div class="input-box">
								<h4> 비밀번호 확인*</h4>
								<label for="regiUserPwConfirm">
									<input type="password" id="regiUserPwConfirm" placeholder="비밀번호를 다시 한 번 입력해 주세요."> 
								</label>
								<div class="form-checker wrong c-red">비밀번호가 맞지 않습니다.</div>
								<!--  <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span> -->
							</div>
							
							<!--  
							<div class="input-box btnIn" id="pwZone">
								<h4>비밀번호 *</h4>
								<label for="regiUserPw"> 
								<input type="text" id="regiUserPw" name="memberPw" placeholder="6~16자, 영문, 숫자를 입력해주세요."> 
								<input type="hidden" id="pwCheckVal" value="false">
									
								</label>
								
								<h4>비밀번호 확인 *</h4>
								<label for="regiUserPw"> 
								<input type="text" id="regiUserPw" name="memberPw" placeholder="6~16자, 영문, 숫자를 입력해주세요."> 
								<input type="hidden" id="pwCheckVal" value="false">
									<button type="button" class="btn line-btn" onclick="pwCheck();">비밀번호 확인</button>
								</label>
							</div>
							-->
							
							<!--  
							<div class="content_Box post_Box">
								<label for="content" style="width: 40px;">비밀번호</label> <input
									type="text" name="memberPw" required="required">
							</div>
							-->
							<div class="content_Box post_Box">
								<label for="content" style="width: 40px;">이름</label> <input
									type="text" name="memberName" required="required" >
							</div>

							<div class="btn_Box">
								<a href="boardList" class="delet_btn">취소</a> <input
									type="submit" class="ok_accept_btn" value="저장">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>