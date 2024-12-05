<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 상세</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <jsp:include page="./inc/top.jsp"/>
    <h3 class="mb-4">게시물 상세</h3>

    <div class="form-group">
        <label for="title">제목</label>
        <p id="title">${post.title}</p> <!-- 제목 -->
    </div>
    <div class="form-group">
        <label for="author">작성자</label>
        <p id="author">${post.author}</p> <!-- 작성자 -->
    </div>
    <div class="form-group">
        <label for="content">내용</label>
        <p id="content">${post.content}</p> <!-- 내용 -->
    </div>
    <div class="form-group">
        <label for="createdAt">생성일</label>
        <p id="createdAt">${post.createdAt}</p> <!-- 생성일 -->
    </div>
    <div class="form-group">
        <label for="modifiedAt">수정일</label>
        <p id="modifiedAt">${post.modifiedAt}</p> <!-- 수정일 -->
    </div>

    <!-- 수정과 삭제 버튼 -->
    <a href="../edit/${post.id}" class="btn btn-warning">수정</a>
    <td>
        <form action="../delete/${post.id}" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
            <button type="submit" class="btn btn-danger">삭제</button>
        </form>
    </td>
</div>
    <jsp:include page="./inc/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
