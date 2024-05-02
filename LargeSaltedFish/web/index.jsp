<%-- index.jsp --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/errorPage/ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>跳转使用</title>
</head>
<body>
<%
  response.sendRedirect("login/Login.jsp");
%>
</body>
</html>