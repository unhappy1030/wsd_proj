<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 실패</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('${pageContext.request.contextPath}/resources/images/login-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Roboto', sans-serif;
        }
        .card {
            max-width: 400px;
            width: 90%;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 0.6s ease-out;
        }
        .card-header {
            color: black;
            font-size: 1.5rem;
            text-align: center;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            padding: 1.25rem;
        }
        .card-body {
            text-align: center;
            padding: 1.5rem;
        }
        .card-body p {
            font-size: 1rem;
            margin-bottom: 1.5rem;
            color: #555;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        로그인 실패
    </div>
    <div class="card-body">
        <p>로그인에 실패했습니다. 다시 시도해주세요.</p>
        <button type="button" class="btn btn-primary" onclick="redirect()">확인</button>
    </div>
</div>

<script>
    function redirect() {
        window.location.href = "../login/login"; // 이동할 경로
    }
</script>
</body>
</html>
