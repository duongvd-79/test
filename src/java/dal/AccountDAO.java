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
import model.Account;

/**
 *
 * @author duongvu
 */
public class AccountDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private List<Account> accountList = new ArrayList<>();

    private static Account setAccount(ResultSet rs) {
        Account account = new Account();
        try {
            account.setAccountID(rs.getInt("accountID"));
            account.setUserName(rs.getString("User Name"));
            account.setPassword(rs.getString("Password"));
            account.setDisplayName(rs.getString("Display Name"));
            account.setRoleID(rs.getInt("roleID"));
            account.setImg(rs.getString("Image"));
        } catch (SQLException e) {
        }
        return account;
    }

    public List<Account> getAll(Account account) {
        if (!isAdmin(account)) {
            return null;
        }
        String sql = "SELECT * FROM [Account]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account1 = setAccount(rs);
                accountList.add(account1);
            }
        } catch (SQLException e) {
        }
        return accountList;
    }

    public Account getAccount(String userName, String password) {
        String sql = "SELECT * FROM [Account] WHERE [User Name] = (?) AND [Password] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                /*
                [accountID]
                ,[User Name]
                ,[Password]
                ,[Display Name]
                ,[roleID]
                ,[Image]
                 */
                Account account = setAccount(rs);
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByName(String userName) {
        String sql = "SELECT * FROM [Account] WHERE [User Name] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            rs = stm.executeQuery();
            if (rs.next()) {
                Account account = setAccount(rs);
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByID(int accountID) {
        String sql = "SELECT * FROM [Account] WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountID);
            rs = stm.executeQuery();
            if (rs.next()) {
                Account account = setAccount(rs);
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addAccount(String userName, String password,
            String displayName, int roleID) {
        String sql = "INSERT INTO [Account]\n"
                + "           ([User Name]\n"
                + "           ,[Password]\n"
                + "           ,[Display Name]\n"
                + "           ,[roleID]\n"
                + "           ,[Image])\n"
                + "     VALUES((?), (?), (?), (?), '')";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setString(2, password);
            stm.setString(3, displayName);
            stm.setInt(4, roleID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUsername(int accountID, String userName) {
        String sql = "UPDATE [Account]\n"
                + "   SET [User Name] = (?) WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userName);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updatePassword(int accountID, String password) {
        String sql = "UPDATE [Account]\n"
                + "   SET [Password] = (?) WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, password);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateDisplayName(int accountID, String displayName) {
        String sql = "UPDATE [Account]\n"
                + "   SET [Display Name] = (?) WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, displayName);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateRoleID(Account a, int accountID, int roleID) {
        if (!isAdmin(a)) {
            return;
        }
        String sql = "UPDATE [Account]\n"
                + "   SET [roleID] = (?) WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, roleID);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    private boolean isAdmin(Account account) {
        return account.getRoleID() == 1;
    }

    public void updateImg(int accountID, String img) {
        String sql = "UPDATE [Account]\n"
                + "   SET [Image] = (?) WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, img);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delAccount(int id) {
        String sql = "DELETE FROM [Account] WHERE [accountID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        Account ac = a.getAccountByID(1);
        a.updateRoleID(ac, 2, 1);
    }
}
