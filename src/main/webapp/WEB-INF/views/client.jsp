<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add client</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
    <table>

        <form:form method="post" modelAttribute="client">


        <table class="client">
            <thead>
            <tr>
                <th><label for="name">Client name:</label></th>
                <th><label for="nip">TAX ID:</label></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><form:input path="name"></form:input></td>
                <td><form:input path="nip"></form:input></td>

            </tr>
            </tbody>

            <tbody>
            <tr>
                <td><form:errors path="name" element="div"/></td>
                <td><form:errors path="nip" element="div"/></td>

            </tr>
            </tbody>
        </table>
        <input type="submit" class="buttonClient" value="Save">

        </form:form><br>
        <button style="margin-left: 50px"><a href="/cost/all">Back to Main Page?</a></button>
</body>
</html>
