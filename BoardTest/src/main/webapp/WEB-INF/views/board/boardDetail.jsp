<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<h2>Detail Page</h2>
	<table border ="1">
		<th>정보</th>
		<th>데이터</th>
<%-- 		<tr>
			<td>작성일자</td>
			<td><fmt:formatDate value="${data.date}" pattern="yyyy-MM-dd"/>
			</td>
		</tr> --%>
		<!-- <h3>아이템 따로 설정안해줘도 되는건가?</h3> -->
		<!-- 이 디테일은 파람맵에서 받아온 디테일  --> 
		<tr>
			<td>글번호</td>
			<td>${detail.notice_seq}</td>
		</tr>
		<tr>
			<td>제목</td><td>${detail.notice_title}</td>
		</tr>
		<tr>
			<td>내용</td><td>${detail.notice_cont}</td>
		</tr>
		<tr>
			<td>작성자</td><td>${detail.member_id}</td>
		</tr>
		<tr>
			<td>작성일자</td><td>${detail.regdt}</td>
		</tr>
		
	</table>

<c:if test="${loginUserMap.member_id == detail.member_id}">
<a href="boardModifyForm?noticeSeq=${detail.notice_seq}" role = "button" class="btn btn-outline-info">수정</a>
<a href="boardDelete?noticeSeq=${detail.notice_seq}" id="contentDiv" role = "button" class="btn btn-outline-info">삭제</a>
</c:if>
</body>
</html>