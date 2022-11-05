<%-- 
    Document   : courseManage
    Created on : Oct 25, 2022, 9:02:01 PM
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
                <h2 style="text-align:center;">ONLINE LERNING</h2>
            </div>
            <div class="header-botom"></div>
        </div>

        <div class="search" style="margin: 50px 0 ">
            
            <form action="courseManage" method="post">
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="productName" class="col-sm-1 col-form-label">Title</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter course's title" value="${requestScope.title}">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="category" class="col-sm-1 col-form-label">Category</label>
                    <div class="col-sm-3">
                        <select name="category" class="form-control" id="category">
                            <option value="0">All</option>
                            <c:forEach items="${requestScope.category}" var="c">
                                <option value="${c.id}"
                                        <c:if test="${requestScope.categorySelected == c.id}">
                                            selected=""
                                        </c:if>
                                        >
                                    ${c.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="productName" class="col-sm-1 col-form-label">Auhor</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="title" name="author" placeholder="Enter course's author" value="${requestScope.author}">
                    </div>
                </div>

                <div style="margin-left: 130px">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>

        </div>

        <div class="content">
            <a href="createCourse">Create new course</a>

            <table id="myTable" class="display">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Category</th>
                        <th>DateCreated</th>
                        <th>Author</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody> 
                    <c:forEach items="${requestScope.courses}" var="c">
                        <tr>
                            <td>${c.title}</td>
                            <td><img src="${c.image}" style="width: 80px; height: 80px"/></td>
                            <td>${c.courseCategory.name}</td>
                            <td>${c.dateCreated}</td>
                            <td>${c.user.username}</td>
                            <td>
                                <c:if test="${c.user.username == sessionScope.user.username}">
                                    <button class="btn btn-primary" onclick="window.location.href = 'updateCourse?id=${c.id}'">
                                        Edit
                                    </button>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${sessionScope.user.username == 'admin' }">
                                    <c:if test="${c.isActivate == true}">
                                        <button class="btn btn-success" onclick="window.location.href = 'deactivateCourse?id=${c.id}'">
                                            Activate
                                        </button>
                                    </c:if>
                                    <c:if test="${c.isActivate == false}">
                                        <button class="btn btn-danger" onclick="window.location.href = 'activateCourse?id=${c.id}'">
                                            Deactivate
                                        </button>
                                    </c:if>

                                </c:if>
                            </td>
                            <td>
                                <c:if test="${sessionScope.user.isAdmin == true || c.user.username == sessionScope.user.username}">
                                    <button class="btn btn-danger" onclick="window.location.href = 'deleteCourse?id=${c.id}'">
                                        Delete
                                    </button>
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
