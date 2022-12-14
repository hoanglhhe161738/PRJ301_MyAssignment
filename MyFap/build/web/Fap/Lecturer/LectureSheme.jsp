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
                    <span id="ctl00_lblNavigation"><a style="text-decoration: none;"href="Fap/Lecturer/Home.jsp">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span>
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

        <div>
            <h2> <span> Activities for ${sessionScope.account.displayName}</span></h2>
            <p>Note: These activities do not include extra-curriculum activities, such as club activities ...
                <br>
                Ch?? th??ch: C??c ho???t ?????ng trong b???ng d?????i kh??ng bao g???m ho???t ?????ng ngo???i kh??a, v?? d??? nh?? ho???t ?????ng c??u l???c b??? 
                ...
                <br>
                C??c ph??ng b???t ?????u b???ng AL thu???c t??a nh?? Alpha. VD: AL...<br>
                C??c ph??ng b???t ?????u b???ng BE thu???c t??a nh?? Beta. VD: BE,..<br>
                C??c ph??ng b???t ?????u b???ng G thu???c t??a nh?? Gamma. VD: G201,...<br>
                C??c ph??ng t???p b???ng ?????u b???ng R thu???c khu v???c s??n t???p Vovinam.<br>
                C??c ph??ng b???t ?????u b???ng DE thu???c t??a nh?? Delta. VD: DE,..<br>
                Little UK (LUK) thu???c t???ng 5 t??a nh?? Delta
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
            <form action="/MyFap/LecturerController" method="GET">
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
        <c:forEach items="${sessionScope.slot}" var="sl">
            <tr style="border-left: 2px solid black;">
                <td style="text-align: left;
                    border-left:0.2px solid rgb(227, 219, 219);
                    border-bottom:0.2px solid rgb(227, 219, 219);">Slot ${sl}</td>
                <c:forEach items="${sessionScope.dates}" var="d">
                    <td style="border-left:0.2px solid rgb(227, 219, 219);
                        border-bottom:0.2px solid rgb(227, 219, 219);">
                        <c:forEach items="${sessionScope.sessions}" var="ses">
                            
                                <c:if test="${helper.compare(ses.date,d) eq 0 and ses.slot.slid eq sl}">
                                    <a style="text-decoration: none;" href="http://localhost:8080/MyFap/LecturerGroupController?sesid=${ses.sesId}" >${ses.group.gname}-</a><a class="view" style="font-size: 75%;
                                                                                                                                                                        text-decoration: none;
                                                                                                                                                                        background-color: #f0ad4e;
                                                                                                                                                                        padding: 2px;
                                                                                                                                                                        color: white;
                                                                                                                                                                        border-radius: 2px;" href="">${ses.lec.lname}</a>
                                    <br> at ${ses.room.roomName} <br>
                                    
                                    <c:forEach items="${sessionScope.Attandance}" var="a">
                                        
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

                </c:forEach>
            </tr>
        </c:forEach>


    </tbody>
</table>
<p style="font-weight: bold;">More note / Ch?? th??ch th??m:</p>

<ul>
    <li><label style="color: rgb(0, 128, 0);" for="">(attended):</label> HoangLHHE161738 had attended this
        activity / L?? H?i Ho??ng ??? tham gia ho?t ??ng n??y</li>
    <li><label style="color: rgb(255, 0, 0);" for=""> (absent): </label> HoangLHHE161738 had NOT attended this
        activity / L?? H?i Ho??ng ??? v?ng m?t bu?i n??y</li>
    <li>(-): no data was given / ch?a c?? d? li?u</li>
</ul>
<div class="end">
    <p class="end-one" style="margin-top: 100px;"> <label style="font-weight:bold ;" for="">M?i g??p ??, th?c m?c xin li??n h?:</label>
        Ph??ng d?ch v? sinh vi??n: <a style="text-decoration: none;" href="">Email: dichvusinhvien@fe.edu.vn</a>. ?i?n
        tho?i:
        <label style="font-weight:bold ;" for="">(024)7308.13.13 </label>

    </p>
    <p class="end-two" style="width: 75%;
       text-align: end;
       margin-top: -10px;">?? Powered by <a style="text-decoration: none;" href="">FPT University | CMS | library | books24x7</a></p>
</div>
</body>

</html>