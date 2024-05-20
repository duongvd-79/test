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
public class CpuListServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CpuDAO c = new CpuDAO();
        
        List<CPU> cpuList = (List<CPU>) request.getAttribute("cpulist");
        if (cpuList == null) {
            cpuList = c.getAll();
        }
        List<String> manuList = c.getAllManufacturer();
        List<String> tdpList = c.getAllTdp();
        List<Integer> coreList = c.getAllCore();
        List<Integer> threadList = c.getAllThread();
        List<String> familyList = c.getAllFamily();
        List<String> socketList = c.getAllSocket();
        List<String> lithoList = c.getAllLithography();
        
        // Remember select option ----------------------------------------------
        String selectMfgr = (String) request.getAttribute("mfgr");
        String selectTdp = (String) request.getAttribute("tdp");
        Integer selectCore = (Integer) request.getAttribute("core");
        Integer selectThread = (Integer) request.getAttribute("thread");
        String selectFamily = (String) request.getAttribute("family");
        String selectSocket = (String) request.getAttribute("socket");
        String selectLitho = (String) request.getAttribute("litho");
        
        request.setAttribute("lithosl", selectLitho);
        request.setAttribute("socketsl", selectSocket);
        request.setAttribute("mfgrsl", selectMfgr);
        request.setAttribute("tdpsl", selectTdp);
        request.setAttribute("coresl", selectCore);
        request.setAttribute("threadsl", selectThread);
        request.setAttribute("familysl", selectFamily);
        //----------------------------------------------------------------------
        
        request.setAttribute("litholist", lithoList);
        request.setAttribute("socketlist", socketList);
        request.setAttribute("manulist", manuList);
        request.setAttribute("tdplist", tdpList);
        request.setAttribute("corelist", coreList);
        request.setAttribute("threadlist", threadList);
        request.setAttribute("familylist", familyList);
        request.setAttribute("cpulist", cpuList);
        request.getRequestDispatcher("cpuList.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
