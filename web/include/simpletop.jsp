<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2020/3/5
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="top">
    <a href=home.jsp>
        <span style="color:#284CA5;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
        首页
    </a>

    <span>欢迎您</span>
    <c:if test="${!empty user}">
        <a href="login.jsp">${user.name}</a>
        <a href="forelogout">退出</a>
    </c:if>

    <c:if test="${empty user}">
        <a href="login.jsp">请登录</a>
        <a href="register.jsp">免费注册</a>
    </c:if>
</nav>
