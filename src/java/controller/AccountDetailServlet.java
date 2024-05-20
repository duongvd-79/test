/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import model.Account;

/**
 *
 * @author duongvu
 */

public class AccountDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null) {
            String e = "Login first!";
            request.setAttribute("e", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                String e = "Login first!";
                request.setAttribute("e", e);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                session.setAttribute("account", account);
                request.getRequestDispatcher("accountDetail.jsp").forward(request, response);
            }
        }
    }

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
        processRequest(request, response);
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
        HttpSession session = request.getSession(false);
        if (session == null) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            Account account = (Account) session.getAttribute("account");
            String userName = request.getParameter("userName");
            String displayName = request.getParameter("displayName");
            String password = request.getParameter("password");
            String newPassword = request.getParameter("newPassword");
            AccountDAO accountDAO = new AccountDAO();
            //Add image here
            boolean changeFlag = false;
//            try {
//                // Get the Part representing the file upload
//                Part filePart = request.getPart("file");
//
//                // Get the filename from the filePart
//                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//
//                // Define the directory to save the file
//                String uploadDirectory = getServletContext().getRealPath("/assets/ava"); // Change this to the desired directory on your server
//
//                // Ensure the directory exists
//                Path uploadPath = Paths.get(uploadDirectory);
//                Files.createDirectories(uploadPath);
//
//                // Save the file to the specified directory
//                String fileLocation = null;
//                filePart.write(uploadDirectory + File.separator + fileName);
//                fileLocation = "assets/ava/" + fileName;
//                if (fileLocation != null) {
//                    if (account != null && (account.getImg() == null || !fileLocation.equals(account.getImg()))) {
//                        account.setImg(fileLocation);
//                        accountDAO.updateImg(account.getAccountID(), fileLocation);
//                        changeFlag = true;
//                    }
//                }
//            } catch (IOException e) {
//                // Handle file writing error
//                e.printStackTrace();
//                response.getWriter().write("Error occurred while uploading the file.");
//                return; // Exit method if file upload fails
//            }

            if (!userName.equals(account.getUserName())) {
                account.setUserName(userName);
                accountDAO.updateUsername(account.getAccountID(), userName);
                changeFlag = true;
            }
            if (!displayName.equals(account.getDisplayName())) {
                account.setDisplayName(displayName);
                accountDAO.updateDisplayName(account.getAccountID(), displayName);
                changeFlag = true;
            }
            if (password.equals(account.getPassword())) {
                if (!password.equals(newPassword)) {
                    account.setPassword(newPassword);
                    accountDAO.updatePassword(account.getAccountID(), password);
                    changeFlag = true;
                }
            } else if (!password.equals(account.getPassword()) && !newPassword.equals("")) {
                String failedNoti = "Failed to update: Wrong password!";
                request.setAttribute("failedNoti", failedNoti);
            }
            if (changeFlag) {
                String noti = "Updated successfully!";
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("accountDetail.jsp").forward(request, response);
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
