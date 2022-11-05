<jsp:useBean id="helper" class="unity.DateTimeTool"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>Weekly Timetable</title>
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
            .uncolor{
                font-size: 75%;
                text-decoration: none;
                background-color: #5cb85c;
                padding: 2px;
                color: white;
                border-radius: 2px;
            }

            .end-two{
                width: 75%;
                text-align: end;
                margin-top: -10px;
            }
            td{
                border-bottom:0.2px solid rgb(227, 219, 219);
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
                    <span id="ctl00_lblLogIn" class="label label-success">hoanglhhe161738</span></a> | <a
                    style="text-decoration: none;" href="?logout=true" class="label label-success">logout</a> |
                <span style="font-size: 12px;
                      background-color: #5cb85c;
                      color: white;
                      padding: 2px;
                      border-radius: 2px;" id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa L?c</span>
            </div>
        </div>

        <div>
            <h2> <span> Activities for HoangLhhe161738 (Ly Hai Hoang) </span></h2>
            <p>Note: These activities do not include extra-curriculum activities, such as club activities ...
                <br>
                Chú thích: Các hoạt ??ng trong b?ng d??i không bao g?m ho?t ??ng ngo?i khóa, ví d? nh? ho?t ??ng câu l?c b?
                ...
                <br>
                Các phòng b?t ??u b?ng AL thu?c tòa nhà Alpha. VD: AL... <br>
                Các phòng b?t ??u b?ng BE thu?c tòa nhà Beta. VD: BE,.. <br>
                Các phòng b?t ??u b?ng G thu?c tòa nhà Gamma. VD: G201,... <br>
                Các phòng t?p b?ng ??u b?ng R thu?c khu v?c sân t?p Vovinam. <br>
                Các phòng b?t ??u b?ng DE thu?c tòa nhà Delta. VD: DE,.. <br>
                Little UK (LUK) thu?c t?ng 5 tòa nhà Delta
            </p> <br>
        </div>
        <table>
            <thead>
                <tr style="background-color: #6b90da;">
                    <td>YEAR: <Select>
                            <option value="">2022</option>
                            <option value="">2021</option>
                        </Select></td>
                    <td>MON</td>
                    <td>TUE</td>
                    <td>WED</td>
                    <td>THU</td>
                    <td>FRI</td>
                    <td>SAT</td>
                    <td>SUN</td>
                </tr>
            </thead>
            <tbody>
                <tr style="background-color: #6b90da;">
            <form action="/MyFap/TimeTableController" method="GET">
                <td style="border-left:0.2px solid rgb(227, 219, 219);
                    border-bottom:0.2px solid rgb(227, 219, 219);">WEEK: 
                    <input type="hidden" name="id" value="${param.id}"/>
                    From: <input type="date" name="from" value="${sessionScope.from}"> <br>
                    To: <input type="date" name="to" value="${sessionScope.to}"><br>
                    <input type="submit" value="view">
                </td>
            </form>
            <c:forEach items="${sessionScope.dates}" var="d">
                <td style="border-bottom:0.2px solid rgb(227, 219, 219);
                    border-left:0.2px solid rgb(227, 219, 219);">${d}</td>
            </c:forEach>
        </tr>
        <c:set value="0" var="cnt"/>
        <c:forEach items="${sessionScope.slot}" var="sl">
            <tr style="border-left: 2px solid black;">
                <td style="text-align: left;
                    border-left:0.2px solid rgb(227, 219, 219);
                    border-bottom:0.2px solid rgb(227, 219, 219);">Slot ${sl}</td>
                <c:forEach items="${sessionScope.dates}" var="d">
                    <td style="border-left:0.2px solid rgb(227, 219, 219);
                        border-bottom:0.2px solid rgb(227, 219, 219);">
                        <c:forEach items="${sessionScope.sessions}" var="ses">
                            <c:set value="${cnt + 1}" var="cnt"/>
                            <c:if test="${helper.compare(ses.date,d) eq 0 and ses.slot.slid eq sl}">
                                <a style="text-decoration: none;" href="http://localhost:8080/MyFap/GroupController?sesid=${ses.sesId}" >${ses.group.gname}-</a><a class="view" style="font-size: 75%;
                                                                                                                                                                   text-decoration: none;
                                                                                                                                                                   background-color: #f0ad4e;
                                                                                                                                                                   padding: 2px;
                                                                                                                                                                   color: white;
                                                                                                                                                                   border-radius: 2px;" href="">${ses.lec.lname}</a>
                                <br> at ${ses.room.roomName} <br>
                                <c:set var="count" value="0"  />
                                <c:forEach items="${sessionScope.Attandance}" var="a">
                                    <c:set var="count" value="${count + 1}"  />
                                    <label for=""><c:choose>
                                            <c:when test="${a.sessions.sesId eq ses.sesId and a.attendance eq true}">Attended</c:when>
                                            <c:when test="${a.sessions.sesId eq ses.sesId and a.attendance eq false}">
                                                absent
                                            </c:when>
                                        </c:choose></label ></c:forEach> <br> <label class="uncolor" style="font-size: 75%;
                                        text-decoration: none;
                                        background-color: #5cb85c;
                                        padding: 2px;
                                        color: white;
                                                                          border-radius: 2px;" for="">${ses.slot.start} - ${ses.slot.end}</label>

                            </c:if>
                            

                        </c:forEach>
                    </td>
                    <c:if test="${cnt eq sessionScope.count}">

                    </c:if>

                </c:forEach>    
            </tr>
        </c:forEach>


    </tbody>
</table>
<p style="font-weight: bold;">More note / Chú thích thêm:</p>

<ul>
    <li><label style="color: rgb(0, 128, 0);" for="">(attended):</label> HoangLHHE161738 had attended this
        activity / Lý H?i Hoàng ?ã tham gia ho?t ??ng này</li>
    <li><label style="color: rgb(255, 0, 0);" for=""> (absent): </label> HoangLHHE161738 had NOT attended this
        activity / Lý H?i Hoàng ?ã v?ng m?t bu?i này</li>
    <li>(-): no data was given / ch?a có d? li?u</li>
</ul>
<div class="end">
    <p class="end-one" style="margin-top: 100px;"> <label style="font-weight:bold ;" for="">M?i góp ý, th?c m?c xin liên h?:</label>
        Phòng d?ch v? sinh viên: <a style="text-decoration: none;" href="">Email: dichvusinhvien@fe.edu.vn</a>. ?i?n
        tho?i:
        <label style="font-weight:bold ;" for="">(024)7308.13.13 </label>

    </p>
    <p class="end-two" style="width: 75%;
       text-align: end;
       margin-top: -10px;">© Powered by <a style="text-decoration: none;" href="">FPT University | CMS | library | books24x7</a></p>
</div>
</body>

</html>