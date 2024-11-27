<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/resources/js/product/update.js"></script>
<script type="text/javascript" src = "/resources/js/product/add.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote-bs5.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/summernote-bs5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lang/summernote-ko-KR.min.js"></script>
<jsp:include page="../head.jsp"></jsp:include>

</head>
<body>
   <div class="container">

      <div>
         <h3>제품 정보 변경</h3>
      </div>
      
      <div>
         <form method="post" enctype="multipart/form-data">
            <div><label>제품번호: ${item.id}</label></div>
            <div class="row mb-2">
               <div class="col-2"><label>제품명:</label></div>
               <div><input type="text" name="name" value="${item.name}" class="form-control form-control-sm"></div>
            </div>
            
            <div class="row mb-2">
               <div class="col-2"><label>가격:</label></div>
               <div><input type="number" name="price" value="${item.price}" class="form-control form-control-sm"></div>
            </div>
            
            <div class="row mb-2">
               <div class="col-2"><label>카테고리:</label></div>
               <div><input type="text" name="category" value="${item.category}" class="form-control form-control-sm"></div>
            </div>
            
            <div class="mb-2">
					<div class="col-2"><label>제품상세정보:</label></div>
					<div><textarea id="info" name="info" class="form-control">${item.info}</textarea></div>
				</div>
            
            <div class="mb-2">
            <div  class="col-2"><label>제품 이미지:</label></div>
            
               <div class="mb-2">
               <div class="col-1">
                  <label>제품 이미지: </label></div>
                  <div class="col-1"><button type="button" id="add_photo" class="btn btn-sm btn-primary">추가</button></div>
               </div>
               
               <ul id="list_photo">
                  <li>
                     <div class="mb-2">
                        <input type="file" name="uploadFile" class="form-control form-control-sm">
                     </div>
                  </li>
               </ul>
               
               <c:if test="${item.photo == null || item.photo.size() < 1}">
               <div>제품 이미지가 없습니다.</div>
            </c:if>
            
            <c:forEach var="photo" items="${item.photo}">
            <div class="photo row">
               <div class="col-1">
                  <button type="button" class="delete_photo" data-photo="${photo.id}" class="btn btn-sm btn-danger">삭제 ${photo.id}</button>
               </div>
            </div>
            
            <div class="col"><img alt="제품 이미지" src="${pageContext.request.contextPath}/upload/${photo.uuid}_${photo.filename}" style="width: 150px; height: 300px;"></div>
            </c:forEach>
         </div>
                        
            <div class="row">
            <div class="col-6"></div>
               <div class="col d-grid"><button class="btn btn-sm btn-primary">변경</button></div>
               <div class="col"><a href="../list" class="d-grid"><button type="button" class="btn btn-sm btn-secondary">취소</button></a></div>
            </div>
            <div class="col-6"></div>
         </form>
      </div>
   </div>
   
   <div id="temp_photo" style="display: none" class="mb-2">
      <div class="row mb-2">
      <div class="col">
         <input type="file" name="uploadFile" class="form-control form-control-sm">
         </div>
         <div class="col-1 d-grid">
         <button type="button" class="btn btn-sm btn-danger">삭제</button>
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