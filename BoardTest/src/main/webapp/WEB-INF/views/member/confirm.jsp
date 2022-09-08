<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="resources/common/imgs/pro_ic.ico">

    <!-- css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.css">
    <link rel="stylesheet" href="resources/common/css/common.css">
    <link rel="stylesheet" href="resources/common/air-datepicker/dist/css/datepicker.min.css">

	<!-- google material-icons -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">

    <!-- js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/7.4.1/swiper-bundle.min.js"></script>
    <script src="resources/common/js/common.js"></script>
    <script src="resources/common/air-datepicker/dist/js/datepicker.min.js"></script>
    <script src="resources/common/air-datepicker/dist/js/datepicker.ko.js"></script>

    <title>프로 회원가입 안내</title>
    <script>
	function smsSend(){
		var tel = $("#regiUserPhone").val();
		if(tel.length<=0){
			alert('휴대폰번호를 입력해주세요.');
			return;
		}else{
			alert('메세지가 발송되었습니다. \n 잠시만 기다려주세요.');
		}
		$.ajax({
			url:"sendOne",
			type: 'post',
			data: {
				tel : tel
			},
			success: function(data){
				$("#regiUserCertifConfirm").val(data);
			},
			error: function(){
				alert('데이터를 가져올수 없습니다.');
			}
		});
	}
	function idCheck(){
		var RegExp = /^[a-zA-Z0-9]{6,16}$/;
		var idVal = $("#regiUserId").val();

		if(idVal == ''){
			alert("아이디를 입력해주세요.");
			return false;
		}

		if(!RegExp.test(idVal)){
			alert("6~16자, 영문, 숫자로 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"idCheck",
			type: 'get',
			dataType:"json",
			data: {
				id : idVal
			},
			success: function(data){
				if(data){
					$("#idZone").find(".form-checker").remove();
					$("#idZone").append("<div class=\"form-checker c-black\">사용 가능한 아이디입니다.</div>");
					$("#idCheckVal").val("true");
				}else{
					$("#idZone").find(".form-checker").remove();
					$("#idZone").append("<div class=\"form-checker wrong c-red\">중복된 아이디 입니다. 다시 입력해주세요.</div>");

				}
			},
			error: function(){
				alert('데이터를 가져올수 없습니다.');
			}
		});
	}
</script>
</head>
<body class="small-wrap">

<!-- //서브헤더 -->
<!-- <div class="regist-head small-wrap">
    <a href="javascript:history.back();" class="backArrow"><img src="resources/common/imgs/icon_back.png" alt=""></a>
</div> -->
<!-- 컨텐츠 -->
<div class="contents-wrap regist-info">
    <div class="inner-wrap">
        <div class="regist-form-padding-wrap">
            <!-- 전문가만 보이는 부분 -->
        	<c:if test="${userType == 'P' }">
	            <div class="progress">
	                <ul>
	                    <li class="on">01. 기본정보</li>
	                    <li></li>
	                    <li></li>
	                </ul>
	            </div>
        	</c:if>
            <!-- //전문가만 보이는 부분 -->
			<c:if test="${userType == 'U' }">
		        <form action="userSignUp" method="post">
			</c:if>
			<c:if test="${userType == 'P' }">
		        <form action="proSignUp" method="post" enctype="multipart/form-data">
			</c:if>
                <!-- 필수정보 입력 부분 -->
                <div class="form-wrap">
                    <h2>필수 정보 입력하고<br />회원가입 하세요!</h2>
                    <div class="input-box btnIn" id="idZone">
                        <h4>아이디 *</h4>
                        <label for="regiUserId">
                            <input type="text" id="regiUserId" name="memberId" placeholder="6~16자, 영문, 숫자를 입력해주세요.">
                            <input type="hidden" id="idCheckVal" value="false">
                            <button type="button" class="btn line-btn" onclick="idCheck();">중복확인</button>
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>비밀번호 *</h4>
                        <label for="regiUserPw">
                            <input type="password" id="regiUserPw" name="memberPwd" placeholder="8~16자, 영문, 숫자를 입력해주세요.">
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>비밀번호 확인 *</h4>
                        <label for="regiUserPwConfirm">
                            <input type="password" id="regiUserPwConfirm" placeholder="비밀번호를 다시 한 번 입력해 주세요">
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>이메일 *</h4>
                        <label for="regiUserEmail">
                            <input type="email" id="regiUserEmail" name="memberMail" placeholder="이메일 주소를 입력해 주세요">
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>이름</h4>
                        <label for="regiUserName">
                            <input type="text" id="regiUserName" name="memberName" placeholder="실명을 입력하세요">
                        </label>
                    </div>
                    <div class="input-box btnIn">
                        <h4>휴대폰 번호</h4>
                        <label for="regiUserPhone">
                            <input type="number" id="regiUserPhone" name="memberPhone" placeholder="'-' 구분없이 업력하세요">
                            <button type="button" class="btn send-btn" onclick="smsSend();">인증번호 전송</button>
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>인증 번호</h4>
                        <label for="regiUserCertif">
                            <input type="hidden" id="regiUserCertifConfirm" value="123">
                            <input type="number" id="regiUserCertif" placeholder="인증번호 6자리를 입력해 주세요">
                            <input type="hidden" id="phoneCheckVal" value="false">
                        </label>
                    </div>
                    <!-- 전문가만 보이는 부분 -->
					<c:if test="${userType == 'P'}">
	                    <div class="expert-carrer">
	                        <div class="input-box">
	                            <h4>경력사항</h4>
	                            <div class="carrer-wrap">
                                    <div class="date-wrap between">
                                        <span>시작 연도</span>
                                        <div class="short-date-wrap">
                                            <label for="startYear">
                                                <input type="text"  name="careerStart" id="startYear" class="date" readonly>
                                                <img src="../../../resources/common/imgs/icon_calendar.png" alt="">
                                            </label>
                                        </div>
                                        <span>종료 연도</span>
                                        <div class="short-date-wrap">
                                            <label for="endYear">
                                                <input type="text"  name="careerEnd" id="endYear" class="date" readonly>
                                                <img src="../../../resources/common/imgs/icon_calendar.png" alt="">
                                            </label>
                                        </div>
                                    </div>
		                            <label for="regiUserWork">
		                                <input type="text" id="regiUserWork" name="proCareer" placeholder="경력내용">
		                            </label>
		                            <div class="radio-wrap circle flex-between">
		                                <div class="radios">
		                                    <input type="radio" id="worklist_01" name="workList" value="0" checked>
		                                    <label for="worklist_01"><span class="radio-icon"></span>대표경력으로 등록됩니다.</label>
		                                </div>
		                                <button type="button" class="btn add-btn c-blue">추가하기</button>
		                            </div>
	                            </div>
	                        </div>
	                        <div class="input-box">
	                            <h4>직종 선택</h4>
	                            <div class="select-box">
	                                <label for=jobSelect>
	                                    <select name="proTpo" id="jobSelect">
	                                        <option value="">직종을 선택해주세요.</option>
	                                    	<c:forEach items="${Tpo}" var="tpo">
	                                    		<option value="${tpo.tpoCode}">${tpo.tpoTitle}</option>
	                                    	</c:forEach>
	                                    </select>
	                                </label>
	                            </div>
	                        </div>
	                        <div class="input-box">
	                            <h4>면허증</h4>
	                            <div class="license-list">
	                                <!-- 아무것도 없을 때 (입력되면 사라짐)-->
	                                <p class="no-data">해당 직종에 맞는 면허증을 등록해주세요.</p>
	                                <!-- //아무것도 없을 때 -->

	                                <ul class="licenseList">
	                                    <!-- <li>
	                                        <a href="#">
	                                            <p class="c-black">(국가공인)TAT (세무정보처리) 1급</p>
	                                            <p class="c-black">한국공인회계사회</p>
	                                        </a>
	                                    </li>
	                                    <li>
	                                        <a href="#">
	                                            <p class="c-black">(국가공인)TAT (세무정보처리) 1급</p>
	                                            <p class="c-black">한국공인회계사회</p>
	                                        </a>
	                                    </li> -->
	                                </ul>
	                            </div>
	                            <div class="btn-wrap end">
	                                <button type="button" class="btn license-btn c-blue">다른 면허증 (자격증) 추가하기</button>
	                            </div>
	                        </div>
	                    </div>
					</c:if>
                    <!-- //전문가만 보이는 부분 -->
                </div>
                <!-- //필수정보 입력 부분 -->

                <!-- 선택 정보 부분 -->
                <div class="form-wrap">
                    <h2>선택 정보 입력하기</h2>
                    <div class="input-box">
                        <h4>생년월일</h4>
                        <label for="regiUserBirth">
                            <input type="text" id="regiUserBirth" name="memberBirthd" placeholder="생년월일을 입력하세요" autocomplete="0ff">
                        </label>
                    </div>
                    <div class="input-box">
                        <h4>성별</h4>
                        <div class="radio-wrap circle flex-radio">
                            <div class="radios">
                                <input type="radio" id="regiUserMale" name="memberGender" value="m">
                                <label for="regiUserMale"><span class="radio-icon"></span>남성</label>
                            </div>
                            <div class="radios">
                                <input type="radio" id="regiUserFemale" name="memberGender" value="w">
                                <label for="regiUserFemale"><span class="radio-icon"></span>여성</label>
                            </div>
                        </div>
                    </div>
                    <div class="input-box">
                        <p class="c-black">이용약관동의 <span class="highlight">*</span></p>
                        <div class="radio-wrap circle">
                            <div class="radios">
                                <input type="radio" id="regiUserAgreeAll">
                                <label for="regiUserAgreeAll"><span class="radio-icon"></span><span class="sub-h2">전체 동의합니다.</span></label>
                            </div>
                        </div>
                    </div>
                    <div class="input-box">
                        <div class="radio-wrap circle">
                            <div class="radios">
                                <input type="radio" id="regiUserAgree_01">
                                <label for="regiUserAgree_01"><span class="radio-icon"></span>이용약관 동의 <span class="c-grey">(필수)</span></label>
                            </div>
                            <div class="radios">
                                <input type="radio" id="regiUserAgree_02">
                                <label for="regiUserAgree_02"><span class="radio-icon"></span>본인은 만 14세 이상입니다. <span class="c-grey">(필수)</span></label>
                            </div>
                            <div class="radios">
                                <input type="radio" id="regiUserAgree_03">
                                <label for="regiUserAgree_03"><span class="radio-icon"></span>개인정보 수집 · 이용 동의 <span class="c-grey">(필수)</span></label>
                            </div>
                            <div class="radios">
                                <input type="radio" id="regiUserAgree_04">
                                <label for="regiUserAgree_04"><span class="radio-icon"></span>상담안내 및 혜택/정보 수신 동의 <span class="c-grey">(선택)</span></label>
                            </div>
                            <div class="wrap">
                                <div class="radio-wrap circle flex-radio">
                                    <div class="radios">
                                        <input type="radio" id="regiUserAgree_05" name="memberAlram" value="sms">
                                        <label for="regiUserAgree_05"><span class="radio-icon"></span>SMS</label>
                                    </div>
                                    <div class="radios">
                                        <input type="radio" id="regiUserAgree_06" name="memberAlram" value="mail">
                                        <label for="regiUserAgree_06"><span class="radio-icon"></span>이메일</label>
                                    </div>
                                </div>
                                <p>동의 시 상담 안내 및 프로 혜택/정보 등 정보가 수신 됩니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //선택 정보 부분 -->

				<!-- 사용자 구분 코드 -->
				<input type="hidden" name="memberGubun" value="${userType}">

                <!-- 사용자 등록 버튼 -->
                <c:if test="${userType == 'U'}">
	                <button type="button" class="btn b-navy submit-btn user" disabled>회원가입 하기</button>
                </c:if>
                <!-- //사용자 등록 버튼 -->

                <!-- 전문가 다음 버튼 -->
                <c:if test="${userType == 'P'}">
	                <button type="button" class="btn b-navy submit-btn expert" disabled>다음 단계</button>
                </c:if>
                <!-- //전문가 다음 버튼 -->
            </form>
        </div>
    </div>
</div>



<!-- //컨텐츠 -->


</body>
</html>
