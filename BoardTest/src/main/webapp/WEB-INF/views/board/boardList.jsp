<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	
<!--jquery cdn-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
<!-- loadash  -->

<!-- google material-icons -->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">

<!-- js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>
<title>프로 메인</title>
</head>
<body>

	<!-- 컨텐츠 -->
	<div class="contents-wrap">
		<div class="inner-wrap">
			<div class="admin-ui-main">
				<h2 class="admin-main-title">공지 사항</h2>
				
				<button type="button" class="del_btn">삭제</button>
				<table class="admin-table">
					<thead>
						<tr>
							<th style="width: 7%;"><input type="checkbox" id="allCheck"
								name="allCheck"> <label for="allCheck"></label></th>
							<th style="width: 9%; text-align: left;">No</th>
							<th class="wid260">제목</th>
							<th style="width: 20%;">아이디</th>
							<th style="width: 20%;">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="list">
							<tr onclick="boardDetail(${list.notice_seq},event);">
								<td><input type='checkbox' id="seq${list.notice_seq}" name="noticeSeq" class="check" data-consult-seq="${list.notice_seq}"> 
								<label for="seq${list.notice_seq}"></label></td>
								<td class="number">${list.notice_seq}</td>
								<td class="title ellipsis"><a
									href="boardDetail?noticeSeq=${list.notice_seq}">${list.notice_title}&nbsp;</a>
								</td>
								<td class="account-id">${list.member_id}</td>
								<td class="date">${list.regdt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${loginUserMap.member_id != null}">
				<form action="boardList" method="get">
					<div class="writ_btnbox">
						<a href="boardWriteForm">새 게시글 쓰기</a>
						<!--  <a href="noticeDetail?type=new">새 게시글 쓰기</a>-->
					</div>
				</form>
				</c:if>
					<!-- ajax 없이도 가능하긴 함 -->
				<form>
					<div class="srh-box">
						<select name="select" id="searchOption">
							<option value="id"  <c:if test="${fn:indexOf(select,'id')!=-1}">selected</c:if>>아이디</option>
							<option value="title" <c:if test="${fn:indexOf(select,'title')!=-1}">selected</c:if>>제목</option>
						</select> 
						<input type="text" name="keyWord" id="keyWord" value="${keyWord}">
						<button class="search_btn">검색</button>
					</div>
				</form>
				<div class="pagenation">
					<ul>
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${currentPage != 1  && startPage !=1 }">
						<li><a href="boardList?page=1&keyWord=${keyWord}&select=${select}"><<</a></li>
						<c:choose>
						<c:when test="${startPage !=1}">
							<li><a
								href="boardList?page=${startPage-1}&keyWord=${keyWord}&select=${select}">&lt;</a></li>
						</c:when>
						
						</c:choose>
						</c:if>
						<!-- 페이지 번호 -->
						<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
							<c:if test="${p eq currentPage }">
								<li class="pageon">${p}</li>
							</c:if>
							<c:if test="${p ne currentPage }">
								<c:url var="boardList"
									value="boardList?keyWord=${keyWord}&select=${select}">
									<c:param name="page" value="${p}" />
								</c:url>
								<li><a href="${boardList}">${p}</a></li>
							</c:if>
						</c:forEach>
						<!-- 다음 블럭으로 이동 -->
						<c:if test="${currentPage ne maxPage && maxPage > 1 && endPage+3 < maxPage}">
							<li><a
								href="boardList?page=${endPage+1}&keyWord=${keyWord}&select=${select}">&gt;</a>
								</li>
						<li><a href="boardList?page=${maxPage}&keyWord=${keyWord}&select=${select}">>></a></li>		
						</c:if>
						<c:if test="${endPage + 3 >= maxPage && currentPage ne maxPage && endPage ne maxPage}">
						<li><a href="boardList?page=${endPage+1}&keyWord=${keyWord}&select=${select}">&gt;</a></li>
						<li><a href="boardList?page=${maxPage}&keyWord=${keyWord}&select=${select}">>></a></li>			
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->
<script>
$(function() {
	var msg = "${msg}"
	if(msg != ""){
		alert(msg);
	}
});

//boardDetail
function boardDetail(notice_seq, event){
	if(event.target.tagName != "LABEL" && event.target.type != "checkbox") {
		location.href='boardDetail?noticeSeq='+notice_seq;
	}
}

//삭제
 $(".del_btn").click(function(){
	var info = [];
	_.forEach($(".admin-ui-main .check:checked"), function(obj) {
		info.push({
			"noticeSeq" : $(obj).data("consult-seq")
		});
	});
	if (info.length == 0){
		alert("공지사항을 선택해주세요.");
	} else {
		if (confirm("정말 삭제하시겠습니까?") == true){
			for(var i=0; i < info.length; i++){
				$.ajax({
					url : "deleteNotice",
					data : {
						noticeSeq: info[i].noticeSeq
					},
					async : false,
					dataType : "json",
					success: function(data) {
						if(i == (info.length-1)) {
							if(data.result) {
								alert("삭제되었습니다.")
								location.reload();
							} else {
								alert("삭제 실패!");
							}
						}
					},
					error: function() {
						alert("서버 오류!");
					}
				});
			}
		} else {
			return false;
		}
	}
})
/*
//삭제
$(".del_btn").click(function(){ // $('.클래스명')
	var info = [];
	$(".admin-ui-main .check:checked").each(function(obj){
		info.push({
			"notice_seq": $(obj).data("notice-seq")
		});
	});
	if (info.length == 0) {
		alert("공지사항을 선택해주세요.");
	} else {
		if (confirm("정말 삭제하시겠습니까?") == true){ 
			//for(var i=0;i<info.length;i++){
				
				/*$.ajax({
					url: "boardDelete",
					data: {
						notice_seq: info[i].notice_seq
					},
					async: false,
					dataType: "json",
					success: function(data) {
						if(i == (info.length-1)){
							if (data.result) {
								alert("삭제되었습니다.")
								location.reload();
							} else {
								alert("삭제 실패!!");
							}
						}
					},
					error: function() {
						alert("서버 오류!!");
					}
				});
			//}
		}else{
			return false;
		}
	}
});
*/
/*
function deleteProc() {
	var info = [];
	_.forEach($(".admin-ui-main .check:checked"), function(obj) {
		info.push({
			"notice_seq": $(obj).data("notice-seq")
		});
	});
	if (info.length == 0) {
		alert("공지사항을 선택해주세요.");
	} else {
		if (confirm("정말 삭제하시겠습니까?") == true){ 
			for(var i=0;i<info.length;i++){
				$.ajax({
					url: "boardDelete",
					data: {
						notice_seq: info[i].notice_seq
					},
					async: false,
					dataType: "json",
					success: function(data) {
						if(i == (info.length-1)){
							if (data.result) {
								alert("삭제되었습니다.")
								location.reload();
							} else {
								alert("삭제 실패!!");
							}
						}
					},
					error: function() {
						alert("서버 오류!!");
					}
				});
			}
		}else{
			return false;
		}
	}
}*/
</script>
</body>
</html>