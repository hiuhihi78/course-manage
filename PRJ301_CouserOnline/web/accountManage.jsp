<%-- 
    Document   : accountManage
    Created on : Oct 27, 2022, 9:34:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="asset/css/common.css" rel="stylesheet" type="text/css"/>
        <script src="asset/js/common.js" type="text/javascript"></script>
    </head>
    <style>
        .search{
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .content{
            width: 90%;
            margin: 0 auto;
        }
    </style>
    <body>
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

        <div class="header">
            <div class="header-top">
                <i class="fa-sharp fa-solid fa-bars" id="icon-open-sidebar" onclick="OpenSideBar()"></i>
                <h2 style="text-align:center;" onclick="window.location.href = 'home'">ONLINE LERNING</h2>
            </div>
            <div class="header-botom"></div>
        </div>

        <div class="search" style="margin: 50px 0 ">

            <form action="accountManage" method="post">
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="username" class="col-sm-1 col-form-label">Username</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter course's username" value="${requestScope.username}">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="category" class="col-sm-1 col-form-label">Role</label>
                    <div class="col-sm-3">
                        <select name="role" class="form-control" id="role">
                            <option value="0"
                                    <c:if test="${requestScope.roleSelected == 0}">
                                        selected=""
                                    </c:if>
                                    >
                                All
                            </option>
                            <option value="1"
                                    <c:if test="${requestScope.roleSelected == 1}">
                                        selected=""
                                    </c:if>
                                    >
                                Admin
                            </option>
                            <option value="2"
                                    <c:if test="${requestScope.roleSelected == 2}">
                                        selected=""
                                    </c:if>
                                    >
                                Author
                            </option>
                            <option value="3"
                                    <c:if test="${requestScope.roleSelected == 3}">
                                        selected=""
                                    </c:if>
                                    >
                                User
                            </option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="category" class="col-sm-1 col-form-label">Status</label>
                    <div class="col-sm-3">
                        <select name="status" class="form-control" id="status">
                            <option value="0"
                                    <c:if test="${requestScope.statusSelected == 0}">
                                        selected=""
                                    </c:if>
                                    >
                                All
                            </option>
                            <option value="1"
                                    <c:if test="${requestScope.statusSelected == 1}">
                                        selected=""
                                    </c:if>
                                    >
                                Activate
                            </option>
                            <option value="2"
                                    <c:if test="${requestScope.statusSelected == 2}">
                                        selected=""
                                    </c:if>
                                    >
                                Deactivate
                            </option>
                        </select>
                    </div>
                </div>
                <br>
                <div style="margin-left: 130px">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>

        </div>

        <div class="content">

            <table id="myTable" class="display" style="">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Role</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody> 
                    <c:forEach items="${requestScope.users}" var="c">
                        <tr>
                            <td>${c.username}</td>
                            <td>
                                <c:if test="${c.isAdmin}">Admin</c:if>
                                <c:if test="${c.isAuthor}">Author</c:if>
                                <c:if test="${c.isAuthor == false && c.isAdmin == false}">User</c:if>
                            </td>
                            <td>
                            <c:if test="${sessionScope.user.isAdmin == true && c.isAdmin == false}">
                                    <button class="btn btn-info" onclick="window.location.href = 'editRoleAccount?username=${c.username}'">
                                        Edit role
                                    </button>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${c.username != sessionScope.user.username}">
                                    <c:if test="${c.isActivate == true}">
                                        <button class="btn btn-success" onclick="window.location.href = 'deactivateAccount?username=${c.username}'">
                                            Activate
                                        </button>
                                    </c:if>
                                    <c:if test="${c.isActivate == false}">
                                        <button class="btn btn-danger" onclick="window.location.href = 'activateAccountr?username=${c.username}'">
                                            Deactivate
                                        </button>
                                    </c:if>

                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </body>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script>
                                            $(document).ready(function () {
                                                $('#myTable').DataTable({
                                                    "searching": false,
                                                    "lengthMenu": false,
                                                    'lengthChange': false
                                                });
                                            });

    </script>
</html>
