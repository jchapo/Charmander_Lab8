package charmander.Models.Daos;
import charmander.Models.Beans.ViajesBeans;

import java.sql.*;
import java.util.ArrayList;

public class ViajesDao extends DaoBase{
    public ArrayList<ViajesBeans> listarViajes() {

        ArrayList<ViajesBeans> listaViajes = new ArrayList<>();

        String sql = "SELECT hv.fechaViaje, hv.fechaReserva, c1.nombreCiudad AS 'CiudadOrigen', c2.nombreCiudad AS 'CiudadDestino',\n" +
                "es.nombreEmpresaSeguro, hv.identificadorViaje, hv.numeroBoletos, hv.costoViaje\n" +
                "FROM historialviajes hv\n" +
                "INNER JOIN empresaseguros es ON es.idempresaSeguros = hv.idempresaSeguro\n" +
                "INNER JOIN ciudades c1 ON hv.idCiudadOrigen = c1.idciudades\n" +
                "INNER JOIN ciudades c2 ON hv.idCiudadDestino = c2.idciudades\n" +
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
    /*public ViajesBeans obtenerViaje(int employeeId) {

        ViajesBeans viaje = null;

        String sql = "SELECT * FROM employees e \n"
                + "left join jobs j ON (j.job_id = e.job_id) \n"
                + "left join departments d ON (d.department_id = e.department_id)\n"
                + "left  join employees m ON (e.manager_id = m.employee_id)\n"
                + "WHERE e.employee_id = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, employeeId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    employee = new Employee();
                    fetchEmployeeData(employee, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return employee;
    }*/


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


