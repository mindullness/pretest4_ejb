<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>People</title>
</head>
<body>
<div class="container w-50 m-auto">
    <h1>People</h1>
    <table>
        <c:forEach items="${people}" var="person">
            <strong>Person id: ${person.id}</strong>
            <strong>Phones:</strong>
            <c:forEach items="${person.phones}" var="phone">
                <p>Phone id: ${phone.id}: number - ${phone.number}</p>
            </c:forEach>
            <a href="person?action=update&personId=${person.id}"><button>Update</button></a>
            <br>
        </c:forEach>
    </table>
    <p>Click <a href="person?action=create">here</a> to add a person</p>
</div>
</body>
</html>
