<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : Group
    Created on : Nov 2, 2022, 10:51:57 AM
    Author     : Hoàng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleAttendance.css">
        <title>Attended</title>
        <style>
            img{
                width: 90px;
                height: 120px;
            }

            body{
                width: 80%;
                margin-left: 10%;
            }

            td{
                width: 10%;
                vertical-align: top;
                border-bottom:0.2px solid rgb(227, 219, 219);
            }
        </style>
    </head>
    <body style="width: 80%;
          margin-left: 10%;">
        <h2>Single activity Attendance</h2>
        <p>Attendance for PRJ291 with lecturer Sonnt5 at slot 1 on Wednesday 12/10/2022 Spring2022 in room BE-301 at FUHL</p>
        <table>
            <thead>
                <tr style="background-color: #6b90da;">
                    <td>No</td>
                    <td>Group</td>
                    <td>Code</td>
                    <td>Name</td>
                    <td>Image</td>
                    <td>Status</td>
                    <td>Comment</td>
                    <td>Taker</td>
                    <td>Record Time</td>
                </tr>
            </thead>
            <c:forEach items="${sessionScope.listStudent}" var="lst">
                <tr style="border-bottom: 2px solid black;">



                    <td>${count}</td>
                    <td>${lst.sessions.group.gname}</td>
                    <td>${lst.students.id}</td>
                    <td>${lst.students.name}</td>
                    <td><img style="width: 90px;
                             height: 120px; "src="https://i.pinimg.com/originals/42/9b/17/429b171accad8b42f906e43b35c3b341.jpg" alt=""></td>
                    <td style="font-size: 10px;">
                        <c:if test="${lst.attendance eq true}">Attended</c:if>
                        <c:if test="${lst.attendance eq false}">Absent</c:if>
                        </td>
                        <td>${lst.description}</td>
                    <td>${lst.sessions.lec.lname}</td>
                    <td>${lst.recordTime}</td>



                </tr>
            </c:forEach>
        </table>
    </body>
</html>
