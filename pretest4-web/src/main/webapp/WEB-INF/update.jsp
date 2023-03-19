<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tiger
  Date: 18-Mar-23
  Time: 03:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<form action="person" method="post">
    <div>
        <label>
            <strong>Person id: ${person.id}</strong>
            <input hidden="hidden" name="personId" value="${person.id}">
        </label>
        <label>
            <strong>Phones:</strong>
            <c:forEach items="${person.phones}" var="phone">
                <p>Phone id: ${phone.id} - number: <input name="newNum_${phone.id}" placeholder="replace of ${phone.number}"></p>
            </c:forEach>
        </label>
    </div>

    <input type="submit" name="action" value="update">
</form>
</body>
</html>
