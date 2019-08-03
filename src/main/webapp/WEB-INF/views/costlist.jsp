<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ExpenseTracker</title>
    <link href="<c:url value="../../resources/js/table.js" />" rel="stylesheet">

    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure to delete this cost?")) {
                window.location.href = "/cost/delete/" + id;
            }
        }
    </script>

</head>
<body>
<div id="example-table">
    <table border="1">
        <tr>
            <td>ID</td>
            <th>Date</th>
            <th>MPK</th>
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
        <c:forEach var="costs" items="${allcosts}">
            <tr>
                <td>${costs.id}</td>
                <td>${costs.salesDate.toString()}</td>
                <td>${costs.mpk.code}</td>
                <td>${costs.account.code}</td>
                <td>${costs.client.name}</td>
                <td>${costs.amount.toString()}</td>
                <td>${costs.description.toString()}</td>
                <td>${costs.payment.type}</td>
                <td>${costs.invoiceNumber.toString()}</td>
                <td>${costs.department.name}</td>


                <td><a href="#" onclick="confirmDelete(${costs.id}, '${costs.id}')">Delete</a></td>
                <td><a href="/cost/update/${costs.id}">Edit</a>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
