package Models.Beans;

import javax.swing.plaf.PanelUI;
import java.util.Date;

public class ViajesBeans {
    public int identificadorViaje;
    public Date fechaReserva;
    public Date fechaViaje;
    public String CiudadOrigen;
    public String CiudadDestino;
    public String nombreEmpresaSeguro;
    public int numeroBoletos;
    public int costoViaje;

    public int getIdentificadorViaje() {
        return identificadorViaje;
    }

    public void setIdentificadorViaje(int identificadorViaje) {
        this.identificadorViaje = identificadorViaje;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public Date getFechaViaje() {
        return fechaViaje;
    }

    public void setFechaViaje(Date fechaViaje) {
        this.fechaViaje = fechaViaje;
    }

    public String getCiudadOrigen() {
        return CiudadOrigen;
    }

    public void setCiudadOrigen(String ciudadOrigen) {
        CiudadOrigen = ciudadOrigen;
    }

    public String getCiudadDestino() {
        return CiudadDestino;
    }

    public void setCiudadDestino(String ciudadDestino) {
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

    public int getCostoViaje() {
        return costoViaje;
    }

    public void setCostoViaje(int costoViaje) {
        this.costoViaje = costoViaje;
    }
}
