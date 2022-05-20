<%--
  Created by IntelliJ IDEA.
  User: Fh
  Date: 2022/5/19
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head lang="en">
    <meta charset="UTF-8" />
    <title>error</title>
</head>

<body>
<div style="width:700px;height: 500px;margin:50px auto;background: url(/statics/images/ErrorNaughtyDog.png) no-repeat 24px -55px">
<%--    <img src="/statics/images/ErrorNaughtyDog.png" style="">--%>
    系统出现了异常，异常原因是：[[${exception}]]<br><br>
    异常地址：[[${url}]]
    <br>
    <br>
    <a href="/a">返回主页</a>
</div>
</body>
</html>

