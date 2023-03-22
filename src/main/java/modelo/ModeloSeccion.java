package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ModeloSeccion extends Conector{
	
	public ArrayList<Seccion> secciones() {
		String sql = "SELECT * FROM secciones";
		Statement st;

		ArrayList<Seccion> secciones = new ArrayList<Seccion>();
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			Seccion s;
			while (rs.next()) {
				s = new Seccion();
				s.setId(rs.getInt("id"));
				s.setNombre(rs.getString("nombre"));
				
				secciones.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return secciones;
	}

}
