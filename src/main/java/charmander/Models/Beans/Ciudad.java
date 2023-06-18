package charmander.Models.Beans;

public class Ciudad {
    private int idciudades;
    private String nombreCiudad;
    private int precioCiudad;

    public Ciudad() {
    }

    public Ciudad(String ciudad) {
        this.nombreCiudad = ciudad;
    }

    public int getIdciudades() {
        return idciudades;
    }

    public void setIdciudades(int idciudades) {
        this.idciudades = idciudades;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }

    public void setNombreCiudad(String nombreCiudad) {
        this.nombreCiudad = nombreCiudad;
    }

    public float getPrecioCiudad() {
        return precioCiudad;
    }

    public void setPrecioCiudad(int precioCiudad) {
        this.precioCiudad = precioCiudad;
    }
}
