package charmander.Models.Daos;


import charmander.Models.Beans.Seguros;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SegurosDao extends DaoBase{
    public ArrayList<Seguros> listarseguros() {

        ArrayList<Seguros> lista = new ArrayList<>();

        String sql = "SELECT * FROM empresaseguros ";

        try (Connection conn = this.getConection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Seguros seguros = new Seguros();
                seguros.setIdSeguro(rs.getInt(1));
                seguros.setNombreEmpresa(rs.getString(2));
                lista.add(seguros);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CiudadesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
