<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ExpenseTracker</title>

    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure to delete this cost?")) {
                window.location.href = "/cost/delete/" + id;
            }
        }
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../../resources/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="../../resources/js/datatable.js"></script>
    <link href="../../resources/css/all.min.css" rel="stylesheet" type="text/css">
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
            <li class="nav-item">
                <a class="nav-link" href="/client/all">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Clients</span></a>
            </li>

        </ul>

        <div id="content-wrapper">

            <div class="container-fluid">
                <spring:url value="/report/?type=xls" var="xlsURL"/>
                <a href="${xlsURL }">Download Excel</a>
                <img src="../../resources/images/excel.png" alt="Download Excel" width="25" height="25">
                <table id="example" class="display" style="width:80%">
                    <thead>
                    <tr>

                        <th>Date</th>
                        <th>Cost Center</th>
                        <th>Account</th>
                        <th>Client</th>
                        <th>Amount</th>
                        <th>Description</th>
                        <th>Payment</th>
                        <th>Invoice Number</th>
                        <th>Department</th>
                        <th>Delete</th>
                        <th>Edit</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="costs" items="${allcosts}">
                        <tr>

                            <td>${costs.salesDate.toString()}</td>
                            <td>${costs.mpk.code}</td>
                            <td>${costs.account.code}</td>
                            <td>${costs.client.name}</td>
                            <td>${costs.amount.toString()}</td>
                            <td>${costs.description.toString()}</td>
                            <td>${costs.payment.type}</td>
                            <td>${costs.invoiceNumber.toString()}</td>
                            <td>${costs.department.name}</td>
                            <td><a href="#" onclick="confirmDelete(${costs.id})">Delete</a></td>
                            <td><a href="/cost/update/${costs.id}">Edit</a></td>


                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

        </div>
    </div>
</form>

</body>
<script src="../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../resources/js/jquery.easing.min.js"></script>
<script src="../../resources/js/sb-admin.min.js"></script>
</html>


