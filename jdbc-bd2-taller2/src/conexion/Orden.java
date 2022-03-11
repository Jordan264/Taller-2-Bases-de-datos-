package conexion;

public class Orden {
	
	private Integer Id_Orden_Compra;
    private String Encabezado;
    private Integer Valor_a_pagar;
    private String Estado_orden;
    private Integer Id_carrito;

    

    public Orden(Integer id_Orden_Compra, String encabezado, Integer valor_a_pagar, String estado_orden,
			Integer Id_carrito) {
		Id_Orden_Compra = id_Orden_Compra;
		Encabezado = encabezado;
		Valor_a_pagar = valor_a_pagar;
		Estado_orden = estado_orden;
		this.Id_carrito = Id_carrito;
	}

	public Orden() {
    }

	public Integer getId_Orden_Compra() {
		return Id_Orden_Compra;
	}

	public void setId_Orden_Compra(Integer id_Orden_Compra) {
		Id_Orden_Compra = id_Orden_Compra;
	}

	public String getEncabezado() {
		return Encabezado;
	}

	public void setEncabezado(String encabezado) {
		Encabezado = encabezado;
	}

	public Integer getValor_a_pagar() {
		return Valor_a_pagar;
	}

	public void setValor_a_pagar(Integer valor_a_pagar) {
		Valor_a_pagar = valor_a_pagar;
	}

	public String getEstado_orden() {
		return Estado_orden;
	}

	public void setEstado_orden(String estado_orden) {
		Estado_orden = estado_orden;
	}

	public Integer getId_carrito() {
		return Id_carrito;
	}

	public void setLastName(Integer id_carrito) {
		this.Id_carrito = id_carrito;
	}

 
}
