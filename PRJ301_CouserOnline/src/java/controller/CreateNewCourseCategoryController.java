/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CourseCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CourseCategory;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateNewCourseCategoryController", urlPatterns = {"/createNewCourseCategory"})
public class CreateNewCourseCategoryController extends HttpServlet {

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
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String image = request.getParameter("image");
        request.setAttribute("title", title);
        request.setAttribute("summary", summary);
        request.setAttribute("image", image);
        request.getRequestDispatcher("createNewCourseCategory.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        CourseCategoryDBContext db = new CourseCategoryDBContext();
        boolean categoryExisted = db.checkCourseCateogoryExisted(name);
        if(categoryExisted == true){
            request.setAttribute("message", "This course category name was existed!");
            request.setAttribute("name", name);
            request.getRequestDispatcher("createNewCourseCategory.jsp").forward(request, response);
        }
        db.createNewCourseCategory(name);
        
         String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String image = request.getParameter("image");
        
        CourseCategoryDBContext courseCategoryDB = new CourseCategoryDBContext();
        ArrayList<CourseCategory> courseCategorys = courseCategoryDB.getAllCourseCategory();
        request.setAttribute("category", courseCategorys);
        request.setAttribute("title", title);
        request.setAttribute("summary", summary);
        request.setAttribute("image", image);
        request.getRequestDispatcher("createCourse.jsp").forward(request, response);
        
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
