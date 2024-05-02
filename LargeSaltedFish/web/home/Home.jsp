<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" errorPage="/errorPage/ErrorPage.jsp" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
    %>
    您于<%=format%>登录成功

<div>
</div>
</body>
</html>
