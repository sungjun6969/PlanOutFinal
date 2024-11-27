<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/index.css">
</head>
<body>
	<div class="e46_245">
		<c:if test="${sessionScope.member == null}">
		<header class="head-box">
		<span class="e46_247">P L A N O U T</span>
		<div class="e65_178">
		
			<div class="logincover"></div>
			<span class="textline1"><a href="login">로그인</a></span>
		</div>
		<div class="e65_177">
			<div class="signincover"></div>
			<span class="textline2"><a href="signup">회원가입</a></span>
		</div>
		</header>
		</c:if>
		
		<c:if test="${sessionScope.member != null}">
			<div class="e46_245">
			<span class="e46_247">P L A N O U T</span>
		<div class="col">
			<div class="shownameinfo"><a href="/member/list"><span style="color: blue;">${sessionScope.member.username}</span></a>님</div>
		</div>
		
			<div class="e65_178">
				<div class="logincover"></div>
				<span class="textline1"><a href="${pageContext.request.contextPath}/cart"
					class="btn btn-primary-emphasis btn-outline-dark">장바구니</a></span>
			</div>
			
			<div class="e65_177">
				<div class="signincover"></div>
				<span class="textline2"><a href="${pageContext.request.contextPath}/logout"
					class="btn btn-primary-emphasis btn-outline-dark">로그아웃</a></span>
			</div>
	</div>
</c:if>
		<!-- 헤더 이미지 고정값 -->
		<div class="headerimage"><img src="resources/img/headerimage.png"
		 style="width:1920px;height:238px;position:absolute;left: -20px;top:130px
		 background-repeat:no-repeat; background-size:cover;"></div>
		
		
		<!-- 메인페이지에 나올 제품이 추가된 제품사진들 -->
		<span class="designtext"><a href="/product/cardlist">DESIGN LIST</a></span>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/46'" class="mainimage1"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/27'" class="mainimage2"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/42'" class="mainimage3"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/43'" class="mainimage4"></div>
		
		<!-- 추천제품 -->
		<span class="recommendtext">RECOMMEND LIST</span>
		
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/45'" class="recommendimg1"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/23'" class="recommendimg2"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/22'" class="recommendimg3"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/21'" class="recommendimg4"></div>
		
		<!-- 신상제품 -->
		<span class="newprodtext">NEW PRODUCTS</span>
		
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/30'" class="newproductimg1"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/53'" class="newproductimg2"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/47'" class="newproductimg3"></div>
		<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/50'" class="newproductimg4"></div>
		
		
		<!-- 브랜드 설명 디자인 칸 -->
		
		<div class="siteinformation">
   		<p class="hover-text1">PLANOUT YOUR OWN DESIGN</p>
   		<p class="hover-text2">FIND OUT MORE DESIGN</p>
   		<p class="hover-text3">CREATE YOUR OWN OUTFIT</p>
		</div>


		<!-- 푸터 목록 -->
		<span class="footertext"><a href="..">P L A N O U T</a></span>
		
		<div class="footer">
        <p>© 2024 P L A N O U T Official. All Rights Reserved.</p>
        <p>CONTACT : 010-3424-1808</p>
        <p>대표자 : 박성준</p>
        <p>(주)플랜아웃</p>
        <p>문의사항 : (평일 10:00~17:00) (주말/공휴일 휴무)</p>
    	</div>
		
		
		
		<!-- 관리자 계정일때 -->
		<c:if test="${sessionScope.member != null && sessionScope.member.userid == 'admin'}">
		<div class="e46_290">
			<div class="clickherebutton1"></div>
			<span class="clickheretext1"><a href="product/list">CLICK HERE</a></span>
		</div>
		<div class="e46_294">
			<div class="clickherebutton2"></div>
			<span class="clickheretext2"><a href="product/list">CLICK HERE</a></span>
		</div>
		<div class="e65_185">
			<div class="clickherebutton3"></div>
			<span class="clickheretext3"><a href="product/list">CLICK HERE</a></span>
		</div>
		<div class="e46_286">
			<div class="clickherebutton4"></div>
			<span class="clickheretext4"><a href="product/list">CLICK HERE</a></span>
		</div>
		</c:if>
		
		<!-- 고객 계정일때 -->
		<c:if test="${sessionScope.member != null && sessionScope.member.userid != 'admin'}">
		<div class="e46_290">
			<div class="clickherebutton1"></div>
			<span class="clickheretext1"><a href="product/cardlist">CLICK HERE</a></span>
		</div>
		<div class="e46_294">
			<div class="clickherebutton2"></div>
			<span class="clickheretext2"><a href="product/cardlist">CLICK HERE</a></span>
		</div>
		<div class="e65_185">
			<div class="clickherebutton3"></div>
			<span class="clickheretext3"><a href="product/cardlist">CLICK HERE</a></span>
		</div>
		<div class="e46_286">
			<div class="clickherebutton4"></div>
			<span class="clickheretext4"><a href="product/cardlist">CLICK HERE</a></span>
		</div>
		</c:if>
		
		<!-- 로그인 X 상태일때 -->
		<c:if test="${sessionScope.member == null}">
		<div class="e46_290">
			<div class="clickherebutton1"></div>
			<span class="clickheretext1"><a href="login">CLICK HERE</a></span>
		</div>
		<div class="e46_294">
			<div class="clickherebutton2"></div>
			<span class="clickheretext2"><a href="login">CLICK HERE</a></span>
		</div>
		<div class="e65_185">
			<div class="clickherebutton3"></div>
			<span class="clickheretext3"><a href="login">CLICK HERE</a></span>
		</div>
		<div class="e46_286">
			<div class="clickherebutton4"></div>
			<span class="clickheretext4"><a href="login">CLICK HERE</a></span>
		</div>
		</c:if>
		
		<div class="e65_209"></div>
		<div class="circle1"></div>
		<div class="circle2"></div>
		<div class="circle3"></div>
		<div class="pause1"></div>
		<div class="pause2"></div>
		<span class="headertext1">CREATE YOUR OWN DESIGN</span><span
			class="headertext2">P L A N O U T </span>
		<div class="rectangle"></div>
	</div>
</body>
</html>