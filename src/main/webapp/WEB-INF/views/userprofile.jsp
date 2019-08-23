<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
<form action="${pageContext.request.contextPath}/appLogout" method="POST">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="/cost/all">ExpenseTracker</a>
        <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>

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
</form>
<nav style="margin-left: 50px">Hello ${pageContext.request.userPrincipal.name}!</nav>
<br>
<button class="submit" style="margin-left: 50px"><a href="/cost/all">Back to Main Page?</a></button>
</body>
</html>
