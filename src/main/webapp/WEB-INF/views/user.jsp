<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>ExpenseTracker</title>
    <meta charset="utf-8">

    <style>
        table, th, td {
            border: 1px solid black;
        } </style>

</head>
<body>

<table>

    <form:form method="post" modelAttribute="user">


    <label for="username">Username:</label>
    <label for="username">Password:</label>
    <label for="username">Confirm Password:</label>


        <form:input path="username" itemValue="id" id="username"/>
        <form:input path="password" itemValue="id" id="password"/>
        <form:input path="passwordConfirm" itemValue="id" id="passwordConfirm"/>

        <form:errors path="username" element="div"/>


    <input type="submit" value="Save">

    </form:form>
</body>

</html>

