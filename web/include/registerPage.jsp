<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility","visible");
        </c:if>

        $(".registerForm").submit(function(){
            if(0==$("#name").val().length){
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#repeatpassword").val().length){
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if($("#password").val() !=$("#repeatpassword").val()){
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }

            return true;
        });
    })
</script>

<form method="post" style="background-color: #c9e2b3;left: 40%;margin-top: 10px" action="foreregister" class="registerForm">

    <div style="margin: 0 0 0 0;height: 490px" class="registerDiv">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage"></span>
            </div>
        </div>

        <table class="registerTable"  align="center" >
            <tr>
                <td   class="registerTip registerTableLeftTD">设置用户名</td>
                <td></td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">用户名</td>
                <td  class="registerTableRightTD"><input id="name" name="name" placeholder="用户名" > </td>
            </tr>
            <tr>
                <td  class="registerTip registerTableLeftTD">设置登陆密码</td>

            </tr>
            <tr>
                <td class="registerTableLeftTD">登陆密码</td>
                <td class="registerTableRightTD"><input id="password" name="password" type="password"  placeholder="设置你的登陆密码" > </td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">密码确认</td>
                <td class="registerTableRightTD"><input id="repeatpassword" type="password"   placeholder="请确认" > </td>
            </tr>

            <tr>
                <td>

                </td>
                <td class="registerButtonTD">
                    <a  href="registerSuccess.jsp"><button style="width: 80px; background-color: #284CA5">提   交</button></a>
                </td>
            </tr>
                <td>

                </td>
            <tr>
            </tr>
            <td>

            </td>
            <tr>

            </tr>
        </table>

    </div>


</form>