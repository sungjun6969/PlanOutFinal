<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 확인</title>
<link rel="stylesheet" href="/resources/css/confirm.css">
</head>
<body>

	<span class="mainlogo">P L A N O U T</span>
	<span class="logoline"></span>

	<div class="container">
		<h2>결제 확인</h2>
		<table>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>합계</th>
			</tr>
			<c:forEach var="product" items="${list}">
				<tr>
					<td>${product.name}</td>
					<td>${cart.cart[product.id]}</td>
					<td>${product.price}</td>
					<td>${product.price * cart.cart[product.id]}</td>
				</tr>
			</c:forEach>
		</table>
		<p class="total-amount">결제금액: ${totalAmount}원</p>
		
		<form action="/cart/success" method="get" style="text-align: center;">
			<button type="submit" class="button">결제 완료</button>
		</form>

		<div style="text-align: center;">
			<a href="/cart/orders" class="back-button">주문 페이지로 돌아가기</a>
		</div>
	</div>
</body>
</html>
