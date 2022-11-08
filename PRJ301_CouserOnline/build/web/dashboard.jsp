<%-- 
    Document   : dashboard
    Created on : Oct 24, 2022, 10:05:07 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <%
        User user  = (User)request.getAttribute("user");
    %>
    <style>
        .sideBar{
            width: 200px;
            height: 100vh;
            background-color: bisque;
            display: none;
            z-index: 100;
            position: absolute;
        }
        #icon-close{
            position: absolute;
            margin-left: 85%;
            font-size: 30px;
        }
        #icon-close:hover{
            color: whitesmoke;
        }
        .header-top{
            background-color: cadetblue;
            height: 100px;
        }
        #icon-open-sidebar{
            position: absolute;
            font-size: 30px;
            margin-top: 10px;
            margin-left: 20px;
        }
        #icon-open-sidebar:hover{
            color: whitesmoke;
        }
        .item-sideBar{
            width: 100%;
            text-align: center;
            padding:10px 0;
            color: black;
        }
        .item-sideBar a{
            text-decoration: none;
        }
        .item-sideBar:hover{
            background-color: gray;
            color: whitesmoke;
        }
        .item-main{
            padding-top: 30px;
            padding-bottom: 30px;
            width: 250px;
            background-color: aquamarine;
            margin: 0 auto;
            margin-top: 100px;
        }
        .item-main:hover{
            background-color: antiquewhite;
            color: rebeccapurple;
        }
    </style>
    <body>
        <div>
            <div class="">
                <div class="sideBar">
                    <i class="fa-solid fa-xmark" id="icon-close" onclick="CloseSideBar();"></i>
                    <div style="margin-top:50px"></div>
                    <div class="item-sideBar">
                        <a href="dashboard">Home</a>
                    </div>
                    <div class="item-sideBar">
                        <a href="changePassword">Change password</a>
                    </div>
                    <div class="item-sideBar">
                        <a href="logout">Logout</a>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        <div class="header-top">
                            <i class="fa-sharp fa-solid fa-bars" id="icon-open-sidebar" onclick="OpenSideBar()"></i>
                            <h2 style="text-align:center;" onclick="window.location.href = 'home'">ONLINE LERNING</h2>
                        </div>
                        <div class="header-botom"></div>
                    </div>
                    <div class="main">
                        <div class="row">

                            <div class="col-md-6 text-center">
                                <div class="item-main" onclick="window.location.href = 'courseManage'"">
                                    <span style="width:fit-content;">Course Manage</span>
                                </div>
                            </div>

                            <%if(user.isIsAdmin()){%>
                                <div class="col-md-6 text-center">
                                    <div class="item-main" onclick="window.location.href = 'accountManage'"">
                                        <span style="width:fit-content;">Account Manage</span>
                                    </div>
                                </div>
                            <%}%>
                        </div>
                    </div>
                                <h1></h1>
                    <div class="footer"></div>
                </div>
            </div>
        </div>
        <script>
            function CloseSideBar() {
                document.querySelector('.sideBar').style.display = 'none';
            }
            function OpenSideBar() {
                document.querySelector('.sideBar').style.display = 'block';
            }

        </script>
    </body>
</html>
