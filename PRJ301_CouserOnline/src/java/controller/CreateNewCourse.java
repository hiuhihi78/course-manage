/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CourseCategoryDBContext;
import dal.CourseDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CourseCategory;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateNewCourse", urlPatterns = {"/createCourse"})
public class CreateNewCourse extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
        request.setAttribute("category", courseCategorys);
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String image = request.getParameter("image");
        request.getRequestDispatcher("createCourse.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        int category = Integer.parseInt(request.getParameter("category"));
        String info = request.getParameter("info");
        String image = request.getParameter("image");
        String username = ((User) session.getAttribute("user")).getUsername();
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        CourseDBContext courseDb = new CourseDBContext();
        boolean isCourseTitleWasExisted = courseDb.checkCourseTitleWasExisted(title);
        if (isCourseTitleWasExisted) {
            request.setAttribute("message", "This title's course was existed!");
            ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
            request.setAttribute("category", courseCategorys);
            request.getRequestDispatcher("createCourse.jsp").forward(request, response);
        } else {
            courseDb.createCourse(title, summary, category, username, info,image);
            response.sendRedirect("courseManage");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
