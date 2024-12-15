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
    .ingredient {
      display: flex;
      align-items: center; /* 수직 중앙 정렬 */
      gap: 10px; /* 요소 간 간격 */
    }
    .form-control {
      flex: 1; /* 입력 필드가 남은 공간을 채우도록 설정 */
    }
    .btn-danger {
      margin-left: auto; /* 삭제 버튼을 오른쪽 끝으로 정렬 */
    }
  </style>
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
  <form action="../updateCheckList" method="POST">
    <div class="form-group">
      <label for="ingredientsContainer">재료 체크 리스트</label>

      <div id="ingredientsContainer">
        <!-- Existing Ingredients -->
        <c:forEach var="ingredient" items="${recipe.ingredientList}" varStatus="status">
          <div class="ingredient mb-2" data-ingredient-id="${status.index}">
            <input type="hidden" name="ingredients[${status.index}].id" value="${status.index}">
            <input type="hidden" name="ingredients[${status.index}].recipeId" value="${recipe.id}">
            <select name="ingredients[${status.index}].isAvailable" class="form-control">
              <option value="1" ${ingredient.isAvailable != 0 ? 'selected' : ''}>ready</option>
              <option value="0" ${ingredient.isAvailable == 0 ? 'selected' : ''}>Not ready</option>
            </select>
            <input type="text" class="form-control" name="ingredients[${status.index}].ingredientName" value="${ingredient.ingredientName}" required>
            <button type="button" class="btn btn-danger btn-sm remove-ingredient-button">삭제</button>
          </div>
        </c:forEach>
      </div>
      <button type="button" class="btn btn-success mt-2" id="addIngredientButton">+ 재료 추가</button>
    </div>
    <div class="form-group text-center mt-4">
      <button type="submit" class="btn btn-primary">저장하기</button>
    </div>
  </form>

  <!-- Nutrition Information -->
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

  <!-- Cooking Steps -->
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

<!-- JavaScript -->
<script>
  let ingredientCount = document.querySelectorAll('.ingredient').length; // 이미 추가된 재료 개수 계산
  const ingredientsContainer = document.getElementById('ingredientsContainer');
  const addIngredientButton = document.getElementById('addIngredientButton');

  // 재료 추가 버튼 이벤트 리스너
  addIngredientButton.addEventListener('click', function () {
    // 새로운 재료 요소 생성
    const newIngredient = document.createElement('div');
    newIngredient.classList.add('ingredient', 'mb-2');
    newIngredient.setAttribute('data-ingredient-id', ingredientCount);

    // 동적으로 새로운 재료 필드 생성 (문자열 연결 방식 사용)
    newIngredient.innerHTML =
            '<input type="hidden" name="ingredients[' + ingredientCount + '].id" value="' + ingredientCount + '">' +
            '<input type="hidden" name="ingredients[' + ingredientCount + '].recipeId" value="${recipe.id}">' +
            '<select name="ingredients[' + ingredientCount + '].isAvailable" class="form-control">' +
            '  <option value="0">Not ready</option>' +
            '  <option value="1">ready</option>' +
            '</select>' +
            '<input type="text" class="form-control" name="ingredients[' + ingredientCount + '].ingredientName" placeholder="재료 이름" required>' +
            '<button type="button" class="btn btn-danger btn-sm remove-ingredient-button">삭제</button>';

    ingredientsContainer.appendChild(newIngredient);

    reindexIngredients(); // 재정렬
    ingredientCount++;
  });

  // 삭제 버튼 클릭 이벤트 리스너
  ingredientsContainer.addEventListener('click', function (event) {
    if (event.target.classList.contains('remove-ingredient-button')) {
      const ingredientElement = event.target.closest('.ingredient');
      ingredientElement.remove(); // 재료 삭제
      reindexIngredients(); // 삭제 후 재정렬
    }
  });

  // 모든 재료의 인덱스를 0부터 다시 설정하는 함수
  function reindexIngredients() {
    const ingredients = ingredientsContainer.children; // 모든 재료 요소
    Array.from(ingredients).forEach(function (ingredient, index) {
      const hiddenIdInput = ingredient.querySelector('input[name*=".id"]');
      const hiddenRecipeIdInput = ingredient.querySelector('input[name*=".recipeId"]');
      const selectInput = ingredient.querySelector('select');
      const nameInput = ingredient.querySelector('input[type="text"]');

      // name 속성 및 값 갱신 (문자열 연결 방식 사용)
      hiddenIdInput.name = "ingredients[" + index + "].id";
      hiddenIdInput.value = index; // ID 값 갱신
      hiddenRecipeIdInput.name = "ingredients[" + index + "].recipeId";
      selectInput.name = "ingredients[" + index + "].isAvailable";
      nameInput.name = "ingredients[" + index + "].ingredientName";

      ingredient.setAttribute('data-ingredient-id', index); // data-ingredient-id 갱신
    });

    ingredientCount = ingredients.length; // 재료 개수 업데이트
    console.log("재정렬 후 재료 개수: " + ingredientCount); // 디버깅용 로그 출력
  }
</script>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
