<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Log in</title>
    <link href="<c:url value="../../resources/css/login.css" />" rel="stylesheet">
</head>

<body>

<div class="page">
    <div class="container">
        <div class="left">

            <c:if test="${pageContext.request.userPrincipal.name == null}">

            <div class="login">Login</div>
            <div class="eula">Sign in to a ExpenseTracker
            </div>
        </div>
        <div class="right">

            <form method="POST" action="${contextPath}/login" class="form-signin">
                <sec:csrfInput/>
                <div class="form ${error != null ? 'has-error' : ''}">
                    <span>${message}</span>

                    <p1 class="label">E-mail:</p1>
                    <input name="username" type="text" class="form-control" placeholder="E-mail"
                           autofocus="true"/>
                    <p1 class="label">Password:</p1>
                    <input name="password" type="password" class="form-control" placeholder="Password"/>
                    <br>
                    <br>
                    <button class="submit" type="submit">Log In</button>
                    <br>
                    <span id="lblErrorLogin">${error}</span>
                    <input type="hidden" name="${csrf.parameterName}" value="${_csrf.token}"/>
                    <br><br>
                    <button class="submit"><a href="/forgot-password">Forgot Password?</a></button>
                    </c:if>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <br><br><br><br>
                        <p1 class="redirect">Welcome ${pageContext.request.userPrincipal.name}!</p1>
                        <br>
                        <p1>You will be redirected to /cost/all after 3 seconds.</p1>
                        <meta http-equiv="refresh" content="2 ;URL=http://localhost:8080/cost/all">
                    </c:if>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
