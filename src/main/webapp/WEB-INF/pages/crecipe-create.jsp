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
<jsp:include page="comp/top.jsp" />
<div class="container mt-4">
    <h1 class="display-4">새 레시피 만들기</h1>

    <form action="../custom/insert" method="post">
        <div class="form-group">
            <label for="recipeName">레시피 이름</label>
            <input type="text" id="recipeName" name="recipeName" class="form-control" value="" placeholder="레시피 이름을 입력하세요." required>
        </div>
        <div class="form-group">
            <label>음식 사진 URL</label>
            <input type="text" id="mainImagePath" name="mainImagePath" class="form-control" value="" placeholder="음식 사진 URL을 붙히세요.">
        </div>
        <div class="form-group">
            <label for="cookingMethod">요리법</label>
            <input type="text" id="cookingMethod" name="cookingMethod" class="form-control" value="" placeholder="요리법을 입력하세요." required>
        </div>

        <!-- 요리 재료 -->
        <div class="form-group">
            <label for="ingredients">요리 재료</label>
            <textarea id="ingredients" name="ingredients" class="form-control" rows="3" placeholder="요리 재료들을 쉼표(,) 로 구분해서 입력하세요." required></textarea>
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
                    <td><input type="number" name="nutritionInfo.calories" class="form-control" value="" placeholder="kcal" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.carbohydrates" class="form-control" value="" placeholder="gram" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.protein" class="form-control" value="" placeholder="gram" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.fat" class="form-control" value="" placeholder="gram" required></td>
                    <td><input type="number" step="0.1" name="nutritionInfo.sodium" class="form-control" value="" placeholder="gram" required></td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- 조리 방법 -->
        <div class="form-group">
            <label>조리 방법 (6순서)</label>
            <c:forEach var="step" begin="0" end="5">
                <div class="form-row align-items-center mb-2">
                    <div class="col-8">
                        <input type="text" name="manualSteps[${step}].stepDescription" class="form-control" placeholder="조리 설명" value="" required>
                    </div>
                    <div class="col-4">
                        <input type="text" name="manualSteps[${step}].stepImagePath" class="form-control" placeholder="이미지 URL을 붙히세요" value="">
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 수정 버튼 -->
        <button type="submit" class="btn btn-primary">레시피 저장</button>
        <a href="${pageContext.request.contextPath}/custom/" class="btn btn-secondary">취소</a>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

