
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String jsUrl=request.getContextPath()+"/mgestyle/js/";
    String jsUrl2=request.getContextPath()+"/mgestyle/js/plugs/";
    String cssUrl=request.getContextPath()+"/mgestyle/css/";
    String imgUrl = request.getContextPath()+"/mgestyle/img/";
%>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>Site.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>zy.all.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>amazeui.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=cssUrl%>admin.css"/>
<script type="text/javascript" src="<%=jsUrl%>jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=jsUrl2%>Jqueryplugs.js"></script>
<script type="text/javascript" src="<%=jsUrl%>_layout.js"></script>
<script type="text/javascript" src="<%=jsUrl2%>jquery.SuperSlide.source.js"></script>
