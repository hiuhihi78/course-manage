/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseCategory;
import model.User;

/**
 *
 * @author Admin
 */
public class CourseDBContext extends DBContext {

    public ArrayList<Course> getAllCourse() {

        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                     + "      ,[User].isAdmin\n"
                    + "  FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					  join [User] on [User].username = [Course].UserCreated";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory category = new CourseCategory();
                category.setId(rs.getInt(5));
                category.setName(rs.getString(6));
                course.setCourseCategory(category);
                User user = new User();
                user.setUsername(rs.getString(7));
                user.setIsAdmin(rs.getBoolean(12));
                course.setUser(user);
                course.setCourseCategory(category);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
    
    public ArrayList<Course> getAllCourseActivate() {

        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                    + "  FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					  join [User] on [User].username = [Course].UserCreated\n"
                    + " where Course.isActivate = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory category = new CourseCategory();
                category.setId(rs.getInt(5));
                category.setName(rs.getString(6));
                course.setCourseCategory(category);
                User user = new User();
                user.setUsername(rs.getString(7));
                course.setUser(user);
                course.setCourseCategory(category);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
    
    
    public ArrayList<Course> getTop5CourseActivate() {

        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT TOP 5 [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                    + "  FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					  join [User] on [User].username = [Course].UserCreated\n"
                    + " where Course.isActivate = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory category = new CourseCategory();
                category.setId(rs.getInt(5));
                category.setName(rs.getString(6));
                course.setCourseCategory(category);
                User user = new User();
                user.setUsername(rs.getString(7));
                course.setUser(user);
                course.setCourseCategory(category);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public boolean checkCourseTitleWasExisted(String title) {
        try {
            String sql = "SELECT [Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "      ,[UserCreated]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "  FROM [dbo].[Course]\n"
                    + "  where LOWER([Title]) = LOWER(?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void createCourse(String title, String summary, int category, String username, String info, String image) {
        try {
            String sql = "INSERT INTO [dbo].[Course]\n"
                    + "           ([Title]\n"
                    + "           ,[DateCreated]\n"
                    + "           ,[Summary]\n"
                    + "           ,[CourseCategoryId]\n"
                    + "           ,[UserCreated]\n"
                    + "           ,[Info]\n"
                    + "           ,Course.[isActivate]\n"
                    + "           ,[image])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,GETDATE()\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setInt(3, category);
            ps.setString(4, username);
            ps.setString(5, info);
            ps.setString(6, image);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.err.println("dawdaw");
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Course getCourseById(int id) {
        try {
            String sql = "SELECT [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                    + "  FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					  join [User] on [User].username = [Course].UserCreated\n"
                    + "  where Course.[Id] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory category = new CourseCategory();
                category.setId(rs.getInt(5));
                category.setName(rs.getString(6));
                course.setCourseCategory(category);
                User user = new User();
                user.setUsername(rs.getString(7));
                course.setUser(user);
                course.setCourseCategory(category);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                return course;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateCourse(String title, String summary, int category, String info, String image, int id) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET [Title] = ?\n"
                    + "      ,[Summary] = ?\n"
                    + "      ,[CourseCategoryId] = ?\n"
                    + "      ,[Info] = ?\n"
                    + "      ,[image] = ?\n"
                    + " WHERE Id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setInt(3, category);
            ps.setString(4, info);
            ps.setString(5, image);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.err.println("dawdaw");
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deactivateCourse(int id) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET \n"
                    + "      [isActivate] = 0\n"
                    + " WHERE Id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void activateCourse(int id) {
        try {
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET \n"
                    + "      [isActivate] = 1\n"
                    + " WHERE Id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Course> getCoursesWithCondition(String title, int category, String author) {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            
            String sql = "SELECT [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                    + "FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					join [User] on [User].username = [Course].UserCreated\n"
                    + "WHERE \n"
                    + "(1=1)\n"
                    + "AND Title LIKE '%"+title+"%'\n"
                    + "AND [UserCreated] LIKE '%"+author+"%'\n"
                    + "AND [CourseCategoryId] = \n"
                    + "						(\n"
                    + "							CASE \n"
                    + "							WHEN ? = 0 THEN [CourseCategoryId]\n"
                    + "							ELSE ?\n"
                    + "							END\n"
                    + "						)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, category);
            ps.setInt(2, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory coursecategory = new CourseCategory();
                coursecategory.setId(rs.getInt(5));
                coursecategory.setName(rs.getString(6));
                course.setCourseCategory(coursecategory);
                User user = new User();
                user.setUsername(rs.getString(7));
                course.setUser(user);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }

    public ArrayList<Course> getCoursesByTitle(String title) {
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT [Course].[Id]\n"
                    + "      ,[Title]\n"
                    + "      ,[DateCreated]\n"
                    + "      ,[Summary]\n"
                    + "      ,[CourseCategoryId]\n"
                    + "	  ,CourseCategory.[Name]\n"
                    + "      ,[UserCreated]\n"
                    + "	  ,[username]\n"
                    + "      ,[Info]\n"
                    + "      ,image\n"
                    + "      ,Course.isActivate\n"
                    + "  FROM [dbo].[Course] join CourseCategory on Course.CourseCategoryId = CourseCategory.Id\n"
                    + "					  join [User] on [User].username = [Course].UserCreated\n"
                    + "  where Course.[Title] like N'%" + title + "%' and Course.isActivate = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setTitle(rs.getString(2));
                course.setDateCreated(rs.getTimestamp(3));
                course.setSummary(rs.getString(4));
                CourseCategory category = new CourseCategory();
                category.setId(rs.getInt(5));
                category.setName(rs.getString(6));
                course.setCourseCategory(category);
                User user = new User();
                user.setUsername(rs.getString(7));
                course.setUser(user);
                course.setCourseCategory(category);
                course.setInfo(rs.getString(9));
                course.setImage(rs.getString(10));
                course.setIsActivate(rs.getBoolean(11));
                courses.add(course);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courses;
    }
    
    

    public void deleteCourse(int id) {
        try {
            String sql = "Delete from Course where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void main(String[] args) {
        CourseDBContext db = new CourseDBContext();
        System.out.println(db.getAllCourse().get(0).getUser().isIsAdmin());
    }
}
