<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 목록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="text-center mb-4">레시피 목록</h1>

    <!-- 빈 리스트 확인 -->
    <c:if test="${empty recipes}">
        <div class="alert alert-warning text-center" role="alert">
            레시피 데이터가 없습니다.
        </div>
    </c:if>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="recipe" items="${recipes}">
            <div class="col">
                <div class="card h-100">
                    <c:choose>
                        <c:when test="${recipe.main_image_path != null}">
                            <img src="${recipe.main_image_path}" class="card-img-top" alt="${recipe.recipe_name}" style="height: 200px; object-fit: cover;">
                        </c:when>
                        <c:otherwise>
                            <%-- 기본 이미지 경로를 사용 --%>
                            <img src="https://via.placeholder.com/300x200?text=이미지+없음" class="card-img-top" alt="이미지 없음">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title">${recipe.recipe_name != null ? recipe.recipe_name : '이름 없음'}</h5>
                        <p class="card-text">${recipe.cooking_method != null ? recipe.cooking_method : '요리법 없음'}</p>
                    </div>
                    <div class="card-footer text-center">
                        <a href="recipe/${recipe.RCP_SEQ}" class="btn btn-primary">상세보기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

