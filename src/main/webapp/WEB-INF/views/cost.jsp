<%@ page contentType="text/html;charset=UTF-8" language="" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>ExpenseTracker</title>
</head>
<body>
<form:form method="post" modelAttribute="cost">

    <label for="mpk">Mpk:</label>
    <form:select path="mpk" items="${mpk}" itemLabel="code" itemValue="id" id="mpk"/>
    <form:errors path="mpk" element="div"/>

    <br>

    <label for="account">Konto:</label>
    <form:select path="account" items="${account}" itemLabel="code" itemValue="id" id="account"/>
    <form:errors path="account" element="div"/>

    <br>

    <label for="payment">Forma płatności:</label>
    <form:select path="payment" items="${payment}" itemLabel="type" itemValue="id" id="payment"/>
    <form:errors path="payment" element="div"/>

    <br>

    <input type="submit" value="Save">
</form:form>
</body>
</html>

