<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css' />">
  <title>로그인</title>
</head>
<body>
  <nav>
    <a href="/">메인</a>
    <a href="/login">로그인</a>
    <a href="/register">회원가입</a>
  </nav>

  <section>
    <div class="login-box">
      <form action="/login" method="post">
        <input type="text" name="username" placeholder="아이디" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">로그인</button>
      </form>
    </div>
  </section>
  <script>
    <c:if test="${not empty message}">
      alert("${message}");
    </c:if>
  </script>
</body>
</html>