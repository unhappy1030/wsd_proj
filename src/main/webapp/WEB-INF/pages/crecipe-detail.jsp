<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MY 레시피 상세</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <style>
    .form-control {
      flex: 1; /* 입력 박스가 버튼 옆에서 공간을 채우도록 설정 */
    }

    .list-group-item {
      position:relative;
      padding: 0.7rem 2rem;
    }

    .form-check-input {
      margin-right: 10px; /* 체크박스와 텍스트 간격 */
    }

    .btn-danger {
      position: absolute; /* 삭제 버튼을 오른쪽 끝으로 고정 */
      right: 10px; /* 오른쪽 여백 */
      top: 50%; /* 수직 중앙 정렬 */
      transform: translateY(-50%); /* 정확한 중앙 정렬 */
    }

    .checklist-container {
      margin: auto; /* 중앙 정렬 */
    }
  </style>

  <script>
    function addIngredient() {
      const input = document.getElementById("ingredientInput");
      const ingredient = input.value.trim(); // 공백 제거

      if (ingredient) {
        // 체크리스트 항목 생성
        const li = document.createElement("li");
        li.className = "list-group-item";

        // 체크박스 생성
        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.className = "form-check-input";

        // 라벨 추가
        const label = document.createElement("span");
        label.textContent = ingredient;

        // 리스트 아이템 삭제 버튼 추가
        const removeButton = document.createElement("button");
        removeButton.textContent = "삭제";
        removeButton.className = "btn btn-sm btn-danger";
        removeButton.onclick = function() {
          li.remove(); // 리스트 아이템 삭제
        };

        li.appendChild(checkbox);
        li.appendChild(label);
        li.appendChild(removeButton);

        // 리스트의 맨 위에 항목 추가
        const checklist = document.getElementById("checklist");
        checklist.insertBefore(li, checklist.firstChild);

        // 입력 필드 초기화
        input.value = "";
      } else {
        alert("재료를 입력해주세요!");
      }
    }
  </script>


</head>
<body>
<jsp:include page="comp/top.jsp"/>
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

  <div class="card mt-3 checklist-container">
    <div class="card-header">
      <h3>요리 재료 체크리스트</h3>
    </div>
    <div class="card-body">
      <div class="d-flex mb-3">
        <input type="text" id="ingredientInput" class="form-control" placeholder="재료를 입력하세요">
        <button class="btn btn-primary ms-2" onclick="addIngredient()">추가</button>
      </div>
      <ul id="checklist" class="list-group">
        <!-- 재료 항목이 추가될 위치 -->
      </ul>
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
                <img src="${step.stepImagePath}" class="card-img-top" alt="step${step.stepOrder}"
                     style="height: max-content; object-fit: cover;">
              </c:when>
              <c:otherwise>
                <%-- 기본 이미지 경로를 사용 --%>
                <img src="https://via.placeholder.com/300x200?text=이미지+없음" class="card-img-top"
                     alt="이미지 없음">
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
