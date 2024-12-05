<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 글 작성</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <jsp:include page="./inc/top.jsp"/>
    <h3 class="mb-4">새 글 작성</h3>
    <form id="postForm" action="write_ok" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
            <small id="titleError" class="form-text text-danger" style="display: none;">제목을 입력해 주세요.</small>
        </div>
        <div class="form-group">
            <label for="author">작성자</label>
            <input type="text" class="form-control" id="author" name="author" required>
            <small id="authorError" class="form-text text-danger" style="display: none;">작성자를 입력해 주세요.</small>
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="4" required></textarea>
            <small id="contentError" class="form-text text-danger" style="display: none;">내용을 입력해 주세요.</small>
        </div>
        <button type="submit" class="btn btn-primary">작성 완료</button>
    </form>
</div>
<jsp:include page="./inc/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("postForm");
        let formChanged = false;

        // 필드 변경 감지 및 validation 메시지 표시
        form.querySelectorAll("input, textarea").forEach(field => {
            field.addEventListener("input", () => {
                formChanged = true;
                validateField(field);  // 각 필드 유효성 검사
            });
        });

        // 페이지 이탈 시 경고 메시지
        window.addEventListener("beforeunload", (e) => {
            if (formChanged) {
                e.preventDefault();
                e.returnValue = '';
            }
        });

        // 폼 제출 시 모든 필드 검증
        form.addEventListener("submit", (e) => {
            const isValid = validateForm();
            if (!isValid) {
                e.preventDefault(); // 검증 실패 시 제출 방지
            }
            formChanged = false;
        });

        // 개별 필드 유효성 검사 함수
        function validateField(field) {
            const errorElement = document.getElementById(field.id + "Error");
            if (field.value.trim() === "") {
                errorElement.style.display = "block";
            } else {
                errorElement.style.display = "none";
            }
        }

        // 폼 전체 유효성 검사 함수
        function validateForm() {
            let isValid = true;
            form.querySelectorAll("input[required], textarea[required]").forEach(field => {
                validateField(field);
                if (field.value.trim() === "") {
                    isValid = false;
                }
            });
            return isValid;
        }
    });
</script>
</body>
</html>
