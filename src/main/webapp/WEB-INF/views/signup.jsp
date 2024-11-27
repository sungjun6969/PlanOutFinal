<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/signup.css">
    <script src="resources/js/signup.js"></script>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <h1>P L A N O U T</h1>
            <p>회원가입</p>
        </div>

        <form id="signup" method="post">
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" placeholder="아이디를 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="password_check">비밀번호 확인</label>
                <input type="password" id="password_check" name="passwordcheck" placeholder="비밀번호를 다시 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="username">성명</label>
                <input type="text" id="username" name="username" placeholder="성명을 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" placeholder="전화번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <button type="button" id="userid_check_async" class="check-btn">계정생성확인</button>
            </div>

            <div class="form-actions">
                <button type="submit" id="signup_button" class="submit-btn">가입하기</button>
                <span class="cancel-link"><a href=".">취소</a></span>
            </div>
        </form>
    </div>
</body>
</html>
