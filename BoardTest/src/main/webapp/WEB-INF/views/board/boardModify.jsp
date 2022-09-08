<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<title>관리자 | 공지사항 | Profession</title>
<!--common-->
<link rel="shortcut icon" type="image/x-con"
	href="<c:url value='/resources/common/imgs/pro_ic.ico'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/adminCommon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/comn_layout.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/XEIcon-2.2.0/xeicon.min.css'/>">
<!--font 스타일-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com"
	crossorigin="crossorigin">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">


<!--content css-->
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/admin.css'/>">

<!--jquery cdn-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--content script-->
<script src="<c:url value='/resources/common/js/admin.js'/>"></script>
<script>
	$(function() {
		//왼쪽 서브메뉴 현재 위치 
		$("#Snav12").addClass('menu_active');
	});
</script>

<!-- alert -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(function(){
		var responseMessage = "<c:out value="${msg}"/>";
		if (responseMessage != ""){
			alert(responseMessage)
		}
	})

</script>
<!--  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(function() {
	//아이디
	// let accountCheck = RegExp(/^[a-zA-Z0-9]*$/);
	$("#contentDiv").on("click", function() {
		alert("게시물이 수정되었습니다.");

	});
	
});
</script>
-->
</head>
<!-- 
<h3>수정페이지</h3>
<h2>페이지 보낼때는 noticeSeq 설정 안해줘도 알아서 가는구낭</h2>
<h2>밑에다가 데이터 뿌려줄 때만 noticeSeq 필요하구낭</h2>
<h2>왜냐하면 저 url(boardModifyForm?noticeSeq=3)은 boardDetail 에서 정해준거라 그래</h2>
<h2>내 느낌상 if문을 넣어주면 될거 같긴 한데 꼬이면 골치아프니까 원래 하던대로 하련다</h2>
 -->
<body>

	<!--메인 대시보드-->
	<div class="admin-ui-main2">
		<h2 class="admin-main-title">공지 사항</h2>
		<form action="boardModify" method="POST">
			<div class="head_Box post_Box">
				<input type="hidden" name="noticeSeq" value="${detail.notice_seq}"
					readonly> <label for="headline" style="width: 40px;">제목</label>
				<input type="text" id="headline" name="noticeTitle"
					value="${detail.notice_title}">
			</div>
			<div class="content_Box post_Box">
				<label for="content" style="width: 40px;">내용</label>
				<textarea id="content" name="noticeCont" required>${detail.notice_cont}</textarea>
			</div>
			
			<div class="btn_Box">
				<%-- <a href="boardDetail?noticeSeq=${detail.notice_seq}" class="delet_btn">취소</a> --%> 
				<a href="javascript:history.back();" class="delet_btn">취소</a> 
				<input type="submit" id="contentDiv" class="ok_accept_btn" value="수정">
			</div>
		</form>
	</div>
	</div>
	</div>

</body>
</html>