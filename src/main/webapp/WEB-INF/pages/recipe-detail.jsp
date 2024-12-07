<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>레시피 상세</title>
</head>
<body>
<h1>${recipe.recipe_name}</h1>
<h2>요리법: ${recipe.cooking_method}</h2>
<h3>요리 재료:</h3>
<p>${recipe.ingredients}</p>

<h3>영양 정보:</h3>
<ul>
  <li>칼로리: ${recipe.nutritionInfo.calories}</li>
  <li>탄수화물: ${recipe.nutritionInfo.carbohydrates}</li>
  <li>단백질: ${recipe.nutritionInfo.protein}</li>
  <li>지방: ${recipe.nutritionInfo.fat}</li>
  <li>나트륨: ${recipe.nutritionInfo.sodium}</li>
</ul>

<h3>조리 방법:</h3>
<ul>
  <c:forEach var="step" items="${recipe.manualSteps}">
    <li>단계 ${step.step_order}: ${step.step_description}</li>
  </c:forEach>
</ul>

<a href="../recipes">레시피 목록으로 돌아가기</a>
</body>
</html>
