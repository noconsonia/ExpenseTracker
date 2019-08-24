<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="../../resources/css/all.min.css" rel="stylesheet" type="text/css">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">
    <script type="text/javascript" src="../../resources/js/hightables.min.js"></script>


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

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="/cost/all">
                <i class="fas fa-fw fa-table"></i>
                <span>Table</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/cost/add">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Add cost</span>
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Reports</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <h6 class="dropdown-header">Action:</h6>
                <a class="dropdown-item" href="/cost/report-client">Client</a>
                <a class="dropdown-item" href="/cost/report-department">Department</a>
                <a class="dropdown-item" href="/cost/report-mpk">Cost Center</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/client/add-client">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Add client</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/client/all">
                <i class="fas fa-fw fa-table"></i>
                <span>Clients</span></a>
        </li>
    </ul>
    <div class="chart">
        <table class="render-to-line-chart" data-order="descending">
            <thead>
            <tr>

                <th>Department</th>
                <th>Net PLN</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="costs" items="${allcostsbyDepartment}">

                <tr>
                    <td>${costs[0]}</td>
                    <td>${costs[1]}</td>
                </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>
</div>
</form>
</body>
<script src="../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/jquery.easing.min.js"></script>
<script src="../../resources/js/sb-admin.min.js"></script>
</html>