<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>레시피 상세</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h1 class="display-4">${recipe.recipeName}</h1>
  <h2 class="text-primary">요리법: ${recipe.cookingMethod}</h2>

  <div class="card mt-3">
    <div class="card-header">
      <h3>요리 재료</h3>
    </div>
    <div class="card-body">
      <p>${recipe.ingredients}</p>
    </div>
  </div>

  <div class="card mt-3">
    <div class="card-header">
      <h3>영양 정보</h3>
    </div>
    <div class="card-body">
      <table class="table table-bordered table-striped text-center">
        <thead class="thead-dark">
        <tr>
          <th>칼로리</th>
          <th>탄수화물</th>
          <th>단백질</th>
          <th>지방</th>
          <th>나트륨</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>${recipe.nutritionInfo.calories}</td>
          <td>${recipe.nutritionInfo.carbohydrates}</td>
          <td>${recipe.nutritionInfo.protein}</td>
          <td>${recipe.nutritionInfo.fat}</td>
          <td>${recipe.nutritionInfo.sodium}</td>
        </tr>
        </tbody>
      </table>
    </div>

  </div>

  <div class="card mt-3">
    <div class="card-header">
      <h3>조리 방법</h3>
    </div>
    <div class="card-body">
      <ul class="list-group">
        <c:forEach var="step" items="${recipe.manualSteps}">
          <div>
            <c:choose>
              <c:when test="${step.stepImagePath != null}">
                <img src="${step.stepImagePath}" class="card-img-top" alt="step${step.stepOrder}" style="height: max-content; object-fit: cover;">
              </c:when>
              <c:otherwise>
                <%-- 기본 이미지 경로를 사용 --%>
                <img src="https://via.placeholder.com/300x200?text=이미지+없음" class="card-img-top" alt="이미지 없음">
              </c:otherwise>
            </c:choose>
          <li class="list-group-item">${step.stepDescription}</li>
          </div>
        </c:forEach>
      </ul>
    </div>
  </div>

  <a href="../" class="btn btn-secondary mt-4">레시피 목록으로 돌아가기</a>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
