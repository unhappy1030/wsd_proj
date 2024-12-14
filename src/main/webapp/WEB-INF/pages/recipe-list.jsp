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
<jsp:include page="comp/top.jsp" />
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
                        <c:when test="${recipe.mainImagePath != null}">
                            <img src="${recipe.mainImagePath}" class="card-img-top" alt="89{recipe.recipe_name}" style="height: 200px; object-fit: cover;">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/300x200?text=이미지+없음" class="card-img-top" alt="이미지 없음">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title">${recipe.recipeName != null ? recipe.recipeName : '이름 없음'}</h5>
                        <p class="card-text">${recipe.cookingMethod != null ? recipe.cookingMethod : '요리법 없음'}</p>
                    </div>
                    <div class="card-footer text-center">
                        <a href="recipe/${recipe.rcpSeq}" class="btn btn-primary">상세보기</a>
                        <a href="recipeEdit/${recipe.rcpSeq}" class="btn btn-secondary">커스텀</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

