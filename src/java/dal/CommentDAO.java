/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;

/**
 *
 * @author duongvu
 */
public class CommentDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private final List<Comment> commentList = new ArrayList<>();

    private static Comment setComment(ResultSet rs) {
        Comment comment = new Comment();
        AccountDAO a = new AccountDAO();
        try {
            comment.setAccountID(rs.getInt("accountID"));
            comment.setCommentID(rs.getInt("commentID"));
            comment.setCpuID(rs.getInt("cpuID"));
            comment.setContent(rs.getString("Content"));
            comment.setAccount(a.getAccountByID(rs.getInt("accountID")));
        } catch (SQLException e) {
        }
        return comment;
    }

    public List<Comment> getAll(int cpuID) {
        String sql = "select * from Comment where cpuID = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cpuID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Comment comment = setComment(rs);
                commentList.add(comment);
            }
        } catch (SQLException e) {
        }
        return commentList;
    }

    public void addComment(int accountID, int cpuID, String content) {
        String sql = "INSERT INTO [Comment]\n"
                + "           ([accountID]\n"
                + "           ,[cpuID]\n"
                + "           ,[Content])\n"
                + "     VALUES (?, ? ,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            stm.setInt(2, cpuID);
            stm.setString(3, content);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        CommentDAO c = new CommentDAO();
        List<Comment> l = c.getAll(1);
        for (Comment comment : l) {
            System.out.println(comment.getContent());
        }
    }
}
