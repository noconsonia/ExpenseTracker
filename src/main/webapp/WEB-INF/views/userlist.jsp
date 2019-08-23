<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User</title>
    <meta charset="utf-8">
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">

    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure to delete this user?")) {
                window.location.href = "/admin/delete-user/" + id;
            }
        }
    </script>
</head>

<html>
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

    <table id="example" class="display" style="margin-left: 40px">
        <thead>
        <tr>

            <th>ID</th>
            <th>Username</th>
            <th>Role</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userWithRole}">
            <tr>
                <td>${user[0]}</td>
                <td>${user[1]}</td>
                <td>${user[2]}</td>
                <td><a href="#" onclick="confirmDelete(${user[0]}, '${user[0]}')">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <button class="submit" style="margin-left: 40px"><a href="/cost/all">Back to Main Page?</a></button>
</form>

</body>
</html>


