<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });

        var left = window.innerWidth/2+162;
        $("div.loginSmallDiv").css("left",left);
    })
</script>

<div id="loginDiv" style="background-color: #c9e2b3;width: 100%;height: 500px;margin-bottom:10px;margin-top: 0px">


    <div style="background-color: white;height: 10px"></div>
    <form class="loginForm" action="foreloginadmin" method="post">
        <div id="loginSmallDiv" style="background-color: white;
       margin-left: 45%;
	   width: 350px;
	   height: 400px;
	   padding: 60px 25px 80px 25px;margin-top: 30px;background-color: #c9e2b3">
            <div  style="position:absolute;top: 240px;display: block" class="loginErrorMessageDiv">
                <div class="alert alert-danger" >

                    <span>密码错误，请重新输入</span>
                </div>
            </div>

            <div style="position: absolute" class="login_acount_text">管理员登录</div>

            <div class="loginInput " >
                <span class="loginInputIcon ">
                    <span class=" glyphicon glyphicon-lock"></span>
                </span>
                <input id="password" name="password" type="password" placeholder="密码" type="text">
            </div>

            <div style="margin-top:20px">
                <button class="btn btn-block button" type="submit">登录</button>
            </div>
        </div>
    </form>

</div>