<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>메인화면</title>

  <link rel="stylesheet" href="<c:url value='/resources/css/layout.css' />">
</head>
<body>

  <div class="navbar">
    <div class="logo">로고</div>
    <div class="auth">
      <button class="login-btn" onclick="location.href='/login'">로그인</button>
      <button class="signup-btn" onclick="location.href='/register'">회원가입</button>
    </div>
  </div>

  <div class="subnav">
    <a href="/">메인페이지</a>
    <a href="/gallery">갤러리</a>
    <a href="/externalData">외부 데이터</a>
    <a href="/board">게시판</a>
  </div>

  <div class="container">

    <aside class="sidebar">
      <h3>사이드바</h3>
      <ul>
        <li><a href="#">사이드바 링크 1</a></li>
        <li><a href="#">사이드바 링크 2</a></li>
        <li><a href="#">사이드바 링크 3</a></li>
      </ul>
    </aside>

    <section class="main-content">
      <h2>메인 콘텐츠</h2>
      <p>여기에 메인 콘텐츠가 들어갑니다.</p>
    </section>
  </div>

  <footer class="footer">
    © 2025 회사명. All rights reserved.
  </footer>

</body>
</html>
