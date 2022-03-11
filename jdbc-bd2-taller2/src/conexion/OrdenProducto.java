package conexion;

public class OrdenProducto {

	private Integer Id_Orden_Compra;
	private Integer Id_carrito;
	private Integer Cantidad_Producto;

	public OrdenProducto(Integer id_Orden_Compra, Integer id_carrito, Integer cantidad_Producto) {
		Id_Orden_Compra = id_Orden_Compra;
		Id_carrito = id_carrito;
		Cantidad_Producto = cantidad_Producto;
	}

	public OrdenProducto() {
		
	}

	public Integer getId_Orden_Compra() {
		return Id_Orden_Compra;
	}

	public void setId_Orden_Compra(Integer id_Orden_Compra) {
		Id_Orden_Compra = id_Orden_Compra;
	}

	public Integer getId_carrito() {
		return Id_carrito;
	}

	public void setId_carrito(Integer id_carrito) {
		Id_carrito = id_carrito;
	}

	public Integer getCantidad_Producto() {
		return Cantidad_Producto;
	}

	public void setCantidad_Producto(Integer cantidad_Producto) {
		Cantidad_Producto = cantidad_Producto;
	}
	
	
	
}
