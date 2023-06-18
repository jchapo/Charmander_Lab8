package charmander.Servlet;

import charmander.Models.Beans.Usuario;
import charmander.Models.Daos.UsuariosDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action") != null ? req.getParameter("action") : "login";

        if (action.equals("login")) {
            HttpSession session = req.getSession();
            if(session != null && session.getAttribute("usuarioLog") != null){

                Usuario usuario = (Usuario) session.getAttribute("usuarioLog");

                if(usuario.getIdUsuario()>0){ //estoy loggedIn
                    resp.sendRedirect(req.getContextPath() + "/ServletViajes");
                }else{ // no estoy loggedId
                    RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                    dispatcher.forward(req, resp);
                }
            }
        }else{ //logout
            req.getSession().invalidate();
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("inputEmail");
        String pass = req.getParameter("inputPassword");
        System.out.println(email);
        System.out.println(pass);

        UsuariosDao usuariosDao = new UsuariosDao();

        Usuario usuario = usuariosDao.validateUsernameAndPassword(email, pass);


        if (usuario != null) { //usuario y password correctos
            //validar especialidad
            int especialidad = usuario.getIdEspecialidad();

            if(especialidad == 1){
             HttpSession session = req.getSession();
             session.setAttribute("usuarioLog", usuario);
             session.setMaxInactiveInterval(300);//en segundos

                resp.sendRedirect(req.getContextPath() + "/ServletViajes?idUsuario=" + usuario.getIdUsuario());

            }else { //No pertenece a la especialidad
                req.setAttribute("err", "No perteneces a esta especilidad :(");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }

        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos ");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
