<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head><title>Reset Password</title></head>
<link href="<c:url value="../../resources/css/login.css" />" rel="stylesheet">
<body>

<div class="page">
    <div class="page">
        <div class="container">
            <div class="left">
                <form:form method="post" modelAttribute="passwordResetForm">

                    <label class="text">Please enter your new password:</label><br><br>

                    <label class="text">Password:</label>
                    <form:password path="password" cssClass="text" itemValue="id" id="password" placeholder="Password" autofocus="true"/>
                    <label class="text">Confirm Password</label>
                    <form:password path="confirmPassword" cssClass="text" itemValue="id" id="password" placeholder="Confirm Password" autofocus="true"/>
                    <button class="submitForgot" >Send</button>

                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
