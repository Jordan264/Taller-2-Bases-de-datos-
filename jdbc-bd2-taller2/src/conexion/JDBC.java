package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class JDBC {

	private static final String url = "jdbc:postgresql://localhost/db_nana";
	private static final String user = "postgres";
	private static final String password = "postgres";

	/**
	 * Connect to the PostgreSQL database
	 *
	 * @return a Connection object
	 */
	public static Connection connect() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("Connected to the PostgreSQL server successfully.");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return conn;
	}

	public static long insertOrden(Orden orden) {
		String SQL = "INSERT INTO Orden_Compra( Id_Orden_Compra,Encabezado,Valor_a_pagar,Estado_orden,Id_carrito) "
				+ "VALUES(?,?,?,?,?)";

		long id = 0;

		try (Connection conn = connect();
				PreparedStatement pstmt = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, orden.getId_Orden_Compra());
			pstmt.setString(2, orden.getEncabezado());
			pstmt.setInt(3, orden.getValor_a_pagar());
			pstmt.setString(4, orden.getEstado_orden());
			pstmt.setInt(5, orden.getId_carrito());

			int affectedRows = pstmt.executeUpdate();
			// check the affected rows
			if (affectedRows > 0) {
				// get the ID back
				try (ResultSet rs = pstmt.getGeneratedKeys()) {
					if (rs.next()) {
						id = rs.getLong(1);
					}
				} catch (SQLException ex) {
					System.out.println(ex.getMessage());
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return id;
	}

	public static void insertOrdenes(List<Orden> ordenList) {
		String SQL = "INSERT INTO Orden_Compra( Id_Orden_Compra,Encabezado,Valor_a_pagar,Estado_orden,Id_carrito) "
				+ "VALUES(?,?,?,?,?)";
		try (Connection conn = connect(); PreparedStatement statement = conn.prepareStatement(SQL);) {
			int count = 0;

			for (Orden orden : ordenList) {

				statement.setInt(1, orden.getId_Orden_Compra());
				statement.setString(2, orden.getEncabezado());
				statement.setInt(3, orden.getValor_a_pagar());
				statement.setString(4, orden.getEstado_orden());
				statement.setInt(5, orden.getId_carrito());

				statement.addBatch();
				count++;
				// execute every 100 rows or less
				if (count % 100 == 0 || count == ordenList.size()) {
					statement.executeBatch();
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}

	public static long insertOrdenProducto(OrdenProducto ordenProducto) {
		String SQL = "INSERT INTO Orden_Producto( Id_Orden_Compra,Id_carrito,Cantidad_Producto) " + "VALUES(?,?,?)";

		long id = 0;

		try (Connection conn = connect();
				PreparedStatement pstmt = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, ordenProducto.getId_Orden_Compra());
			pstmt.setInt(2, ordenProducto.getId_carrito());
			pstmt.setInt(3, ordenProducto.getCantidad_Producto());

			int affectedRows = pstmt.executeUpdate();
			// check the affected rows
			if (affectedRows > 0) {
				// get the ID back
				try (ResultSet rs = pstmt.getGeneratedKeys()) {
					if (rs.next()) {
						id = rs.getLong(1);
					}
				} catch (SQLException ex) {
					System.out.println(ex.getMessage());
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return id;
	}

	public static void insertOrdenesProductos(List<OrdenProducto> ordenProductoList) {
		String SQL = "INSERT INTO Orden_Producto( Id_Orden_Compra,Id_carrito,Cantidad_Producto) " + "VALUES(?,?,?)";
		try (Connection conn = connect(); PreparedStatement statement = conn.prepareStatement(SQL);) {
			int count = 0;

			for (OrdenProducto ordenProducto : ordenProductoList) {

				statement.setInt(1, ordenProducto.getId_Orden_Compra());
				statement.setInt(2, ordenProducto.getId_carrito());
				statement.setInt(3, ordenProducto.getCantidad_Producto());

				statement.addBatch();
				count++;
				// execute every 100 rows or less
				if (count % 100 == 0 || count == ordenProductoList.size()) {
					statement.executeBatch();
				}
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}

	/**
	 * @param args the command line arguments
	 */
	public static void main(String[] args) {

		JDBC app = new JDBC();
		app.connect();

		ArrayList<Orden> ordenList = new ArrayList<>();
		ordenList.add(new Orden(1, "Breve resumen de los datos", 580000, "Aprobado", 1));
		insertOrdenes(ordenList);
		
		
		ArrayList<OrdenProducto> ordenProductoList = new ArrayList<>();
		ordenProductoList.add(new OrdenProducto(1, 1, 1));
		insertOrdenesProductos(ordenProductoList);


	}
}
