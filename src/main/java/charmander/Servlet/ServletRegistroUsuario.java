package charmander.Servlet;

import charmander.Models.Beans.Usuario;
import charmander.Models.Beans.Usuario;
import charmander.Models.Daos.UsuariosDao;
import charmander.Models.Daos.ViajesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;

@WebServlet(name = "ServletRegistroUsuario", value = "/ServletRegistroUsuario")
public class ServletRegistroUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "irFormularioCrear" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();
        switch (action) {
            case "irFormularioCrear":
                request.setAttribute("especialidades", usuariosDao.listarEspecialidades());
                request.getRequestDispatcher("registrousuario.jsp").forward(request, response);
                break;
            case "regresar":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();

        switch (action) {
            case "guardar":
                Usuario user = new Usuario();
                user.setNombre(request.getParameter("nombre"));

                user.setApellido(request.getParameter("apellido"));
                user.setFechaNacimiento(request.getParameter("nacimiento"));
                user.setCodigoPucp(Integer.parseInt(request.getParameter("codigoPucp")));
                user.setCorreoPucp(request.getParameter("correo"));

                user.setIdEspecialidad(Integer.parseInt(request.getParameter("especialidad")));
                user.setContrasenia(request.getParameter("contrasena"));
                user.setConfirmacionContrasenia(request.getParameter("confirmarContrasena"));

                // Validaciones
                if (!validarNombreApellido(user.getNombre()) || !validarNombreApellido(user.getApellido())) {

                }

                if (!validarEdad(user.getFechaNacimiento())) {

                }

                if (!validarCodigoPUCP(user.getCodigoPucp())) {

                }
                if (!validarCorreoPUCP(user.getCorreoPucp(), user.getCodigoPucp())) {

                }

                if (!validarContrasenia(user.getContrasenia())) {

                }

                if (!user.getContrasenia().equals(user.getConfirmacionContrasenia())) {
                    try {
                        usuariosDao.guardarUsuario(user);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }

                break;
        }
    }

    private boolean validarNombreApellido(String nombre) {
        return !Character.isDigit(nombre.charAt(0));
    }

    private boolean validarEdad(String fechaNacimiento) {
        LocalDate fechaNac = LocalDate.parse(fechaNacimiento);
        LocalDate fechaActual = LocalDate.now();

        // Calcula la edad en años
        int edad = Period.between(fechaNac, fechaActual).getYears();

        // Verifica que la edad cumpla con los requisitos
        return edad >= 18 && edad < 30;
    }

    private boolean validarCodigoPUCP(int codigoPucp) {
        String codigoString = String.valueOf(codigoPucp);
        return codigoString.length() == 8 && codigoString.matches("\\d+");
    }

    private boolean validarCorreoPUCP(String correoPucp, int codigoPucp) {
        String formatoCorrecto = "a" + codigoPucp + "@pucp.edu.pe";
        return correoPucp.equalsIgnoreCase(formatoCorrecto);
    }

    private boolean validarContrasenia(String contrasenia) {
        // Verifica que la contraseña tenga al menos una mayúscula, un número y un carácter especial
        boolean tieneMayuscula = false;
        boolean tieneNumero = false;
        boolean tieneCaracterEspecial = false;

        for (char c : contrasenia.toCharArray()) {
            if (Character.isUpperCase(c)) {
                tieneMayuscula = true;
            } else if (Character.isDigit(c)) {
                tieneNumero = true;
            } else if (!Character.isLetterOrDigit(c)) {
                tieneCaracterEspecial = true;
            }
        }
        return tieneMayuscula && tieneNumero && tieneCaracterEspecial;
    }
}