<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ExpenseTracker</title>
    <meta charset="utf-8">
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
<form action="${pageContext.request.contextPath}/appLogout" method="POST">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="/cost/all">ExpenseTracker</a>

        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
            </div>
        </form>

        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="userName">${pageContext.request.userPrincipal.name}</li>
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="button" href="/user/profile">Profile</a>
            </li>
            <li class="nav-item dropdown no-arrow mx-1">
                <input class="button" type="submit" value="Logout"/>
            </li>
        </ul>
    </nav>

    <div class="page">

        <form:form method="post" modelAttribute="user">
        <label class="page__field">Create a new account:</label><br><br>
        <label class="field a-field a-field_a3 page__field">
            <span class="a-field__label">E-mail</span><br>
            <form:input path="username" itemValue="id"
                        class="field__input a-field__input" placeholder="e.g. user@gmail.com"></form:input>
            <label><form:errors path="username" element="div"/></label>


            </span>
        </label><br><br>
        <label class="field a-field a-field_a3 page__field">
            <span class="a-field__label">Password</span><br>
            <form:password path="password" itemValue="id" id="password" class="field__input a-field__input"
                           placeholder="Password"></form:password>
            <label><form:errors path="password" element="div"/></label>

            </span>
        </label>
        <br>
        <span class="a-field__label">Confirm Password</span><br>
        <label class="field a-field a-field_a3 page__field">
            <form:password path="passwordConfirm" itemValue="id" id="passwordConfirm"
                           class="field__input a-field__input"
                           placeholder="Password"></form:password>
            <label><form:errors path="passwordConfirm" element="div"/></label>
            </span>
        </label>
        <br><br>
        <input type="submit" class="button" value="Save">
    </div>
    </form:form>
</body>
</html>

