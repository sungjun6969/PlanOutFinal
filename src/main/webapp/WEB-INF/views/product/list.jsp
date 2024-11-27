<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../head.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Instrument+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/list.css">
</head>
<body>
		<!-- 관리자 페이지 (제품 등록 및 수정 가능) -->
	<div class="container">
		<div>
			<h3>제품 목록(${pager.total.intValue()})</h3>
		</div>
		<div class="mb-2">
			<form class="row">
				<div class="col-6"></div>
				<div class="col-2">
					<select name="search" class="form-select form-select-sm">
						<option value="1">제품번호</option>
						<option value="2">제품명</option>
						<option value="3">카테고리</option>
						<option value="4">가격</option>
					</select>
				</div>

				<div class="col-3 d-grid"><input type="text" name="keyword" class="form-control form-control-sm"></div>
					<div class="col-1 d-grid"><button class="btn btn-sm btn-primary">검색</button></div>
			</form>
		</div>

		<div>
			<table border="1" class="table table-sm table-striped">
				<thead class="table-dark">
					<tr>
						<th>제품번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>카테고리</th>
						<th>관리</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${list.size()< 1 }">
						<tr>
							<td colspan="9">검색 된 제품이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.id}</td>
							<td><a href="view/${item.id}" style="text-decoration: none;">${item.name}</a></td>
							<td>${item.price}</td>
							<td>${item.category}</td>
							
							<td><a href="update/${item.id}" class="btn btn-sm btn-info">수정</a>
								<a href="delete/${item.id}" class="btn btn-sm btn-danger">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" class="">
							<div class="pagination pagination-sm justify-content-center">
								<div class="page-item">
									<a href="?page=1${pager.query}" class="page-link">처음</a>
								</div>
								<div class="page-item">
									<a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a>
								</div>
								<c:forEach var="page" items="${pager.list}">
									<div>
										<a href="?page=${page}${pager.query}" class="page-link ${pager.page == page ? 'active':''}">${page}</a>
									</div>
								</c:forEach>
								<div class="page-item">
									<a href="?page=${pager.next}${pager.query}" class="page-link">다음</a>
								</div>
								<div class="page-item">
									<a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a>
								</div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="row">
		<div class="col-6 d-grid"></div>
			<div class="col">
				<a href="add" class="btn btn-sm btn-primary d-grid">등록</a>
			</div>
			<div class="col">
				<a href="dummy" class="btn btn-sm btn-secondary d-grid">대량등록</a>
			</div>
			<div class="col">
				<a href="init" class="btn btn-sm btn-danger d-grid">초기화</a>
			</div>
			<div class="col">
				<a href=".." class="btn btn-sm btn-info d-grid">이전</a>
			</div>
		</div>
		</div>
</body>
</html>