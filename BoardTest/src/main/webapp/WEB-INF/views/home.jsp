<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P><a href="confirm">파일확인용</a></P>
<P><a href="boardList">게시판</a></P>
<P><a href="joinForm">회원가입</a></P> 
<!-- <P><a href="loginForm">로그인</a></P>  -->
<!-- href = "" : Controller RequestMapping 주소 -->
<!-- 로그인 안했을 때 -->
    <c:if test="${loginUserMap == null}">
        <div class="login-wrap noLogin on">
            <div class="inner-wrap">
                <div class="profile">
                    <div class="profile-wrap">
                        <div class="icon"><img src="resources/common/imgs/icon_blank_profile.png" alt=""></div>
                        <div class="user-info">
                            <p class="profile-name">
                                <span>로그인 해주세요.</span>
                            </p>
                            <a href="loginForm"><span>로그인</span></a>
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </c:if>
<!-- 로그인 했을 때 -->
	<c:if test="${loginUserMap != null}">
        <div class="login-wrap yesLogin on">
            <div class="inner-wrap">
                <div class="profile">
                    <div class="profile-wrap">
                        <!-- <div class="icon"><img src="resources/common/imgs/icon_blank_profile.png" alt=""></div>  -->
                        <div class="user-info">
                            <p class="profile-name">${loginUserMap.member_id} 회원님</p>
                            <span>즐거운 하루되세요!</span>
                        </div>
                        <a href="logout" class="btn line-btn round-btn"><span>로그아웃</span></a>
                    </div>
                </div>
            </div>
        </div>
            
     </c:if>
          
                <!--  
                  <div class="inner-wrap">
                <c:if test="${loginUserMap.member_gubun == 'U'}">
                <div class="menu-wrap">
                    <ul>
                        <li><a href="#">신청 내역</a></li>
                        <li><a href="mypageProfile">마이페이지</a></li>
                        <li><a href="#">프로 상담 글</a></li>
                        <li><a href="#">채팅 신청</a></li>
                        <li><a href="#">관심 목록</a></li>
                    </ul>
                </div>
                <div class="menu-wrap">
                    <ul>
                        <li><a href="#">결제내역</a></li>
                        <li><a href="#">나의 후기</a></li>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자주 묻는 질문</a></li>
                    </ul>
                </div>
              	 </c:if>
              	 -->
                <!--  
                <c:if test="${loginUserMap.member_gubun == 'P'}">
                <div class="menu-wrap">
                    <ul>
                        <li><a href="#" class="icon"><img src="resources/common/imgs/icon_request.svg" alt=""> 받은 의뢰</a></li>
                        <li><a href="#" class="icon"><img src="resources/common/imgs/icon_card.svg" alt=""> 상담 내역</a></li>
                        <li><a href="#" class="icon"><img src="resources/common/imgs/icon_cancel.svg" alt=""> 의뢰 취소</a></li>
                    </ul>
                </div>
                <div class="menu-wrap">
                    <ul>
                        <li><a href="expertMypage">내 정보</a></li>
                        <li><a href="#">전문가 활동 신청</a></li>
                        <li><a href="#">서비스 요금</a></li>
                        <li><a href="#">채팅 상담</a></li>
                        <li><a href="#">상담 후기</a></li>
                        <li><a href="#">나의 문의</a></li>
                        <li><a href="#">해결 사례함</a></li>
                        <li><a href="#">프로 상담 글</a></li>
                        <li><a href="#">상담 가능 일정</a></li>
                    </ul>
                </div>
 		</c:if>
 		-->
</body>
</html>
