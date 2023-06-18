package charmander.Models.Daos;

import charmander.Models.Beans.Ciudad;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CiudadesDao extends DaoBase{

    public ArrayList<Ciudad> listarciudades() {

        ArrayList<Ciudad> lista = new ArrayList<>();

        String sql = "SELECT * FROM ciudades;";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Ciudad ciudad = new Ciudad();
                ciudad.setIdciudades(rs.getInt(1));
                ciudad.setNombreCiudad(rs.getString(2));
                ciudad.setPrecioCiudad(rs.getInt(3));
                lista.add(ciudad);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
