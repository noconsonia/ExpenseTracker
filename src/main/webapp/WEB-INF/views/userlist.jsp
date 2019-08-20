<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ExpenseTracker</title>


    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure to delete this user?")) {
                window.location.href = "/admin/delete-user/" + id;
            }
        }
    </script>


</head>
<body>


<table id="example" class="display">
    <thead>
    <tr>

        <th>User</th>
        <th>Role</th>
        <th>Delete</th>


    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userWithRole}">
        <tr>

            <td>${user.username}</td>
            <td>${user.roles}</td>

            <td><a href="#" onclick="confirmDelete(${user.id}, '${user.id}')">Delete</a></td>


        </tr>
    </c:forEach>


    </tbody>
</table>


</body>
</html>


