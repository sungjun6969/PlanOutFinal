<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLANOUT LOGIN</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>P L A N O U T</h1>
            <p>로그인</p>
        </div>

        <form method="post">
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <span class="signup-link"><a href="signup">회원가입하기</a></span>
            </div>

            <div class="form-actions">
                <button type="submit" class="submit-btn">로그인</button>
                <span class="cancel-link"><a href=".">취소</a></span>
            </div>
        </form>

        <div class="footer">
            <p class="info-text">아이디가 없으신가요? 회원가입을 눌러 가입하세요</p>
            <span class="login-text">P L A N O U T</span>
        </div>
    </div>
</body>
</html>
