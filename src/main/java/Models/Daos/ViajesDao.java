package Models.Daos;
import Models.Beans.ViajesBeans;

import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends DaoBase{
    public ArrayList<ViajesBeans> listarViajes() {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.identificadorViaje, hv.fechaReserva, hv.fechaViaje,\n" +
                "       c1.nombreCiudad AS 'CiudadOrigen', c2.nombreCiudad AS 'CiudadDestino',\n" +
                "       es.nombreEmpresaSeguro, hv.numeroBoletos, hv.costoViaje\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades";

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

    private void fetchHistorialViajes(ViajesBeans v, ResultSet rs) throws SQLException {
        v.setIdentificadorViaje(rs.getInt("identificadorViaje"));
        v.setFechaReserva(rs.getDate("fechaReserva"));
        v.setFechaViaje(rs.getDate("fechaViaje"));
        v.setCiudadOrigen(rs.getString("CiudadOrigen"));
        v.setCiudadDestino(rs.getString("CiudadDestino"));
        v.setNombreEmpresaSeguro(rs.getString("nombreEmpresaSeguro"));
        v.setNumeroBoletos(rs.getInt("numeroBoletos"));
        v.setCostoViaje(rs.getInt("costoViaje"));

    }


}


