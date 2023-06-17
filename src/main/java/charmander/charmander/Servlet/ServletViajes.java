package charmander.charmander.Servlet;

import Models.Beans.ViajesBeans;
import Models.Daos.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletViajes", value = "/ServletViajes")
public class ServletViajes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ViajesDao viajesDao = new ViajesDao();
        request.setAttribute("ArrayViajes", viajesDao.tablaViajes());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("viajes.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
