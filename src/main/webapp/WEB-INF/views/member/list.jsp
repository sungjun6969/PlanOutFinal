<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

table {
	width: 50%;
	border-collapse: collapse;
	background-color: #ffffff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	margin-top: -150px;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
}

th {
	background-color: #f4f4f4;
	color: #333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

caption {
	font-size: 1.5em;
	margin-bottom: 10px;
}

.button-container {
	display: flex;
	gap: 10px;
}

button {
	padding: 10px 20px;
	font-size: 1em;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

.button-secondary {
	background-color: black;
}

.button-secondary:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>
	<table>
		<caption style="font-weight: bold;">USER INFORMATION</caption>
		<thead>
			<tr>
				<th>항목</th>
				<th>정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>사용자 이름</td>
				<td>${sessionScope.member.username}</td>
			</tr>
			<tr>
				<td>사용자 ID</td>
				<td>${sessionScope.member.userid}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${sessionScope.member.phone}</td>
			</tr>
		</tbody>
	</table>
	<div class="button-container">
		<a href="/cart/orders"><button class="button-secondary">주문내역</button></a>
		<button class="button-secondary" onclick="history.back()">뒤로가기</button>
	</div>
</body>
</html>
