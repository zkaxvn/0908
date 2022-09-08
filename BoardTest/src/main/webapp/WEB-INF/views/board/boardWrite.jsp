<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<!-- js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>
<script src="resources/common/js/common.js"></script>

<!-- alert -->
<!--  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(function(){
		var responseMessage = "<c:out value="${msg}"/>";
		if (responseMessage != ""){
			alert(responseMessage);
		}
	});
</script>
<script>
$(function() {

	$("#contentDiv").on("click", function() {
		alert("게시물이 등록되었습니다.");

	});
	
});
</script>
-->
<title>프로 메인</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">공지사항 관리</h1>
				</div>
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">게시물 작성</div>
					<div class="panel-body">
						<form action="boardWrite" method="POST">
							<div class="head_Box post_Box">
								<label for="headline" style="width: 40px;">제목</label> <input
									type="text" id="headline" name="noticeTitle">
							</div>
							<div class="content_Box post_Box">
								<label for="content" style="width: 40px;">내용</label>
								<textarea id="content" name="noticeCont" required></textarea>
							</div>
							<div class="btn_Box">
								<a href="boardList" class="delet_btn">취소</a> <input
									type="submit" id="contentDiv" class="ok_accept_btn" value="저장">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</html>