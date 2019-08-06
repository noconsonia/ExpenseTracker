<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ExpenseTracker</title>


    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure to delete this user?")) {
                window.location.href = "/user/delete/" + id;
            }
        }
    </script>


</head>
<body>


<table id="example" class="display">
    <thead>
    <tr>
        <th>ID</th>
        <th>User</th>


    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td><a href="#" onclick="confirmDelete(${user.id}, '${user.id}')">Delete</a></td>
            <td><a href="/user/update/${user.id}">Edit</a></td>


        </tr>
    </c:forEach>
    </tbody>
</table>


</body>
</html>


