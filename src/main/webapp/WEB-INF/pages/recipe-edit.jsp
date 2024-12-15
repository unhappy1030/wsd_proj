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
    <h1 class="display-4">레시피 수정</h1>

    <form action="../custom/insert" method="post">
        <div class="form-group">
            <label for="recipeName">레시피 이름</label>
            <input type="text" id="recipeName" name="recipeName" class="form-control" value="${recipe.recipeName}" required>
        </div>
        <div class="form-group">
            <c:choose>
                <c:when test="${recipe.mainImagePath != null}">
                    <img src="${recipe.mainImagePath}" class="card-img-top" alt="89{recipe.recipe_name}" style="height: 200px; object-fit: cover;">
                </c:when>
                <c:otherwise>
                    <img src="https://via.placeholder.com/300x200?text=이미지+없음" class="card-img-top" alt="이미지 없음">
                </c:otherwise>
            </c:choose>
            <input type="text" id="mainImagePath" name="mainImagePath" class="form-control" value="${recipe.mainImagePath}" required>
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
                    <div class="col-1">
                        <button type="button" class="btn btn-danger btn-sm remove-step-button">삭제</button>
                    </div>
                </div>
            </c:forEach>
            <button type="button" class="btn btn-success mt-2" id="addStepButton">+ 단계 추가</button>
        </div>

        <!-- 수정 버튼 -->
        <button type="submit" class="btn btn-primary">수정 저장</button>
        <a href="" class="btn btn-secondary">취소</a>
    </form>
    <script>
        let stepCount = document.querySelectorAll('.manual-step').length; // 이미 추가된 단계 개수를 계산하여 stepCount 초기화

        const container = document.getElementById('manualStepsContainer');
        const addStepButton = document.getElementById('addStepButton');

        // 단계 추가 버튼 이벤트 리스너
        addStepButton.addEventListener('click', () => {
            console.log("현재 stepCount 값:", stepCount); // stepCount 값 확인

            // 새로운 단계 HTML 생성
            const newStep = document.createElement('div');
            newStep.classList.add('form-row', 'align-items-center', 'mb-2', 'manual-step');
            newStep.setAttribute('data-step-id', stepCount); // data-step-id도 업데이트

            // 내부 HTML을 동적으로 추가
            newStep.innerHTML = `
        <input type="hidden" class="step-order-input" value="">
        <div class="col-8">
            <input type="text" class="form-control step-description-input" placeholder="조리 설명" required>
        </div>
        <div class="col-3">
            <input type="text" class="form-control step-image-input" placeholder="이미지 URL을 붙히세요">
        </div>
        <div class="col-1">
            <button type="button" class="btn btn-danger btn-sm remove-step-button">삭제</button>
        </div>
    `;

            // 컨테이너에 추가
            container.appendChild(newStep);

            // 동적으로 설정된 필드의 name과 value 속성 설정
            const stepOrderInput = newStep.querySelector('.step-order-input');
            const stepDescriptionInput = newStep.querySelector('.step-description-input');
            const stepImageInput = newStep.querySelector('.step-image-input');

            // 콘솔로 각 값 확인
            console.log(`manualSteps[${stepCount}].stepOrder`);
            console.log(`manualSteps[${stepCount}].stepDescription`);
            console.log(`manualSteps[${stepCount}].stepImagePath`);

            // name 속성에 stepCount를 포함하여 배열 인덱스를 설정
            stepOrderInput.name = "manualSteps[" + stepCount + "].stepOrder";
            stepOrderInput.value = stepCount;
            stepDescriptionInput.name = "manualSteps[" + stepCount + "].stepDescription";
            stepImageInput.name = "manualSteps[" + stepCount + "].stepImagePath";


            // stepCount 증가
            stepCount++; // 단계 수 증가
            reindexSteps();
        });

        // 이벤트 위임을 이용하여 삭제 버튼 클릭 이벤트 처리
        container.addEventListener('click', function (event) {
            if (event.target.classList.contains('remove-step-button')) {
                const stepElement = event.target.closest('.manual-step');
                stepElement.remove(); // 단계 삭제
                reindexSteps(); // 삭제 후 재정렬
            }
        });

        // 모든 단계의 인덱스를 0부터 다시 설정하는 함수
        function reindexSteps() {
            const steps = container.children;
            Array.from(steps).forEach((step, index) => {
                const stepOrderInput = step.querySelector('.step-order-input');
                const stepDescriptionInput = step.querySelector('.step-description-input');
                const stepImageInput = step.querySelector('.step-image-input');

                stepOrderInput.name = "manualSteps[" + index + "].stepOrder";
                stepOrderInput.value = index;
                stepDescriptionInput.name = "manualSteps[" + index + "].stepDescription";
                stepImageInput.name = "manualSteps[" + index + "].stepImagePath"

                step.setAttribute('data-step-id', index); // 데이터 속성 갱신
            });
        }
    </script>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

