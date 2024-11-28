<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품리스트</title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Instrument+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/list.css">
</head>
<body>
	<!-- nav (고정 디자인) -->
	<div class="e93_214">
		<div class="e93_215"></div>
		<span class="e93_216"><a href="..">P L A N O U T</a></span> 
		<span class="e93_217">제품 리스트</span>

		<!-- 제품리스트(카드) -->
		<div class="product-list">
			<c:forEach var="item" items="${cardlist}">
				<div class="product-card">
					<div OnClick ="location.href='${pageContext.request.contextPath}/product/item/${item.id}'">
						<div class="itemimage">
							<img class="imagefile"
								src="${pageContext.request.contextPath}/upload/${item.uuid}_${item.filename}"
								alt="${item.name}">
							<div class="overlay">
  							<div class="content">
    							<div class="name">${item.name}</div>
    							<div class="price">₩${item.price}</div>
  							</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 뒤로가기 버튼 -->
		<div class="e94_233">
			<div class="e94_234"></div>
			<span class="gobacktext"><a href="..">뒤로가기</a></span>
		</div>

	</div>

</body>
</html>