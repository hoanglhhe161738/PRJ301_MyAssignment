<%-- 
    Document   : AttandanceStatic
    Created on : Nov 5, 2022, 4:52:47 PM
    Author     : Hoàng
--%>
<jsp:useBean id="helper" class="unity.DateTimeTool"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleStatics.css">
        <style>
            .title{
                display: flex;
                justify-content: space-between;
            }
            .view{
                font-size: 75%;
                text-decoration: none;
                background-color: #f0ad4e;
                padding: 2px;
                color: white;
                border-radius: 2px;
            }
            .home{
                display: flex;
                justify-content: space-between;
                background-color: #f5f5f5;
                border-radius: 2px;

            }

            .home div span{
                font-size: 12px;
                background-color: #5cb85c;
                color: white;
                padding: 2px;
                border-radius: 2px;
            }
            .home div a{
                font-size: 12px;
                padding: 2px;
                border-radius: 2px;
                background-color:#5cb85c;
                color: white;
            }



            a{
                text-decoration: none;
            }

            .menu{
                display: flex;
            }
            .sheme{
                width: 40%;
            }
            .attendance{
                width: 60%;
            }
            .attendance table thead td{

                height: 50px;
                vertical-align: bottom;
            }
            .attendance table tbody td{
                height: 50px;

            }
            .sheme td{
                vertical-align: top;
            }
            .menu .attendance span{
                font-size: 50%;
                font-weight: bold;
                background-color: #6b90da;
                padding: 3px;
                border-radius: 2px;
                color: antiquewhite;
            }

            .span{
                font-size: 50%;
                font-weight: bold;
                background-color: #5cb85c;
                padding: 3px;
                border-radius: 2px;
                color: antiquewhite;
            }


            .attendance td{
                border-left:0.2px solid rgb(227, 219, 219);
                border-bottom:0.2px solid rgb(227, 219, 219);
                text-align: center
            }
        </style>
        <title>Attendance Report</title>
    </head>

    <body style="width: 80%; margin-left: 10%;">
        <div class="title">
            <h1> <span> FPT University Academic Portal</span></h1>
            <div style="margin-top:-10px ;">
                <table style="width: 400px;">
                    <tbody>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>

                        </tr>
                    <t>
                        <td><a href="https://apps.apple.com/app/id1527723314">
                                <img src="https://fap.fpt.edu.vn/images/app-store.svg"
                                     style="width: 120px; height: 40px" alt="apple store"></a></td>
                        <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                <img src="https://fap.fpt.edu.vn/images/play-store.svg"
                                     style="width: 120px; height: 40px" alt="google store"></a></td>

                    </t>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="home">
            <ol style="padding-left: 10px;">
                <li style="list-style: none;">
                    <span id="ctl00_lblNavigation"><a style="text-decoration: none;"href="Fap/Student/Home.jsp">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span>
                </li>
            </ol>
            <div>
                <a style="text-decoration: none;" href="?view=user">
                    <span id="ctl00_lblLogIn" class="label label-success">${sessionScope.account.displayName}</span></a> | <a
                    style="text-decoration: none;" href="/MyFap/LogoutController" class="label label-success">logout</a> |
                <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
            </div>
        </div>
        <div class="menu">
            <div class="sheme">

                <table>
                    <thead>
                        <tr style="background-color: #6b90da;">
                            <td>CAMPUS/PROGRAM <br></td>

                            <td>COURSE</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.groupsStatic}" var="grs">
                            <tr>
                                <td></td>
                                <td><a href="/MyFap/StaticAttendanceController?id=${sessionScope.student.id}&gid=${grs.gid}">${grs.gname}</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="attendance">
                <table>
                    <thead>
                        <tr style="background-color: #6b90da;">
                            <td>NO.</td>
                            <td style="width: 40px;">DATE</td>
                            <td>SLOT</td>
                            <td>ROOM</td>
                            <td>LECTURER</td>
                            <td>GROUP NAME</td>
                            <td>ATTENDANCE STATUS</td>
                            <td>LECTURER'S COMMENT</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set value="0" var="count" />
                        <c:set value="0" var="attended"/>
                        <c:set value="0" var="absent"/>
                        <c:forEach items="${sessionScope.sessions}" var="ses">
                            <c:set value="${count+1}" var="count" />
                            <tr>
                                <td style="padding-left: -37px"><c:out value="${count}"/></td>
                                <td><span>${helper.getDayNameofWeek(ses.date)} ${ses.date} </span></td>
                                <td><label class="span">${ses.slot.slname}_(${ses.slot.start}-${ses.slot.end})</label></td>
                                <td>${ses.room.roomName}</td>
                                <td>${ses.lec.lname}</td>
                                <td>${ses.group.gname}</td>
                                <td>
                                    <c:if test="${ses.att eq true}">Attended
                                        <c:set value="${attended+1}" var="attended" />
                                    </c:if>
                                    <c:if test="${ses.att eq false and helper.compareDate(ses.date) eq -1}">Absent
                                        <c:set value="${absent+1}" var="absent"/>
                                    </c:if>
                                    <c:if test="${ses.att eq false and helper.compareDate(ses.date) ne -1}">-</c:if>
                                    </td>
                                    <td>
                                    <c:forEach items="${sessionScope.Attandance}" var="a">
                                        <c:if test="${ses.sesId eq a.sessions.sesId}">
                                            ${a.description}
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <tr style="border:0.2px solid rgb(227, 219, 219);">
                    Total: <c:out value="${attended + absent}"/> Slot ABSENT: <c:out value="${attended/(attended + absent)*100}" />%
                </tr>
            </div>
        </div>


    </body>

</html>
