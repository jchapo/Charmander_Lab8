package Models.Daos;
import Models.Beans.ViajesBeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViajesDao {
    public ArrayList<ViajesBeans> tablaViajes() {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.identificadorViaje, hv.fechaReserva, hv.fechaViaje,\n" +
                "       c1.nombreCiudad AS 'CiudadOrigen', c2.nombreCiudad AS 'CiudadDestino',\n" +
                "       es.nombreEmpresaSeguro, hv.numeroBoletos, hv.costoViaje\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades";

        String url = "jdbc:mysql://localhost:3306/lab8";
        String username = "root";
        String password = "root";

        try (Connection connection = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet resultSet = stmt.executeQuery()) {

            while (resultSet.next()) {
                ViajesBeans v = new ViajesBeans();

                v.setIdentificadorViaje(resultSet.getInt("identificadorViaje"));
                v.setFechaReserva(resultSet.getDate("fechaReserva"));
                v.setFechaViaje(resultSet.getDate("fechaViaje"));
                v.setCiudadOrigen(resultSet.getString("CiudadOrigen"));
                v.setCiudadDestino(resultSet.getString("CiudadDestino"));
                v.setNombreEmpresaSeguro(resultSet.getString("nombreEmpresaSeguro"));
                v.setNumeroBoletos(resultSet.getInt("numeroBoletos"));
                v.setCostoViaje(resultSet.getInt("costoViaje"));
                listaViajes.add(v);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaViajes;
    }
}


