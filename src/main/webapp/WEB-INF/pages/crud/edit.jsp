<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시물 수정</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <jsp:include page="./inc/top.jsp"/>
  <h3 class="mb-4">게시물 수정</h3>
  <form:form id="editForm" modelAttribute="post" action="../edit_ok" method="post">
    <form:hidden path="id"/>

    <div class="form-group">
      <label for="title">제목</label>
      <form:input type="text" class="form-control" id="title" path="title" required="true"/>
      <small id="titleError" class="form-text text-danger" style="display: none;">제목을 입력해 주세요.</small>
    </div>

    <div class="form-group">
      <label for="author">작성자</label>
      <form:input type="text" class="form-control" id="author" path="author" required="true"/>
      <small id="authorError" class="form-text text-danger" style="display: none;">작성자를 입력해 주세요.</small>
    </div>

    <div class="form-group">
      <label for="content">내용</label>
      <form:textarea cssClass="form-control" id="content" rows="4" path="content" required="true"></form:textarea>
      <small id="contentError" class="form-text text-danger" style="display: none;">내용을 입력해 주세요.</small>
    </div>

    <button type="submit" class="btn btn-primary">수정 완료</button>
  </form:form>
</div>
<jsp:include page="./inc/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("editForm");
    let formChanged = false;
    const initialValues = {
      title: "${post.title}",
      author: "${post.author}",
      content: "${post.content}"
    };

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
      if (!isValid || !hasChanged()) {
        e.preventDefault(); // 검증 실패 시 제출 방지
        alert("변경 사항이 없거나 필수 입력 항목이 비어 있습니다.");
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

    // 필드 변경 여부 확인 함수
    function hasChanged() {
      return (
              document.getElementById("title").value !== initialValues.title ||
              document.getElementById("author").value !== initialValues.author ||
              document.getElementById("content").value !== initialValues.content
      );
    }
  });
</script>
</body>
</html>
