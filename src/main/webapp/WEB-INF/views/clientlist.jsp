<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clients</title>
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="../../resources/css/all.min.css" rel="stylesheet" type="text/css">

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

    <table id="tableClient" class="display" style="width:80%">
        <thead>
        <tr>

            <th>ID</th>
            <th>Client name</th>
            <th>Tax ID</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="client" items="${allclients}">
            <tr>

                <td>${client.id}</td>
                <td>${client.name}</td>
                <td>${client.nip}</td>

                <td><a href="/client/update/${client.id}">Edit</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>
    <button style="margin-left: 50px"><a href="/cost/all">Back to Main Page?</a></button>
    <button style="margin-left: 20px"><a href="/client/add-client">Add new client?</a></button>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</form>
</body>
<script src="../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/jquery.easing.min.js"></script>
<script src="../../resources/js/sb-admin.min.js"></script>
</html>
