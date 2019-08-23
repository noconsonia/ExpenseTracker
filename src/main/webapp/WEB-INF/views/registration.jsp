<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Create an account</title>

</head>

<body>
      <form:form method="post" modelAttribute="user">

      <td><form:textarea path="username"
                         itemValue="id"
                         id="username"/></td>
      <td><form:password path="password" itemValue="id" id="password"/></td>
      <td><form:password path="passwordConfirm" itemValue="id" id="passwordConfirm"/></td>
      <td><form:errors path="username" element="div"/></td>
      <td><form:errors path="password" element="div"/></td>
      <td><form:errors path="passwordConfirm" element="div"/></td>
          <input type="submit" value="Save">

      </form:form>

</body>
</html>