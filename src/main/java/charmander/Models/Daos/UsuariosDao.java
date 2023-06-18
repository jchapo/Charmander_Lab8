package charmander.Models.Daos;

import charmander.Models.Beans.Especialidad;
import charmander.Models.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuariosDao extends DaoBase{
    public void guardarUsuario(Usuario user) throws SQLException {

        String sql = "INSERT INTO usuarios (nombre, apellido, fechaNacimiento, codigoPucp, correoPucp, contrasenia, confirmacionContrasenia, idespecialidad, costoTotal, contraHasheada)\n" +
                "VALUES (?,?,?,?,?,?,?,?,?,sha2(?,256))";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setUserParams(pstmt, user);
            pstmt.executeUpdate();
        }
    }
    private void setUserParams(PreparedStatement pstmt, Usuario user) throws SQLException {
        pstmt.setString(1, user.getNombre());
        pstmt.setString(2, user.getApellido());
        pstmt.setString(3, user.getFechaNacimiento());
        pstmt.setInt(4, user.getCodigoPucp());
        pstmt.setString(5, user.getCorreoPucp());
        pstmt.setString(6, user.getContrasenia());
        pstmt.setString(7, user.getConfirmacionContrasenia());
        pstmt.setInt(8, user.getIdEspecialidad());
        pstmt.setInt(9, 0);
        pstmt.setString(10, user.getContrasenia());
    }

    public ArrayList<Especialidad> listarEspecialidades() {

        ArrayList<Especialidad> lista = new ArrayList<>();

        String sql = "SELECT * FROM especialidad";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Especialidad especialidad = new Especialidad();
                especialidad.setIdEspecialidad(rs.getInt(1));
                especialidad.setNombreEspecialidad(rs.getString(2));
                lista.add(especialidad);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuariosDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    public Usuario validateUsernameAndPassword(String correoPucp, String password) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios e \n" +
                "where e.correoPucp = ? and e.contraHasheada = sha2(?,256);";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, correoPucp);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    usuario = obtenerUsuario(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

    public Usuario obtenerUsuario(int usuarioId) {

        Usuario usuario = null;

        String sql = "SELECT * FROM usuarios where idUsuario = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, usuarioId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    fetchUserData(usuario, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuario;
    }

    private void fetchUserData(Usuario usuario, ResultSet rs) throws SQLException {
        usuario.setIdUsuario(rs.getInt(1));
        usuario.setNombre(rs.getString(2));
        usuario.setApellido(rs.getString(3));
        usuario.setFechaNacimiento(rs.getString(4));
        usuario.setCodigoPucp(rs.getInt(5));
        usuario.setCorreoPucp(rs.getString(6));
        usuario.setIdEspecialidad(rs.getInt(9));
        usuario.setCostoTotal(rs.getInt(10));
    }
}
