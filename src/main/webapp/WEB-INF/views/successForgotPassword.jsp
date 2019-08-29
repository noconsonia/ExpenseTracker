<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Forgot Password</title>

    <link href="<c:url value="../../resources/css/login.css" />" rel="stylesheet">

</head>

<body>
<div class="page">
    <div class="container">
        <div class="left">

            <form method="POST" class="form-signin">

                <label class="text">If a user exist with that email We'll send over </label>
                <label class="text"> the password reset instructions.</label>
                <br><br>
                <label class="text">You will be redirected to Login page after </label>
                <label class="text">5 seconds.</label>
                <meta http-equiv="refresh" content="5 ;URL=https://app-expensetracker.herokuapp.com/login">
            </form>
        </div>
    </div>
</div>
</body>
</html>