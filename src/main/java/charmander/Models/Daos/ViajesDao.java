package charmander.Models.Daos;
import charmander.Models.Beans.Ciudad;
import charmander.Models.Beans.ViajesBeans;

import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends DaoBase{
    public ArrayList<ViajesBeans> listarViajes() {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.identificadorViaje, hv.fechaReserva, hv.fechaViaje, c1.idciudades AS 'IdOrigen',\n" +
                "c1.nombreCiudad AS 'CiudadOrigen', c1.idciudades AS 'IdDestino', c1.nombreCiudad AS 'CiudadDestino',\n" +
                "es.nombreEmpresaSeguro, hv.numeroBoletos, c2.precioCiudad AS 'precioDestino', u.idUsuario, e.idespecialidad\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN usuarios u on u.idUsuario = hv.idUsuario\n" +
                "INNER JOIN especialidad e on e.idespecialidad = u.idespecialidad\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades\n" +
                "where e.idespecialidad = 1\n" +
                "ORDER BY hv.fechaViaje ASC;";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                ViajesBeans v = new ViajesBeans();
                fetchHistorialViajes(v, rs);
                listaViajes.add(v);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViajes;
    }

    public ArrayList<ViajesBeans> listarViajes2(int id) {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.identificadorViaje, hv.fechaReserva, hv.fechaViaje, c1.idciudades AS 'IdOrigen',\n" +
                "c1.nombreCiudad AS 'CiudadOrigen', c2.idciudades AS 'IdDestino', c2.nombreCiudad AS 'CiudadDestino',\n" +
                "es.nombreEmpresaSeguro, hv.numeroBoletos, c2.precioCiudad, u.idUsuario, e.idespecialidad\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN usuarios u on u.idUsuario = hv.idUsuario\n" +
                "INNER JOIN especialidad e on e.idespecialidad = u.idespecialidad\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades\n" +
                "where e.idespecialidad = 1 AND u.idUsuario = ?\n" +
                "ORDER BY hv.fechaViaje ASC;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    ViajesBeans viajesbeans = new ViajesBeans();
                    fetchHistorialViajes(viajesbeans, rs);

                    listaViajes.add(viajesbeans);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaViajes;
    }

    public ArrayList<ViajesBeans> listarViajes3(int id) {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.identificadorViaje,hv.fechaReserva,hv.fechaViaje,c1.idciudades AS 'IdOrigen',c1.nombreCiudad AS 'CiudadOrigen',\n" +
                "    c1.idciudades AS 'IdDestino',c1.nombreCiudad AS 'CiudadDestino',es.nombreEmpresaSeguro,hv.numeroBoletos,hv.costoUnitario FROM historialviajes hv\n" +
                "    INNER JOIN usuarios u ON u.idUsuario = hv.idUsuario\n" +
                "    INNER JOIN especialidad e ON e.idespecialidad = u.idespecialidad\n" +
                "    INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "    INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "    INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades\n" +
                "WHERE u.idUsuario = ? ORDER BY hv.fechaViaje ASC;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    ViajesBeans viajesbeans = new ViajesBeans();
                    fetchHistorialViajes2(viajesbeans, rs);

                    listaViajes.add(viajesbeans);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaViajes;
    }


    public void guardarViaje(ViajesBeans viaje) throws SQLException {

        String sql = "INSERT INTO employees (identificadorViaje, fechaReserva, fechaViaje, CiudadOrigen, CiudadDestino, nombreEmpresaSeguro, numeroBoletos, commission_pct, manager_id, department_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setViajesParams(pstmt, viaje);
            pstmt.executeUpdate();
        }
    }


    public void crearViaje(ViajesBeans viaje) throws SQLException {

        String sql = "INSERT INTO viajes (identificadoViaje, fechaReserva, fechaViaje, CiudadOrigen, CiudadDestino, nombreEmpresaSeguro, numeroBoletos, costoViaje) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?,)";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setViajesParams(pstmt, viaje);
            pstmt.executeUpdate();
        }
    }

    public ViajesBeans obtenerViaje(int viajeID) {

        ViajesBeans viajesBeans = null;

        String sql = "SELECT hv.identificadorViaje, hv.fechaReserva, hv.fechaViaje, c1.idciudades AS 'IdOrigen',\n" +
                "c1.nombreCiudad AS 'CiudadOrigen', c1.idciudades AS 'IdDestino', c1.nombreCiudad AS 'CiudadDestino',\n" +
                "es.nombreEmpresaSeguro, hv.numeroBoletos, c2.precioCiudad AS 'precioDestino', u.idUsuario, e.idespecialidad\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN usuarios u on u.idUsuario = hv.idUsuario\n" +
                "INNER JOIN especialidad e on e.idespecialidad = u.idespecialidad\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades\n" +
                "where hv.identificadorViaje = ?\n" +
                "ORDER BY hv.fechaViaje ASC;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, viajeID);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    viajesBeans = new ViajesBeans();
                    fetchHistorialViajes(viajesBeans, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return viajesBeans;
    }

    private void setViajesParams(PreparedStatement pstmt, ViajesBeans viaje) throws SQLException {
        pstmt.setInt(1, viaje.getIdentificadorViaje());
        pstmt.setDate( 2, (Date)viaje.getFechaReserva());
        pstmt.setDate(3, (Date)viaje.getFechaViaje());
        pstmt.setString(4, viaje.getC_origen());
        pstmt.setString(5, viaje.getC_destino());
        pstmt.setString(6, viaje.getNombreEmpresaSeguro());
        pstmt.setInt(7, viaje.getNumeroBoletos());
    }


    private void fetchHistorialViajes(ViajesBeans v, ResultSet rs) throws SQLException {
        v.setIdentificadorViaje(rs.getInt("identificadorViaje"));
        v.setFechaReserva(rs.getDate("fechaReserva"));
        v.setFechaViaje(rs.getDate("fechaViaje"));

        Ciudad ciudadO = new Ciudad();
        ciudadO.setIdciudades(rs.getInt("IdOrigen"));
        ciudadO.setNombreCiudad(rs.getString("CiudadOrigen"));
        v.setCiudadOrigen(ciudadO);

        Ciudad ciudadD = new Ciudad();
        ciudadD.setIdciudades(rs.getInt("IdDestino"));
        ciudadD.setNombreCiudad(rs.getString("CiudadDestino"));
        v.setCiudadDestino(ciudadD);

        v.setNombreEmpresaSeguro(rs.getString("nombreEmpresaSeguro"));
        v.setNumeroBoletos(rs.getInt("numeroBoletos"));
        v.setPrecioDestino(rs.getInt("precioDestino"));
        v.setIdUsuario(rs.getInt("idUsuario"));
        v.setIdespecialidad(rs.getInt("idespecialidad"));

    }
    private void fetchHistorialViajes2(ViajesBeans v, ResultSet rs) throws SQLException {
        v.setIdentificadorViaje(rs.getInt("identificadorViaje"));
        v.setFechaReserva(rs.getDate("fechaReserva"));
        v.setFechaViaje(rs.getDate("fechaViaje"));

        Ciudad ciudadO = new Ciudad();
        ciudadO.setIdciudades(rs.getInt("IdOrigen"));
        ciudadO.setNombreCiudad(rs.getString("CiudadOrigen"));
        v.setCiudadOrigen(ciudadO);

        Ciudad ciudadD = new Ciudad();
        ciudadD.setIdciudades(rs.getInt("IdDestino"));
        ciudadD.setNombreCiudad(rs.getString("CiudadDestino"));
        v.setCiudadDestino(ciudadD);

        v.setNombreEmpresaSeguro(rs.getString("nombreEmpresaSeguro"));
        v.setNumeroBoletos(rs.getInt("numeroBoletos"));

    }


}


