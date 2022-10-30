<%-- 
    Document   : Sheme
    Created on : Oct 29, 2022, 2:44:30 PM
    Author     : Hoàng
--%>

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
                        <option value="">2022</option>
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
                <td>WEEK: <select>
                        <option value="">date</option>
                        <option value="">date</option>
                        <option value="">date</option>
                        <option value="">date</option>
                        <option value="">date</option>
                    </select> </td>
                <td>11/10</td>
                <td>12/10</td>
                <td>13/10</td>
                <td>14/10</td>
                <td>15/10</td>
                <td>16/10</td>
                <td>17/10</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 0</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 1</td>
                <td><a style="text-decoration: none;" href="">IOT102-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(7:30-9:00)</label>
                </td>
                <td>-</td>
                <td><a style="text-decoration: none;" href="">IOT102-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(7:30-9:00)</label>
                </td>
                <td>-</td>
                <td><a style="text-decoration: none;" href="">IOT102-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(7:30-9:00)</label>
                </td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 2</td>
                <td><a style="text-decoration: none;" href="">PRJ291-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(9:10-10:40)</label>
                </td>
                <td>-</td>
                <td><a style="text-decoration: none;" href="">PRJ291-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(9:10-10:40)
                </td>
                <td><a style="text-decoration: none;" href="">JPD123-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td><a style="text-decoration: none;" href="">PRJ291-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(9:10-10:40)
                </td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 3</td>
                <td><a style="text-decoration: none;" href="">MAS321-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td><a style="text-decoration: none;" href="">JPD123-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td><a style="text-decoration: none;" href="">MAS321-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td><a style="text-decoration: none;" href="">JPD123-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td><a style="text-decoration: none;" href="">MAS321-</a><a class="view" href="">View material</a>
                    <br> at DE-C205 <br>
                    <labelfor="">(attended) </labelfor=><br> <label class="uncolor" for="">(10:50-12h20)</label>
                </td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 4</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 5</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 6</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td style="text-align: left;">Slot 7</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
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
