<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <jsp:include page="./inc/top.jsp"/>

    <form action="search" method="get" class="form-inline mb-3">
        <input type="text" name="keyword" class="form-control mr-2" placeholder="제목 검색" value="${param.keyword}">
        <button type="submit" class="btn btn-primary">검색</button>
    </form>
    <div>
        <a href="../login/logout">logout</a>
    </div>
    <a href="write" class="btn btn-primary mb-3">새 글 작성</a>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성자</th>
            <th>생성일</th>
            <th>수정일</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${list.size() - status.index}</td>
            <td><a href="view/${u.id}">${u.title}</a></td>
            <td>${u.author}</td>
            <td>${u.createdAt}</td>
            <td>${u.modifiedAt}</td>
            <td><a href="edit/${u.id}" class="btn btn-warning btn-sm">수정</a></td>
            <td>
                <form action="delete/${u.id}" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                </form>
            </td>

        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="./inc/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
