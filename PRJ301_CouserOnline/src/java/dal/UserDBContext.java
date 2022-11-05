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
import model.User;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext {

    public boolean checkUser(String username, String password) {
        try {
            String sql = "select * from [User] where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkUserIsAdmin(String username, String password) {
        try {
            String sql = "select * from [User] where username = ? and password = ? and isAdmin = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkUsernameExisted(String username) {
        try {
            String sql = "select * from [User] where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void CreateAccount(String username, String password) {
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[isActivate]\n"
                    + "           ,[isAdmin]\n"
                    + "      ,[isAuthor])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,0\n"
                    + "           ,0)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserInfo(String username) {
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "      ,[isActivate]\n"
                    + "      ,[isAdmin]\n"
                    + "      ,[isAuthor]\n"
                    + "  FROM [dbo].[User]\n"
                    + "  where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setIsActivate(rs.getBoolean(3));
                user.setIsAdmin(rs.getBoolean(4));
                user.setIsAuthor(rs.getBoolean(5));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "      ,[isActivate]\n"
                    + "      ,[isAdmin]\n"
                    + "      ,[isAuthor]\n"
                    + "  FROM [dbo].[User]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setIsActivate(rs.getBoolean(3));
                user.setIsAdmin(rs.getBoolean(4));
                user.setIsAuthor(rs.getBoolean(5));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public ArrayList<User> getUsersWithCondition(String username, int role, int status) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT [username]\n"
                    + "      ,[password]\n"
                    + "      ,[isActivate]\n"
                    + "      ,[isAdmin]\n"
                    + "      ,[isAuthor]\n"
                    + "  FROM [dbo].[User]\n"
                    + "WHERE\n"
                    + "(1=1)\n"
                    + "AND [username] like '%" + username + "%'\n";

            if (role != 0) {
                if (role == 1) {
                    sql += " and isAdmin = 1\n";
                } else if (role == 2) {
                    sql += " and isAuthor = 1\n";
                } else {
                    sql += " and (isAuthor = 0 and isAdmin = 0)\n";
                }
            }
            if (status != 0) {
                if (status == 1) {
                    sql += " and isActivate = 1\n";
                } else {
                    sql += " and isActivate = 0\n";
                }
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setIsActivate(rs.getBoolean(3));
                user.setIsAdmin(rs.getBoolean(4));
                user.setIsAuthor(rs.getBoolean(5));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public void deactivateAccount(String username) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET\n"
                    + "      [isActivate] = 0\n"
                    + " WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void activateAccount(String username) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET\n"
                    + "      [isActivate] = 1\n"
                    + " WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changePassword(String username, String password) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET \n"
                    + "      [password] = ?\n"
                    + " WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editRoleAccount(String username, int role) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET \n";
            if(role == 1){
                sql += " isAdmin = 1\n";
            }else if(role == 2){
                sql += " isAuthor = 1\n";
            }else{
                sql += " isAuthor = 0 , isAdmin = 0\n";
            }
            sql += "WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        UserDBContext db = new UserDBContext();
        System.out.println(db.getUserInfo("hieu"));
    }

}
