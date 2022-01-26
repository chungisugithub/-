package DBPKG;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
public class TestConnection {

	public static void main(String[] args) throws Exception {
		
		String query = "select * from employees"
				+ " where first_name = 'Donald'";
		ResultSet result;
			
		Connection con = getConnection();
		
		result = con.prepareStatement(query).executeQuery();
		
		while(result.next()) {
			System.out.println(result.getString("first_name"));
		}
	}

	private static Connection getConnection() throws Exception,
			SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
		return con;
	}
}
