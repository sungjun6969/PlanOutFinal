<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<link rel="stylesheet" href="/resources/css/orders.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<h2>주문 내역</h2>
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
                <!-- 수량 -->
                <td>${product.price}</td>
                <td>${product.price * cart.cart[product.id]}</td>
            </tr>
        </c:forEach>
    </table>

    <p class="total-amount">결제금액: ${totalAmount}원</p>

	<!-- 주소 검색  -->
	
     <div class="form-container" style="text-align: center; margin-top: 20px;">
        <div class="address-container">
        <div class="address-input-container">
        <h3 style="text-align: center;">배송지를 입력해주세요</h3>
            <label for="address" class="label">주소</label>
            <input type="text" id="address" class="address-input" placeholder="주소를 입력하세요" readonly>
        </div>
        <div class="address-input-container">
            <label for="addressinfo" class="label">상세주소</label>
            <input type="text" id="addressinfo" class="address-input" placeholder="상세주소를 입력해주세요">
            <button onclick="searchAddress()" class="back-button-address">주소 찾기</button>
        </div>
    </div>
    </div>
    <script>
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('address').value = data.address; 
                }
            }).open();
        }
    </script>
	
	<!-- 결제하기 취소하기 버튼 -->
    <div style="text-align: center; margin-top: -40px;">
        <a href="/cart/confirm" class="button">결제하기</a>
        <a href=".." class="back-button">취소하기</a>
    </div>
    
</body>
</html>