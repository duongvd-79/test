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
import model.CPU;

/**
 *
 * @author duongvu
 */
public class CpuDAO extends DBContext {

    private PreparedStatement stm;
    private ResultSet rs;
    private final List<CPU> cpuList = new ArrayList<>();

    private static CPU setCpu(ResultSet rs) {
        CPU cpu = new CPU();
        try {
            /*
                    [cpuID] [int] IDENTITY(1,1) NOT NULL,
                    [# of Displays Support] [varchar](512) NULL,
                    [4K Support] [varchar](512) NULL,
                    [Base Frequency] [varchar](512) NULL,
                    [Bus Speed] [varchar](512) NULL,
                    [Cache] [varchar](512) NULL,
                    [Core] [int] NULL,
                    [DirectX Support] [varchar](512) NULL,
                    [Family] [varchar](512) NULL,
                    [GPU Base Frequency] [varchar](512) NULL,
                    [Integrated GPU] [varchar](512) NULL,
                    [Lithography] [varchar](512) NULL,
                    [Max Memory Size] [varchar](512) NULL,
                    [Max Turbo Frequency] [varchar](512) NULL,
                    [Memory Type] [varchar](512) NULL,
                    [Title] [varchar](512) NULL,
                    [OpenGL Support] [varchar](512) NULL,
                    [Socket] [varchar](512) NULL,
                    [TDP] [varchar](512) NULL,
                    [Thread] [int] NULL,
                    [Model Number] [varchar](512) NULL,
                    [Image] [varchar](512) NULL,
                    [manufacturerID] [int] NULL,
             */
            cpu.setCpuID(rs.getInt("cpuID"));
            cpu.setNumbersOfDisplays(rs.getString("# of Displays Support"));
            cpu.setSupport4K(rs.getString("4K Support"));
            cpu.setBaseFreq(rs.getString("Base Frequency"));
            cpu.setBusSpeed(rs.getString("Bus Speed"));
            cpu.setCache(rs.getString("Cache"));
            cpu.setCore(rs.getInt("Core"));
            cpu.setDirectX(rs.getString("DirectX Support"));
            cpu.setFamily(rs.getString("Family"));
            cpu.setGpuBaseFreq(rs.getString("GPU Base Frequency"));
            cpu.setIntegratedGPU(rs.getString("Integrated GPU"));
            cpu.setLithography(rs.getString("Lithography"));
            cpu.setMaxMemory(rs.getString("Max Memory Size"));
            cpu.setMaxTurboFreq(rs.getString("Max Turbo Frequency"));
            cpu.setMemType(rs.getString("Memory Type"));
            cpu.setTitle(rs.getString("Title"));
            cpu.setOpenGL(rs.getString("OpenGL Support"));
            cpu.setSocket(rs.getString("Socket"));
            cpu.setTdp(rs.getString("TDP"));
            cpu.setThread(rs.getInt("Thread"));
            cpu.setModelNumber(rs.getString("Model Number"));
            cpu.setImg(rs.getString("Image"));
            cpu.setManufacturerID(rs.getInt("manufacturerID"));
        } catch (SQLException e) {
        }
        return cpu;
    }

    public List<CPU> getAll() {
        String sql = "SELECT * FROM [CPU]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                CPU cpu = setCpu(rs);
                cpuList.add(cpu);
            }
            return cpuList;
        } catch (SQLException e) {
        }
        return null;
    }

    public CPU getById(int cpuID) {
        String sql = "SELECT * FROM [CPU] WHERE [cpuID] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cpuID);
            rs = stm.executeQuery();
            if (rs.next()) {
                CPU cpu = setCpu(rs);
                return cpu;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<String> getAllManufacturer() {
        String sql = "SELECT * FROM [CPUManufacturer]";
        List<String> manuList = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                manuList.add(rs.getString("Name"));
            }
        } catch (SQLException e) {
        }
        return manuList;
    }

    public List<String> getAllTdp() {
        String sql = "SELECT DISTINCT [TDP] FROM [CPU]";
        List<String> tdpList = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                tdpList.add(rs.getString("TDP"));
            }
        } catch (SQLException e) {
        }
        return tdpList;
    }

    public List<Integer> getAllCore() {
        String sql = "SELECT DISTINCT [Core] FROM [CPU]";
        List<Integer> coreList = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                coreList.add(rs.getInt("Core"));
            }
        } catch (SQLException e) {
        }
        return coreList;
    }

    public List<Integer> getAllThread() {
        String sql = "SELECT DISTINCT [Thread] FROM [CPU]";
        List<Integer> threadList = new ArrayList();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                threadList.add(rs.getInt("Thread"));
            }
        } catch (SQLException e) {
        }
        return threadList;
    }

    private String getManufacturerByID(int id) {
        String sql = "SELECT * FROM [CPUManufacturer] WHERE [manufacturerID] = (?)";
        String name = "";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                name = rs.getString("Name");
            }
        } catch (SQLException e) {
        }
        return name;
    }

    public List<String> getAllFamily() {
        String sql = "SELECT DISTINCT [Family] FROM [CPU]";
        List<String> familyList = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                familyList.add(rs.getString("Family"));
            }
        } catch (SQLException e) {
        }
        return familyList;
    }

    private String getManufacturerBySocket(String socket) {
        String sqlCpu = "SELECT * FROM [CPU] WHERE [Socket] = (?)";
        String name = "";
        int manu = 0;
        try {
            stm = connection.prepareStatement(sqlCpu);
            stm.setString(1, socket);
            rs = stm.executeQuery();
            if (rs.next()) {
                manu = rs.getInt("manufacturerID");
            }
            name = getManufacturerByID(manu);
        } catch (SQLException e) {
        }
        return name;
    }

    public List<String> getAllSocket() {
        String sql = "SELECT DISTINCT [Socket] FROM [CPU]";
        List<String> socketList = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Socket");
                CpuDAO c = new CpuDAO();
                socketList.add(c.getManufacturerBySocket(name) + " " + name);
            }
        } catch (SQLException e) {
        }
        return socketList;
    }

    public List<String> getAllLithography() {
        String sql = "SELECT DISTINCT [Lithography] FROM [CPU]";
        List<String> lithoList = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                lithoList.add(rs.getString("Lithography"));
            }
        } catch (SQLException e) {
        }
        return lithoList;
    }

    private int getManufacturerIDByName(String name) {
        String sql = "SELECT * FROM [CPUManufacturer] WHERE [Name] = (?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("manufacturerID");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<CPU> getByManu(String manu) {
        String sql = "SELECT * FROM [CPU] WHERE [manufacturerID] = (?)";
        CpuDAO c = new CpuDAO();
        int manuID = c.getManufacturerIDByName(manu);
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, manuID);
            rs = stm.executeQuery();
            while (rs.next()) {
                CPU cpu = setCpu(rs);
                cpuList.add(cpu);
            }
        } catch (SQLException e) {
        }
        return cpuList;
    }

    public List<CPU> getBy(String manu, String tdp, int core, int thread, String family,
            String socket, String litho, String igpu) {
        String sql = "SELECT * FROM [CPU] WHERE (1 = 1)";
        CpuDAO c = new CpuDAO();
        if (!manu.equals("")) {
            sql += " AND [manufacturerID] = " + c.getManufacturerIDByName(manu);
        }
        if (!tdp.equals("")) {
            sql += " AND [TDP] = " + "'" + tdp + "'";
        }
        if (core != 0) {
            sql += " AND [Core] = " + core;
        }
        if (thread != 0) {
            sql += " AND [Thread] = " + thread;
        }
        if (!family.equals("")) {
            sql += " AND [Family] = " + "'" + family + "'";
        }
        if (!socket.equals("")) {
            sql += " AND [Socket] = " + "'" + socket + "'";
        }
        if (!litho.equals("")) {
            sql += " AND [Lithography] = " + "'" + litho + "'";
        }
        if (!igpu.equals("")) {
            if (igpu.equals("No")) {
                sql += " AND [Integrated GPU] = 'None'";
            } else {
                sql += " AND NOT [Integrated GPU] = 'None'";
            }
        }
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                CPU cpu = setCpu(rs);
                cpuList.add(cpu);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return cpuList;
    }

    public static void main(String[] args) {
        CpuDAO c = new CpuDAO();
        List l = c.getBy("", "65 W", 0, 0, "", "", "14 nm", "");
        for (Object cpu : l) {
            System.out.println(cpu.toString());
        }
    }
}
