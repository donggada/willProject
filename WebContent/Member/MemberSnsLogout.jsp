<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

<script>
Kakao.init('8fe85f780b2cbfb44bd4d9feac11d749'); //카카오에서 제공 myceo.co.kr 수정
Kakao.Auth.logout(
function(obj) {
if(obj==true){
	location.href='../index.jsp';
}else{}
 
 }
);

</script>

</body>
</html>