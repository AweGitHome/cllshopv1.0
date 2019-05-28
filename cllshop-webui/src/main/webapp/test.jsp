<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/uploadPic" enctype="multipart/form-data" method="post">
        <input type="file" name="file">
        <input type="submit" value="submit">
    </form>
</body>
</html>
