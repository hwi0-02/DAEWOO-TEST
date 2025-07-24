<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>홈</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/layout.css' />">
</head>
<body>
 <!-- 네비게이션 바 -->
  <div class="navbar">
    <div class="logo">로고</div>
    <div class="auth">
      <sec:authorize access="isAuthenticated()">
          환영합니다, <sec:authentication property="principal.username"/>님
          <form action="<c:url value="/logout"/>" method="post" style="display:inline;">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              <button type="submit">로그아웃</button>
          </form>
      </sec:authorize>
      <sec:authorize access="isAnonymous()">
          <button class="login-btn" onclick="location.href='/login'">로그인</button>
          <button class="signup-btn" onclick="location.href='/register'">회원가입</button>
      </sec:authorize>
    </div>
  </div>

  <!-- 서브 네비게이션 -->
  <div class="subnav">
    <a href="/">메인페이지</a>
    <a href="/gallery">갤러리</a>
    <a href="/externalData">외부 데이터</a>
    <a href="/board">게시판</a>
  </div>

  <!-- 메인 컨테이너 -->
  <div class="container">

    <!-- 사이드바 -->
    <aside class="sidebar">
      <h3>사이드바</h3>
      <ul>
        <li><a href="#">사이드바 링크 1</a></li>
        <li><a href="#">사이드바 링크 2</a></li>
        <li><a href="#">사이드바 링크 3</a></li>
      </ul>
    </aside>
  <section>
    <h1>환영합니다!</h1>
    <p>로그인에 성공하셨습니다.</p>
  </section>
  </div>
  <footer class="footer">
    © 2025 회사명. All rights reserved.
  </footer>
</body>
</html>