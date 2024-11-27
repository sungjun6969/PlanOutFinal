<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<div class="container">

		<div>
			<h3>제품 상세정보</h3>
		</div>

		<div>
			<div>
				<label>제품번호: </label>${item.id}</div>
		</div>
		<div>
			<div><label>제품명: </label>${item.name}</div>
		</div>
		<div>
			<div><label>가격: </label>${item.price}</div>
		</div>
		<div>
			<div><label>카테고리: </label>${item.category}</div>
		</div>
		<div>
			<div><label>제품정보: </label>${item.info}</div>
		</div>
		
		<div>
		<c:forEach var="photo" items="${item.photo}">
			<div>
				<div><label>제품 이미지: </label>${photo.filename}</div>
			</div>
			</c:forEach>
			<c:if test="${item.photo == null || item.photo.size() < 1}">
				<div>제품 이미지가 없습니다.</div>
			</c:if>
			<c:forEach var="photo" items="${item.photo}">
			<div>
			<a href="/upload/${photo.uuid}_${photo.filename}">
						<button type="button" class="btn btn-sm btn-secondary">이미지 크게 보기</button></a>
			</div>
				<div>
					<img alt="제품 이미지"
						src="${pageContext.request.contextPath}/upload/${photo.uuid}_${photo.filename}"
						style="width: 300px; height: 300px; border: 2px solid #000;">
				</div>
			</c:forEach>
			<div>
				<a href="../list"><button class="btn btn-sm btn-secondary">목록</button></a>
			</div>
		</div>
	</div>
</body>
</html>