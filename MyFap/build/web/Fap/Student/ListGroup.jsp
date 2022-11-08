<%-- 
    Document   : ListGroup
    Created on : Nov 8, 2022, 2:43:55 AM
    Author     : Hoàng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/MyFap/GroupControllerList" method="post">
        
            <select name="gr">
                <c:forEach  items="${sessionScope.groups}" var="g">
                <option value="${g.gname}">${g.gname}</option>
            </c:forEach>
        </select>
        <input type="submit" value="View">
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Student_ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date Of Birth</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.students}" var="st">
                    <tr>
                        <td>${st.id}</td>
                        <td>${st.name}</td>
                        <td>${st.gender}</td>
                        <td>${st.dob}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
<a style="text-decoration: none;"href="Fap/Student/Home.jsp">Home</a>
    </body>
</html>
