<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세정보</title>
<jsp:include page="../head.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/product/item.js"></script>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/item.css">
</head>
<body>
	<div class="e91_177">

		<!-- 제품 사진 들어가는 부분 (cardlist에서 선택한 제품의 사진) -->

		<c:forEach var="photo" items="${item.photo}">
			<img alt="제품 이미지"
				src="${pageContext.request.contextPath}/upload/${photo.uuid}_${photo.filename}"
				class="productimage-img">
		</c:forEach>


		<div class="e91_179"></div>
		<span class="e91_181"><a href="/..">P L A N O U T</a></span>

		<div class="e93_194">
			<button class="e93_195 action" id="cart" data-type="cart"
				data-login="${sessionScope.member != null}" data-id="${item.id}"></button>
			<div class="gocarttext">추가하기</div>
		</div>
		<div class="e93_198">
			<button class="e93_199 action" id="buy" data-type="buy"
				data-login="${sessionScope.member != null}" data-id="${item.id}"></button>
			<div class="gobuytext"><a href="/cart">장바구니</a></div>
		</div>

		<!-- 제품 정보 나오는부분 정리 -->

		<div class="product-card">
			<div class="product-info">
				<span class="label">제품아이디:</span> <span class="value">${item.id}</span>
			</div>
			<div class="product-info">
				<span class="label">제품이름:</span> <span class="value">${item.name}</span>
			</div>
			<div class="product-info">
				<span class="label">가격:</span> <span class="value">${item.price}원</span>
			</div>
			<div class="product-info">
				<span class="label">카테고리:</span> <span class="value">${item.category}</span>
			</div>

			<!-- 사이즈 선택 부분 -->
			<div class="product-info">
				<span class="label">사이즈:</span> <span id="item-info" class="value">${item.info}</span>
<script>
  const item = { info: "XS S M L XL" };

  const infoElement = document.getElementById("item-info");

  const words = item.info.split(" ");
  infoElement.innerHTML = "";
  words.forEach(word => {
    const span = document.createElement("span");
    span.textContent = word;
    span.className = "value";
    span.style.marginRight = "20px";
    span.onclick = function () {

 
      if (word === "XL") {
        alert("품절된 상품입니다. 다른 사이즈를 골라주세요.");
        return;
      }

      document.querySelectorAll(".value").forEach(el => el.classList.remove("clicked"));

      this.classList.add("clicked");

      alert(`${word} 사이즈가 선택되었습니다.`);
    };
    infoElement.appendChild(span);
  });
</script>

			</div>
		</div>

		<!-- 사이즈 정보 표시 목록 -->

		<div class="size-card-container">
			<div class="size-card">
				<h3>상의</h3>
				<ul>
					<li>XS(90)</li>
					<li>S(95)</li>
					<li>M(100)</li>
					<li>L(105)</li>
					<li class="sold-out">XL(재고없음)</li>
				</ul>
			</div>
			<div class="size-card">
				<h3>하의</h3>
				<ul>
					<li>XS(28)</li>
					<li>S(29)</li>
					<li>M(30)</li>
					<li>L(31~32)</li>
					<li class="sold-out">XL(재고없음)</li>
				</ul>
			</div>
		</div>

		<!-- 버튼 수정란 -->

		<div class="e93_211"></div>
		<span class="backtext"><a href="/product/cardlist">뒤로가기</a></span>
		<div class="quantity-container">
			<span class="label">수량 :</span>
			<div class="input-wrapper">
				<input type="number" id="amount" value="1" min="1">
			</div>
		</div>
	</div>
</body>
</html>