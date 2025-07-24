<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/register.css' />">
  <title>회원가입</title>
</head>
<body>
  <nav>
    <a href="/">메인</a>
    <a href="/login">로그인</a>
    <a href="/register">회원가입</a>
  </nav>

  <section>
    <div class="signup-box">
      <form action="/register" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <table>
          <tr>
            <th>이름</th>
            <td><input type="text" name="name" required></td>
          </tr>
          <tr>
            <th>아이디</th>
            <td><input type="text" name="username" required></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><input type="password" name="password" required></td>
          </tr>
          <tr>
            <th>비밀번호 확인</th>
            <td>
              <div class="confirm-row">
                <input type="password" name="confirmPassword" required>
                <button type="button" onclick="checkPassword()">비밀번호 확인</button>
              </div>
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><input type="email" name="email" required></td>
          </tr>
        </table>
        <div class="btn-row">
          <button type="button" class="btn-cancel" onclick="location.href='/'">가입취소</button>
          <button type="submit" class="btn-submit">회원가입</button>
        </div>
      </form>
    </div>
  </section>

  <script>
    function checkPassword() {
      var pw = document.getElementsByName('password')[0].value;
      var cpw = document.getElementsByName('confirmPassword')[0].value;
      if (pw && cpw && pw === cpw) {
        alert('비밀번호가 일치합니다.');
      } else {
        alert('비밀번호가 일치하지 않습니다.');
      }
    }
  </script>
</body>
</html>