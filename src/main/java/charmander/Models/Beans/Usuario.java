package charmander.Models.Beans;

public class Usuario {
    private int idUsuario;
    private String nombre;
    private String apellido;
    private String fechaNacimiento;
    private int codigoPucp;
    private String correoPucp;
    private String contrasenia;
    private String confirmacionContrasenia;
    private int idEspecialidad;
    private int costoTotal;
    private String contraHasheada;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getCodigoPucp() {
        return codigoPucp;
    }

    public void setCodigoPucp(int codigoPucp) {
        this.codigoPucp = codigoPucp;
    }

    public String getCorreoPucp() {
        return correoPucp;
    }

    public void setCorreoPucp(String correoPucp) {
        this.correoPucp = correoPucp;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getConfirmacionContrasenia() {
        return confirmacionContrasenia;
    }

    public void setConfirmacionContrasenia(String confirmacionContrasenia) {
        this.confirmacionContrasenia = confirmacionContrasenia;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public int getCostoTotal() {
        return costoTotal;
    }

    public void setCostoTotal(int costoTotal) {
        this.costoTotal = costoTotal;
    }

    public String getContraHasheada() {
        return contraHasheada;
    }

    public void setContraHasheada(String contraHasheada) {
        this.contraHasheada = contraHasheada;
    }
}
