<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Registration as a User</title>
    <style>
        form{
            width: 500px;
            align-items: center;
        }
        #formDiv{
            align-items: center;
        }
    </style>
</head>
<body>

<div align="center" id="formDiv">

    <form:form method="post" modelAttribute="user" align="center" id="formDiv">
        <div class="form-group">
        </div>

        <div class="form-group">

            <label for="lastNameId">Last Name</label>
            <form:input path="username" id="lastNameId" type="text" class="form-control"/>
            <form:errors path="username" element="div"></form:errors>
        </div>

        <div class="form-group">

            <label for="passwordId">Password</label>
            <form:input path="password" id="passwordId" type="password" class="form-control"/>
            <form:errors path="password" element="div"></form:errors>
        </div>

        <div class="form-group">
            <input type="submit" value="Submit" class="btn btn-default">
        </div>
    </form:form>
</div>
