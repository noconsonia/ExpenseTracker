<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Forgot Password</title>

    <link href="<c:url value="../../resources/css/login.css" />" rel="stylesheet">
    <script src="../../resources/js/email.js"></script>


</head>

<body>
<div class="page">
    <div class="container">
        <div class="left">

            <form method="POST" action="${contextPath}/forgot-password" class="form-signin">
                <p1 class=resetText>Reset Your Password</p1>
                <br><br>
                <label class="text">Please enter your email address below</label>
                <label class="text"> and we will send you information to change</label>
                <label class="text">your password.</label>
                <form:form method="post" modelAttribute="user">
                    <form:input cssClass="text" id="txtEmail" path="username" type="text" placeholder="E-mail"
                                autofocus="true"/>
                    <form:errors id="lblError" path="username" element="div"/>
                    <button class="submitForgot" type="submit" id="btnValidate" value="Submit"
                            onclick="ValidateEmail()">Send
                    </button>
                </form:form>
                <label id="lblError"></label><br>
                <button class="submitForgot"><a href="/login">Back to Login?</a></button>
            </form>
        </div>
    </div>
</div>
</body>
</html>