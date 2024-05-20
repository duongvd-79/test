/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CpuDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.CPU;

/**
 *
 * @author duongvu
 */
public class AdminServlet extends HttpServlet {

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
                AccountDAO a = new AccountDAO();
                CpuDAO c = new CpuDAO();
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");
        
        if (session == null) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            Account account = (Account) session.getAttribute("account");
            if (account == null || account.getRoleID() != 1) {
                String e = "Login first!";
                request.setAttribute("e", e);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                if (action != null && action.equals("delete")) {
                    String accountID_raw = request.getParameter("accountID");
                    try {
                        int accountID = Integer.parseInt(accountID_raw);
                        a.delAccount(accountID);
                    } catch (NumberFormatException e) {
                    }
                }
                List<CPU> cpuList = c.getAll();
                List<Account> list = a.getAll(account);
                request.setAttribute("cpulist", cpuList);
                session.setAttribute("allAccountList", list);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        AccountDAO a = new AccountDAO();
        HttpSession session = request.getSession(false);
        if (session == null) {
            String e = "No session!";
            request.setAttribute("e", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            Account account = (Account) session.getAttribute("account");
            String accountID_raw = request.getParameter("accountID");
            String role_raw = request.getParameter("role");
            try {
                int accountID = Integer.parseInt(accountID_raw);
                int role = Integer.parseInt(role_raw);
                a.updateRoleID(account, accountID, role);
            } catch (NumberFormatException e) {
            }
            List<Account> list = a.getAll(account);
            session.setAttribute("allAccountList", list);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
        //response.sendRedirect("admin");
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
