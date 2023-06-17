package charmander.Servlet;

import Models.Daos.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletViajes", value = {"/ServletViajes","viajes"})
public class ServletViajes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");


        RequestDispatcher view;
        ViajesDao viajesDao = new ViajesDao();

        switch (action) {
            case "lista":
                request.setAttribute("listaEmpleados", viajesDao.listarViajes());
                view = request.getRequestDispatcher("employees/lista.jsp");
                view.forward(request, response);
                break;
                
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
