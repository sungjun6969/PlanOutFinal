<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../head.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/resources/js/product/add.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote-bs5.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/summernote-bs5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lang/summernote-ko-KR.min.js"></script>
</head>
<body>

	<div class="container">

		<div>
			<h3>제품 등록</h3>
		</div>

		<div>
			<form method="post" enctype="multipart/form-data" class="">
				<div class="row mb-2">
					<div class="col-1">
						<label>제품명 :</label>
					</div>
					<div class="col">
						<input type="text" name="name"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-1">
						<label>가격 :</label>
					</div>
					<div class="col">
						<input type="number" name="price"
							class="form-control form-control-sm" step="1000">
					</div>
				</div>

				<div class="row mb-2">
					<div class="col-1">
						<label>카테고리 :</label>
					</div>
					<div class="col">
						<input type="text" name="category"
							class="form-control form-control-sm">
					</div>
				</div>
				
				<div class="mb-2">
					<div><label>제품정보 :</label></div>
					<div><textarea id="info" name="info" class="form-control"></textarea></div>
				</div>
				
				<div class="mb-2">
					<div class="row mb-2">
						<div class="col-2">
							<label>제품 이미지 :</label>
						</div>
						<div class="col-1 d-grid">
							<button type="button" id="add_photo"
								class="btn btn-sm btn-secondary">추가</button>
						</div>
						<div class="col"></div>
					</div>
				</div>
				<div>

					<ul id="list_photo">
						<li>
							<div>
								<input type="file" name="uploadFile" class="form-control">
							</div>
						</li>
					</ul>
				</div>

				<div class="row mb-2">
				<div class="col-4"></div>
					<div class="col d-grid">
						<button id="add" class="btn btn-sm btn-primary">등록</button>
					</div>
					<div class="col">
						<a href="list" class="d-grid"><button type="button"
								class="btn btn-sm btn-danger">취소</button></a>
					</div>
					<div class="col-4"></div>
				</div>
			</form>
		</div>
	</div>
	<div id="temp_photo" style="display: none">
		<div class="row mb-2">
			<div class="col">
				<input type="file" name="uploadFile" class="form-control">
			</div>
			<div class="col-1">
				<button type="button" class="btn btn-sm btn-danger d-grid">삭제</button>
			</div>
		</div>
	</div>
	
	<script>
		$(()=>{
			$("#info").summernote({
				lang: 'ko-KR',
				height: 300,
			});
		});
	</script>
</body>
</html>