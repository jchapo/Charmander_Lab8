package charmander.Servlet;
import java.text.ParseException;
import java.time.LocalDate;
import java.text.SimpleDateFormat;

import charmander.Models.Beans.Ciudad;
import charmander.Models.Beans.Seguros;
import charmander.Models.Beans.ViajesBeans;
import charmander.Models.Daos.CiudadesDao;
import charmander.Models.Daos.SegurosDao;
import charmander.Models.Daos.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;

import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.Callable;
import charmander.Models.Beans.Usuario;

@WebServlet(name = "ServletViajes", value = {"/ServletViajes"})
public class ServletViajes extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");


        RequestDispatcher view;
        ViajesDao viajesDao = new ViajesDao();
        CiudadesDao ciudadesDao = new CiudadesDao();
        SegurosDao segurosDao = new SegurosDao();

        switch (action) {
            case "lista":
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                System.out.println(idUsuario);
                System.out.println(idUsuario);
                request.setAttribute("listaViajes", viajesDao.listarViajes3(idUsuario));
                view = request.getRequestDispatcher("viajes.jsp");
                view.forward(request, response);
                break;

            case "agregar":
                request.setAttribute("listaCiudades", ciudadesDao.listarciudades());
                request.setAttribute("listaSeguros", segurosDao.listarseguros());
                view = request.getRequestDispatcher("nuevoviaje.jsp");
                view.forward(request, response);
                break;

            case "editar":
                if (request.getParameter("id") != null) {
                    String viajeIdString = request.getParameter("id");
                    int viajeID = 0;
                    try {
                        viajeID = Integer.parseInt(viajeIdString);
                    } catch (NumberFormatException ex) {
                        response.sendRedirect("ServletViajes");
                    }

                    ViajesBeans viaje = viajesDao.obtenerViaje(viajeID);

                    if (viaje != null) {
                        request.setAttribute("viaje", viaje);
                        request.setAttribute("listaCiudades", ciudadesDao.listarciudades());
                        request.setAttribute("listaSeguros", segurosDao.listarseguros());
                        view = request.getRequestDispatcher("editarviaje.jsp");
                        view.forward(request, response);
                    } else {
                        response.sendRedirect("ServletViajes");
                    }

                } else {
                    response.sendRedirect("ServletViajes");
                }

                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
        ViajesDao viajesdao = new ViajesDao();
        switch (action) {
            case "guardar":
                Ciudad ciudad = new Ciudad();
                ViajesBeans viajesbeans = new ViajesBeans();

                Random random = new Random();
                viajesbeans.setIdentificadorViaje(random.nextInt(90000000) + 10000000);

                String fechaParametro = request.getParameter("fecha-reserva");
                String pattern = "yyyy-MM-dd";
                SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
                Date date;
                try {
                    date = dateFormat.parse(fechaParametro);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                viajesbeans.setFechaReserva(date);

                String fechaParametroV = request.getParameter("fecha-viaje");
                String pattern2 = "yyyy-MM-dd";
                SimpleDateFormat dateFormat2 = new SimpleDateFormat(pattern2);
                Date date2;
                try {
                    date2 = dateFormat2.parse(fechaParametroV);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                viajesbeans.setFechaViaje(date2);

                String ciudad1 = request.getParameter("ciudad-origen");
                Ciudad ciudadO = new Ciudad(ciudad1);
                viajesbeans.setCiudadOrigen(ciudadO);

                String ciudad2 = request.getParameter("ciudad-origen");
                Ciudad ciudadD = new Ciudad(ciudad2);
                viajesbeans.setNombreEmpresaSeguro(request.getParameter("empresa-seguros"));
                viajesbeans.setNumeroBoletos(Integer.parseInt(request.getParameter("cantidad-boletos")));
                viajesbeans.setCiudadDestino(ciudadD);

              if (request.getParameter("viaje-id") == null) {
                    try {
                        viajesdao.guardarViaje(viajesbeans);
                        response.sendRedirect("EmployeeServlet?msg=Viaje guardado exitosamente");
                    } catch (SQLException ex) {
                        response.sendRedirect("EmployeeServlet?err=Error al guardar empleado");
                    }
                } else {
                    viajesbeans.setIdentificadorViaje(Integer.parseInt(request.getParameter("identificadorViaje")));
                    try {
                        viajesbeans.actualizarViaje(viajesbeans);
                        response.sendRedirect("EmployeeServlet?msg=Empleado actualizado exitosamente");
                    } catch (SQLException ex) {
                        response.sendRedirect("EmployeeServlet?err=Error al actualizar empleado");
                    }
                }
                break;
        }

    }
}

