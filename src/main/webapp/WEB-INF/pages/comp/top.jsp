<%--
  Created by IntelliJ IDEA.
  User: white
  Date: 24. 12. 13.
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <!-- 사이트 이름 -->
        <a class="navbar-brand" href="<%= request.getContextPath() %>/">MySite</a>

        <!-- 링크 버튼 -->
        <div class="d-flex">
            <a class="btn btn-outline-light me-2" href="<%= request.getContextPath() %>/">Home</a>
            <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/custom/">My Page</a>
            <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/login/logout">Logout</a>
        </div>
    </div>
</nav>
