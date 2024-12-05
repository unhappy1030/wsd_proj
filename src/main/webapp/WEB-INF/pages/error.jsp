<%--
  Created by IntelliJ IDEA.
  User: white
  Date: 24. 12. 5.
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>

JSP에서 로그인 실패 시 alert을 띄우고 "확인"을 누르면 특정 경로로 이동하려면 JavaScript를 사용하여 구현할 수 있습니다. 다음은 이를 구현한 코드 예시입니다:

jsp
코드 복사
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 실패</title>
    <script>
        function showError() {
            alert("로그인에 실패했습니다. 다시 시도해주세요.");
            window.location.href = "../login/login"; // 이동할 경로
        }
    </script>
</head>
<body onload="showError()"> <!-- 페이지 로드 시 showError 함수 실행 -->
</body>
</html>