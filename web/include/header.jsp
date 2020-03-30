<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2020/3/5
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/fore/style.css" rel="stylesheet">

<script>
    function checkEmpty(id,name) {
        var value=$("#"+id).val;
        if(value.length==0){
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
</script>
</head>

</html>
