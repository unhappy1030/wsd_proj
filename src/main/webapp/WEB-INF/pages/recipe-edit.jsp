<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 수정</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="display-4">레시피 수정</h1>

    <form action="/custom/update/${recipe.RCP_SEQ}" method="post">
        <div class="form-group">
            <label for="recipe_name">레시피 이름</label>
            <input type="text" id="recipe_name" name="recipe_name" class="form-control" value="${recipe.recipe_name}" required>
        </div>
        <div class="form-group">
            <label for="cooking_method">요리법</label>
            <input type="text" id="cooking_method" name="cooking_method" class="form-control" value="${recipe.cooking_method}" required>
        </div>

        <!-- 요리 재료 -->
        <div class="form-group">
            <label for="ingredients">요리 재료</label>
            <textarea id="ingredients" name="ingredients" class="form-control" rows="3" required>${recipe.ingredients}</textarea>
        </div>

        <!-- 영양 정보 -->
        <div class="form-group">
            <label>영양 정보</label>
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

        <!-- 조리 방법 -->
        <div class="form-group">
            <label>조리 방법</label>
            <c:forEach var="step" items="${recipe.manualSteps}">
                <div class="form-row align-items-center mb-2">
                    <div class="col-8">
                        <input type="text" name="manualSteps[${step.step_order - 1}].step_description" class="form-control" placeholder="조리 설명" value="${step.step_description}" required>
                    </div>
                    <div class="col-4">
                        <input type="text" name="manualSteps[${step.step_order - 1}].step_image_path" class="form-control" placeholder="이미지 경로" value="${step.step_image_path}">
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 수정 버튼 -->
        <button type="submit" class="btn btn-primary">수정 저장</button>
        <a href="" class="btn btn-secondary">취소</a>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.
