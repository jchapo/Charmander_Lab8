package charmander.Models.Beans;

import java.time.LocalDate;
import java.util.Date;

public class ViajesBeans {
    private int identificadorViaje;
    private Date fechaReserva;
    private Date fechaViaje;
    private Ciudad CiudadOrigen;
    private Ciudad CiudadDestino;
    private String nombreEmpresaSeguro;
    private int numeroBoletos;
    private int precioDestino;
    private int idUsuario;
    private int idespecialidad;
    private int idSeguro;


    public int getIdentificadorViaje() {
        return identificadorViaje;
    }

    public void setIdentificadorViaje(int identificadorViaje) {
        this.identificadorViaje = identificadorViaje;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public Date getFechaViaje() {
        return fechaViaje;
    }

    public void setFechaViaje(Date fechaViaje) {
        this.fechaViaje = fechaViaje;
    }

    public Ciudad getCiudadOrigen() {
        return CiudadOrigen;
    }

    public void setCiudadOrigen(Ciudad ciudadOrigen) {
        CiudadOrigen = ciudadOrigen;
    }

    public Ciudad getCiudadDestino() {
        return CiudadDestino;
    }

    public void setCiudadDestino(Ciudad ciudadDestino) {
        CiudadDestino = ciudadDestino;
    }

    public String getNombreEmpresaSeguro() {
        return nombreEmpresaSeguro;
    }

    public void setNombreEmpresaSeguro(String nombreEmpresaSeguro) {
        this.nombreEmpresaSeguro = nombreEmpresaSeguro;
    }

    public int getNumeroBoletos() {
        return numeroBoletos;
    }

    public void setNumeroBoletos(int numeroBoletos) {
        this.numeroBoletos = numeroBoletos;
    }

    public int getPrecioDestino() {
        return precioDestino;
    }

    public void setPrecioDestino(int precioDestino) {
        this.precioDestino = precioDestino;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdespecialidad() {
        return idespecialidad;
    }

    public void setIdespecialidad(int idespecialidad) {
        this.idespecialidad = idespecialidad;
    }

    public int getIdSeguro() {
        return idSeguro;
    }

    public void setIdSeguro(int idSeguro) {
        this.idSeguro = idSeguro;
    }
    private String C_origen;
    private String C_destino;

    public String getC_origen() {
        return C_origen;
    }

    public void setC_origen(String c_origen) {
        C_origen = c_origen;
    }

    public String getC_destino() {
        return C_destino;
    }

    public void setC_destino(String c_destino) {
        C_destino = c_destino;
    }

    public void setFechaReserva(Date fecha) {
    }
}
