<%-- 
    Document   : Home
    Created on : Nov 7, 2022, 11:49:22 PM
    Author     : Hoàng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            *{
                box-sizing: border-box;
            }
            td{
                width: 10%;
            }
            span{
                font-weight: lighter;

            }
            tbody tr{
                border-bottom: 2px solid black;
            }
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
                height: 10%;
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
            .view-home{
                display: flex;
                height: 100%;
                width: 100%;
                justify-content: space-between;
                margin-top: 10%;
            }
            .view-home-item {
                height: 25%;
                width: 25%;
                border: 1px solid black;
                border-radius: 1px;
                box-shadow: 1px 1px 1px 1px;
                text-align: center;
                border-radius: 2px;
            }
            .view-home-item img{
                height: 95%;
                width: 95%;

            }
            p{
                font-size: 30px;
                text-align: center;
                color: #f0ad4e;
            }
        </style>
    </head>
    <body style="width: 80%; margin-left: 10%;">
        <div class="title" style="display: flex;
             justify-content: space-between;">
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
        <div class="home" style="display: flex;
             justify-content: space-between;
             background-color: #f5f5f5;
             border-radius: 2px;
             height: 10%;">
            <ol style="padding-left: 10px;">
                <li style="list-style: none;">
                    <span id="ctl00_lblNavigation"><a style="text-decoration: none;"
                                                      href="../Student.aspx">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span>
                </li>
            </ol>
            <div>
                <a style="text-decoration: none;
                   font-size: 12px;
                   padding: 2px;
                   border-radius: 2px;
                   background-color:#5cb85c;
                   color: white;" href="?view=user">
                    <span id="ctl00_lblLogIn" class="label label-success">${sessionScope.account.displayName}</span></a> | <a
                    style="text-decoration: none;" href="/MyFap/LogoutController" class="label label-success">logout</a> 
            </div>
        </div>
        <div class="view-home">
            <div class="view-home-item"><p>Group</p><a href="/MyFap/GroupControllerList?id=${sessionScope.student.id}"><img src="https://www.wellesleyfreelibrary.org/wp-content/uploads/2019/04/multiple-users-silhouette.png" alt=""></a></div>
            <div class="view-home-item"><p>Timetable</p><a href="/MyFap/ShemeConttroller?id=${sessionScope.student.id}"><img src="https://i.pinimg.com/originals/26/96/c9/2696c9403dd3d762a0cd2934490eccbb.jpg" alt=""></a></div>
            <div class="view-home-item"><p>Attendance</p><a href="/MyFap/StaticGroupController?id=${sessionScope.student.id}"><img style="height: 270.17px; width: 100%;" src="https://inkythuatso.com/uploads/images/2021/12/dau-tich-vector-inkythuatso-3-28-13-48-01.jpg" alt=""></a></div>
        </div>

    </body>
</html>
