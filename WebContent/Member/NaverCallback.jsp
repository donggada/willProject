<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("4E3Yn1sL3nJ9vkuGv6_4", "http://localhost:8081/WillProject_0.1(09.18)_%EC%84%A0%ED%83%9D%EB%82%A0%EC%A7%9C%EC%88%98%EC%A0%95/Member/NaverCallback.jsp");
  // 접근 토큰 값 출력
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    var snsid=(naver_id_login.getProfileData('email'));
	location.href='../snsLogin.me?id='+snsid;
  }
</script>
</body>
</html>