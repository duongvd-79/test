/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentDAO;
import dal.ReplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author duongvu
 */
public class CommentServlet extends HttpServlet {

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
        CommentDAO c = new CommentDAO();
        ReplyDAO r = new ReplyDAO();
        String comment = request.getParameter("comment");
        String reply = request.getParameter("reply");
        String cpuID_raw = request.getParameter("cpuID");
        String commentID_raw = request.getParameter("commentID");
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
                try {
                    int cpuID = Integer.parseInt(cpuID_raw);
                    int commentID = Integer.parseInt(commentID_raw);
                    if (!"".equals(comment)) {
                        c.addComment(account.getAccountID(), cpuID, comment);
                    } else if (!"".equals(reply)) {
                        r.addReply(commentID, reply);
                    }
                } catch (NumberFormatException e) {
                }
                response.sendRedirect("cpu?cpuID=" + cpuID_raw + "#contact");
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
        processRequest(request, response);
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
