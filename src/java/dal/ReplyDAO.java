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
import model.Reply;

/**
 *
 * @author duongvu
 */
public class ReplyDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<Reply> replyList = new ArrayList<>();

    public List<Reply> getAllReply() {
        String sql = "select * from Reply";
        AccountDAO a= new AccountDAO();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Reply rep = new Reply();
                rep.setAccount(a.getAccountByID(rs.getInt("accountID")));
                rep.setCommentID(rs.getInt("commentID"));
                rep.setReplyID(rs.getInt("replyID"));
                rep.setContent(rs.getString("Content"));
                replyList.add(rep);
            }
        } catch (SQLException e) {
        }
        return replyList;
    }

    public void addReply(int commentID, String content) {
        String sql = "INSERT INTO [Reply] ([commentID], [Content]) VALUES((?), (?))";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, commentID);
            stm.setString(2, content);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
