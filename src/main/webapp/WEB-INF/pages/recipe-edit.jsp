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

    <form action="../custom/insert" method="post">
        <div class="form-group">
            <label for="recipeName">레시피 이름</label>
            <input type="text" id="recipeName" name="recipeName" class="form-control" value="${recipe.recipeName}" required>
        </div>
        <div class="form-group">
            <label for="cookingMethod">요리법</label>
            <input type="text" id="cookingMethod" name="cookingMethod" class="form-control" value="${recipe.cookingMethod}" required>
        </div>

        <!-- 요리 재료 -->
        <div class="form-group">
            <label for="ingredients">요리 재료</label>
            <textarea id="ingredients" name="ingredients" class="form-control" rows="3" required>${recipe.ingredients}</textarea>
        </div>

        <!-- 영양 정보 -->
        <div class="form-group">
            <label>영양 정보 수정</label>
            <table class="table table-bordered text-center">
                <thead>
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
                    <td><input type="number" name="nutritionInfo.calories" class="form-control" value="${recipe.nutritionInfo.calories}" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.carbohydrates" class="form-control" value="${recipe.nutritionInfo.carbohydrates}" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.protein" class="form-control" value="${recipe.nutritionInfo.protein}" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.fat" class="form-control" value="${recipe.nutritionInfo.fat}" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.sodium" class="form-control" value="${recipe.nutritionInfo.sodium}" required></td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- 조리 방법 -->
        <div class="form-group">
            <label>조리 방법</label>
            <c:forEach var="step" items="${recipe.manualSteps}" varStatus="status">
                <div class="form-row align-items-center mb-2">
                    <div class="col-8">
                        <input type="text" name="manualSteps[${status.index}].stepDescription" class="form-control" placeholder="조리 설명" value="${step.stepDescription}" required>
                    </div>
                    <div class="col-4">
                        <input type="text" name="manualSteps[${status.index}].stepImagePath" class="form-control" placeholder="이미지 경로" value="${step.stepImagePath}">
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

