<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add cost - ExpenseTracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="../../resources/css/sb-admin.css" rel="stylesheet">
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>


    <style>
        table, th, td {
            border: 1px solid black;
        } </style>

</head>
<body id="page-top">
<form action="${pageContext.request.contextPath}/appLogout" method="POST">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

        <a class="navbar-brand mr-1" href="/cost/all">ExpenseTracker</a>

        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
            </div>
        </form>

        <!-- Navbar -->
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

        <form:form method="post" modelAttribute="cost">


        <table class="table">
            <thead>
            <tr>
                <th><label for="datepicker">Sales date:</label></th>
                <th><label for="mpk">Cost Center:</label></th>
                <th><label for="account">Account:</label></th>
                <th><label for="client">Client:</label></th>
                <th><label for="amount">Net PLN:</label></th>
                <th><label for="description">Description:</label></th>
                <th><label for="payment">Payment:</label></th>
                <th><label for="invoiceNumber">Invoice number:</label></th>
                <th><label for="department">Department:</label></th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <div class="date"><form:input type="text" id="datepicker"
                                                  path="salesDate" placeholder="mm/dd/yyyy"/></div>
                </td>
                <td><form:select path="mpk" items="${mpk}" itemLabel="code" itemValue="id" id="mpk"/></td>
                <td><form:select path="account" items="${account}" itemLabel="code" itemValue="id"
                                 id="account"/></td>
                <td><form:select path="client" items="${client}" itemLabel="name" itemValue="id" id="client"/></td>
                <td><form:input path="amount" onChange="this.value=this.value.replace(/,/g, '.');"/></td>
                <td><form:textarea path="description" itemValue="id" id="description"/></td>
                <td><form:select path="payment" items="${payment}" itemLabel="type" itemValue="id" id="payment"/></td>
                <td><form:textarea path="invoiceNumber" itemValue="id" id="invoiceNumber"/></td>
                <td><form:select path="department" items="${department}" itemLabel="name" itemValue="id"
                                 id="department"/></td>

            </tr>
            </tbody>

            <tbody>
            <tr>
                <td><form:errors path="salesDate" element="div"/></td>
                <td><form:errors path="mpk" element="div"/></td>
                <td><form:errors path="account" element="div"/></td>
                <td><form:errors path="client" element="div"/></td>
                <td><form:errors path="amount" element="div"/></td>
                <td><form:errors path="description" element="div"/></td>
                <td><form:errors path="payment" element="div"/></td>
                <td><form:errors path="invoiceNumber" element="div"/></td>
                <td><form:errors path="department" element="div"/></td>

            </tr>
            </tbody>
        </table>
        <input type="submit" class="buttonSave" value="Save">

        </form:form>
</body>

</html>

