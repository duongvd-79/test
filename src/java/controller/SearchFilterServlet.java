/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CpuDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CPU;

/**
 *
 * @author duongvu
 */
public class SearchFilterServlet extends HttpServlet {

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
        String igp = request.getParameter("igp");
        String litho = request.getParameter("litho");
        String socket = request.getParameter("socket");
        String family = request.getParameter("family");
        String thread_raw = request.getParameter("thread");
        String core_raw = request.getParameter("core");
        String tdp = request.getParameter("tdp");
        String mfgr = request.getParameter("mfgr");
        int core = (core_raw == null || core_raw.equals("")) ? 0 : Integer.parseInt(core_raw);
        int thread = (thread_raw == null || thread_raw.equals("")) ? 0 : Integer.parseInt(thread_raw);
        CpuDAO c = new CpuDAO();

        request.setAttribute("igp", igp);
        request.setAttribute("litho", litho);
        request.setAttribute("socket", socket);
        request.setAttribute("family", family);
        request.setAttribute("thread", thread);
        request.setAttribute("core", core);
        request.setAttribute("tdp", tdp);
        request.setAttribute("mfgr", mfgr);
        List<CPU> cpuList = c.getBy(mfgr, tdp, core, thread, family, socket, litho, igp);
        request.setAttribute("cpulist", cpuList);
        request.getRequestDispatcher("cpulist").forward(request, response);

        
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
