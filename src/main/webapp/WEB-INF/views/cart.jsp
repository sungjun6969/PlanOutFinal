<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/cart.js"></script>
<link rel="stylesheet" href="/resources/css/cart.css">
</head>
<body>
	 <div class="container">
        <div>
            <h3>${sessionScope.member.username}님의 장바구니</h3>
        </div>
        
        <span class="logodefault">P L A N O U T</span>

        <div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>제품번호</th>
                        <th>제품명</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>주문금액</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 장바구니가 비어 있을 때 -->
                    <c:if test="${list.size() < 1}">
                        <tr>
                            <td colspan="6" class="empty-message">장바구니에 등록 된 제품이 없습니다</td>
                        </tr>
                    </c:if>

                    <!-- 장바구니에 제품이 있을 때 -->
                    <c:forEach var="item" items="${list}">
                        <c:set var="amount" value="${cart.cart.get(item.id)}"></c:set>
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td>${amount}</td>
                            <td>${item.price}</td>
                            <td>${item.price * amount}</td>
                            <td>
                                <button class="btn btn-sm btn-danger delete" 
                                style="border-radius: 10px;" data-id="${item.id}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>    
                </tbody>
            </table>
        </div>

        <div class="row order-buttons">
            <div class="col-6">
                <a href="/cart/orders" class="btn btn-dark">주문하기</a>
            </div>
            <div class="col-6">
                <a href="." class="btn btn-secondary">돌아가기</a>
            </div>
        </div>
    </div>
</body>
</html>