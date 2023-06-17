package charmander.Servlet;

import charmander.Models.Daos.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletViajes", value = {"/ServletViajes"})
public class ServletViajes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");


        RequestDispatcher view;
        ViajesDao viajesDao = new ViajesDao();

        switch (action) {
            case "lista":
                request.setAttribute("listaViajes", viajesDao.listarViajes());
                view = request.getRequestDispatcher("viajes.jsp");
                view.forward(request, response);
                break;
            case "borrar":
                if (request.getParameter("id") != null) {
                    String employeeIdString = request.getParameter("id");
                    int employeeId = 0;
                    try {
                        employeeId = Integer.parseInt(employeeIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("ServletViajes?err=Error al borrar el empleado");
                    }

                    Employee emp = employeeDao.obtenerEmpleado(employeeId);

                    if (emp != null) {
                        try {
                            employeeDao.borrarEmpleado(employeeId);
                            response.sendRedirect("EmployeeServlet?msg=Empleado borrado exitosamente");
                        } catch (SQLException e) {
                            response.sendRedirect("EmployeeServlet?err=Error al borrar el empleado");
                        }
                    }
                } else {
                    response.sendRedirect("EmployeeServlet?err=Error al borrar el empleado");
                }
                break;
        }
    }
/*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }*/
}
