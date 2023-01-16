/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clasesGenericas;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author SENA
 */
public class conectorBD {
    private String servidor;
    private String puerto;
    private String usuario;
    private String clave;
    private String baseDatos;
    
    private Connection conexion;
    
    public conectorBD(){
        servidor="localhost";
        puerto="5432";
        usuario="adsi1";
        clave="utilizar";
        baseDatos="salud";
    }
    
    public boolean conectar() {
        boolean conectado=false;
        try {
            Class.forName("org.postgresql.Driver");
            conexion= (Connection) DriverManager.getConnection("jdbc:postgresql://localhost:5432/salud","adsi1","utilizar");
            conectado=true;
                    
        } catch (ClassNotFoundException ex) {
            System.out.println("No se pudo conectar por el controlador"+ex.getMessage());
        }
        catch (SQLException ex) {
            System.out.println("No se pudo conectar a la base de datos"+ex.getMessage());
        }
        return conectado;
    }
    
    public void desconectar(){
        try {
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(conectorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ResultSet consultar(String cadenaSQL) {
        conectorBD conector=new conectorBD();
        if(!conector.conectar()) System.out.println("No se pudo conectar a la base de datos");
        ResultSet resultado=null;
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL,ResultSet.TYPE_SCROLL_SENSITIVE,0);
            resultado=sentencia.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error en la cadenaSQL"+cadenaSQL+"\n ERROR: "+ex.getMessage());
        }
        return resultado;
    }
    
    public static boolean ejecutarQuery(String cadenaSQL) {
        conectorBD conector=new conectorBD();
        if(!conector.conectar()) System.out.println("No se pudo conectar a la base de datos");
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
            boolean resultado=sentencia.execute();
            return resultado;
        } catch (SQLException ex) {
            System.out.println("Error al ejecutar la cadenaSQL"+cadenaSQL+"\n hERROR: "+ex.getMessage());
            return false;
        }
        
    }
    
}
