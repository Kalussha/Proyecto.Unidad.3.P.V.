using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient; // requerido para las consultas
using System.Web.UI.WebControls; // requerido para usar controles del FrontEnd
using System.Data;

namespace Modelo
{
    public class Producto
    {
        Conexion con;

        private DataTable TablaProductos()
        {
            DataTable productos = new DataTable(); //se declara un objeto de tipo DataTable para la carga del resultado de la consulta
            using (con = new Conexion())
            {
                con.abrirBD();
                string sql = "SELECT id, codigo, nombre, descripcion, precio_publico, existencias FROM producto";
                MySqlDataAdapter query = new MySqlDataAdapter(sql, con.ConexionBD);
                query.Fill(productos);
            }
            return productos;
        }

        public void gridProductos(GridView grid)
        {
            grid.DataSource = TablaProductos();
            grid.DataBind();
        }

        public int agregarProducto(string codigo, string nombre, string descripcion, decimal precio, int existencias)
        {
            int bandera = 0;
            using (con = new Conexion())
            {
                con.abrirBD();
                string sql = "INSERT INTO producto(codigo, nombre, descripcion, precio_publico, existencias) VALUES(@codigo, @nombre, @descripcion, @precio, @existencias)";
                MySqlCommand comando = new MySqlCommand(sql, con.ConexionBD);
                comando.Parameters.AddWithValue("@codigo", codigo);
                comando.Parameters.AddWithValue("@nombre", nombre);
                comando.Parameters.AddWithValue("@descripcion", descripcion);
                comando.Parameters.AddWithValue("@precio", precio);
                comando.Parameters.AddWithValue("@existencias", existencias);
                bandera = comando.ExecuteNonQuery(); // retorna 1 si se ejecutó o 0 sino
            }
            return bandera;
        }
    }
}