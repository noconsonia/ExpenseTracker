<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>ExpenseTracker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<body>

<table>

    <form:form method="post" modelAttribute="cost">


    <table>
        <thead>
        <tr>
            <th><label for="datepicker">Sales date:</label></th>
            <th><label for="mpk">Mpk:</label></th>
            <th><label for="account">Account:</label></th>
            <th><label for="payment">Payment:</label></th>
            <th><label for="amount">Net PLN:</label></th>
            <th><label for="description">Description:</label></th>
            <th><label for="invoiceNumber">Invoice number:</label></th>
            <th><label for="client">Client:</label></th>


        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div class="date"><form:input type="text" id="datepicker"
                                              path="salesDate" placeholder="mm/dd/yyyy"/></div>
            </td>
            <td><form:select path="mpk.id" items="${mpk}" itemLabel="code" itemValue="id" id="mpk"/></td>
            <td><form:select class="chosen" path="account.id" items="${account}" itemLabel="code" itemValue="id"
                             id="account"/></td>
            <td><form:select path="payment.id" items="${payment}" itemLabel="type" itemValue="id" id="payment"/></td>
            <td><form:input path="amount" itemValue="id" id="amount"/></td>
            <td><form:textarea path="description" itemValue="id" id="description"/></td>
            <td><form:textarea path="invoiceNumber" itemValue="id" id="invoiceNumber"/></td>
            <td><form:select path="client.id" items="${client}" itemLabel="name" itemValue="id" id="client"/></td>

        </tr>
        </tbody>

        <tbody>
        <tr>

            <td><form:errors path="mpk.id" element="div"/></td>
            <td><form:errors path="account.id" element="div"/></td>
            <td><form:errors path="payment.id" element="div"/></td>
            <td><form:errors path="amount" element="div"/></td>
            <td><form:errors path="description" element="div"/></td>
            <td><form:errors path="invoiceNumber" element="div"/></td>
            <td><form:errors path="client.id" element="div"/></td>

            <td></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="Save">

    </form:form>
</body>

</html

