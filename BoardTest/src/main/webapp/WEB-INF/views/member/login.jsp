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
	function idCheck() {
		var idVal = $("#regiUserId").val(); // id ="" 동일

		if (idVal == '') {
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({
					url : "idCheck",
					type : 'get',
					dataType : "json",
					data : {
						id : idVal
					},
					success : function(data) {
						if (data) {
							$("#idZone")
									.append(
											"<div class=\"form-checker c-black\"> 사용가능한 아이디입니다.</div>");
							$("idCheckVal").val("true");
						} else {
							$("#idZone")
									.append(
											"<div class=\"form-checker wrong c-red\">중복된 아이디 입니다. 다시 입력해주세요.</div>");
						}
					},
					error : function() {
						alert('데이터를 가져올 수 없습니다.');
					}
				});
	}
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
						<form action="login" method="POST"> <!-- Controller 의 requestMapping -->
							<div class="content_Box post_Box">
								<label for="content" style="width: 40px;">아이디</label> <input
									type="text" name="memberId" required="required">
							</div>
							<div class="content_Box post_Box">
								<label for="content" style="width: 40px;">비밀번호</label> <input
									type="text" name="memberPwd" required="required">
							</div>
							

							<div class="btn_Box">
								<a href="boardList" class="delet_btn">취소</a> <input
									type="submit" class="ok_accept_btn" value="로그인">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>