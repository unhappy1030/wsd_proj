<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 전체 페이지 스타일 */
        html, body {
            height: 100%;
            margin: 0;
        }

        /* 로그인 폼 좌측 이미지와 우측 폼 영역 */
        .login-container {
            height: 100%;
            display: flex;
        }

        /* 왼쪽 이미지 */
        .login-image {
            flex: 1;
            background-image: url('https://i.pinimg.com/736x/d1/ef/98/d1ef98ee1783647a36a9047e264f7864.jpg');
            background-size: cover;
            background-position: center;
        }

        /* 오른쪽 폼 영역 */
        .login-form {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }

        /* 로그인 폼 스타일 */
        .form-box {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-box div {
            margin-bottom: 15px;
        }

        .form-box label {
            font-weight: bold;
        }

        .form-box button {
            width: 100%;
            background-color: #007bff;
            color: white;
            font-size: 15px;
            border: none;
            padding: 10px;
            border-radius: 5px;
        }

        .form-box button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="login-container">
    <!-- 왼쪽 이미지 영역 -->
    <div class="login-image"></div>

    <!-- 오른쪽 로그인 폼 영역 -->
    <div class="login-form">
        <div class="form-box">
            <h2>로그인</h2>
            <form method="post" action="loginOk">
                <div class="mb-3">
                    <label for="userid" class="form-label">User ID:</label>
                    <input type="text" class="form-control" id="userid" name="userid" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
