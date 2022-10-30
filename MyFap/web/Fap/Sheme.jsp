<%-- 
    Document   : Sheme
    Created on : Oct 29, 2022, 2:44:30 PM
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
        <link rel="stylesheet" href="style.css">

        <title>Document</title>

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
                    <span id="ctl00_lblNavigation"><a style="text-decoration: none;"
                                                      href="../Student.aspx">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span>
                </li>
            </ol>
            <div>
                <a style="text-decoration: none;" href="?view=user">
                    <span id="ctl00_lblLogIn" class="label label-success">hoanglhhe161738</span></a> | <a
                    style="text-decoration: none;" href="?logout=true" class="label label-success">logout</a> |
                <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
            </div>
        </div>

        <div>
            <h2> <span> Activities for HoangLhhe161738 (Ly Hai Hoang) </span></h2>
            <p>Note: These activities do not include extra-curriculum activities, such as club activities ...
                <br>
                Chú thích: Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ
                ...
                <br>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL... <br>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,.. <br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,... <br>
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam. <br>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,.. <br>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta
            </p> <br>
        </div>
        <table>
            <thead>
                <tr style="background-color: #6b90da;">
                    <td>YEAR: <Select>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
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
                    <td>WEEK:
                        <form action="../TimeTableController" method="GET">
                            <input type="hidden" name="stid" value="1"/>
                            From: <input type="date" name="from" value="${requestScope.from}"/>
                            To: <input type="date" name="to" value="${requestScope.to}"/>
                            <input type="submit" value="View"/> 
                            <c:forEach items="${requestScope.dates}" var="d">

                <td>${d}<br/>${helper.getDayNameofWeek(d)}</td> </c:forEach>
                        </form> </td>

                </tr>
                

            <c:forEach items="${requestScope.slot}" var="slot">
                <tr>
                    <td>slot ${slot}</td>
                    <c:forEach items="${requestScope.sessions}" var="ses">
                        <c:forEach items="${requestScope.dates}" var="date">        
                            <c:if test="${helper.compare(ses.date,date) eq 0 and (ses.slot.slid eq slot)}">
                                <td><a style="text-decoration: none;" href="">${ses.group.gname}-</a><a class="view" href="">${ses.lec.lname}</a>
                                    <br> at ${ses.room.roomName} <br>
                            <labelfor="">
                                <c:choose>
                                    <c:when test="${ses.status eq true}">
                                        attended 
                                    </c:when>    
                                    <c:otherwise>
                                        absent
                                    </c:otherwise>
                                </c:choose>
                            </labelfor=><br> <label class="uncolor" for=""></label>
                            <label class="uncolor" for="">
                                ${ses.slot.start}-${ses.slot.end}
                            </label>
                        </td>
                    </c:if>

                </c:forEach>
            </c:forEach>
        </tr>
    </c:forEach>




</tbody>
</table>
<p style="font-weight: bold;">More note / Chú thích thêm:</p>

<ul>
    <li><label style="color: rgb(0, 128, 0);" for="">(attended):</label> HoangLHHE161738 had attended this
        activity / Lý Hải Hoàng đã tham gia hoạt động này</li>
    <li><label style="color: rgb(255, 0, 0);" for=""> (absent): </label> HoangLHHE161738 had NOT attended this
        activity / Lý Hải Hoàng đã vắng mặt buổi này</li>
    <li>(-): no data was given / chưa có dữ liệu</li>
</ul>
<div class="end">
    <p class="end-one" style="margin-top: 100px;"> <label style="font-weight:bold ;" for="">Mọi góp ý, thắc mắc xin liên hệ:</label>
        Phòng dịch vụ sinh viên: <a style="text-decoration: none;" href="">Email: dichvusinhvien@fe.edu.vn</a>. Điện
        thoại:
        <label style="font-weight:bold ;" for="">(024)7308.13.13 </label>

    </p>
    <p class="end-two">© Powered by <a style="text-decoration: none;" href="">FPT University | CMS | library | books24x7</a></p>
</div>
</body>

</html>
