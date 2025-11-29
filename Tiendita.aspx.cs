using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crud_WebForms
{
    public partial class Tiendita : System.Web.UI.Page
    {
        Modelo.Concesionaria concesionaria;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                concesionaria = new Modelo.Concesionaria();
                concesionaria.gridCoches(gridProductos);
            }
        }
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            concesionaria = new Modelo.Concesionaria();
            int ejecuta = concesionaria.agregarCoche(
                txtCodigo.Text, 
                txtNombre.Text, 
                txtDesc.Text,
                Convert.ToInt32(txtCantidad.Text),
                txtPrecio.Text);
            
            if (ejecuta > 0)
            {
                concesionaria.gridCoches(gridProductos);
                lblMensaje.Text = "Coche Agregado";
                LimpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Coche No Agregado";
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            concesionaria = new Modelo.Concesionaria();
            int ejecuta = concesionaria.actualizarCoche(
                Convert.ToInt32(gridProductos.SelectedValue), 
                txtCodigo.Text, 
                txtNombre.Text, 
                txtDesc.Text,
                Convert.ToInt32(txtCantidad.Text),
                txtPrecio.Text);
            
            if (ejecuta > 0)
            {
                concesionaria.gridCoches(gridProductos);
                lblMensaje.Text = "Coche Modificado";
                LimpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Coche No Modificado";
            }
        }

        protected void gridProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigo.Text = gridProductos.SelectedRow.Cells[2].Text;
            txtNombre.Text = gridProductos.SelectedRow.Cells[3].Text;
            txtDesc.Text = gridProductos.SelectedRow.Cells[4].Text;
            txtCantidad.Text = gridProductos.SelectedRow.Cells[5].Text;
            txtPrecio.Text = gridProductos.SelectedRow.Cells[6].Text;
        }

        protected void gridProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            concesionaria = new Modelo.Concesionaria();
            int ejecuta = concesionaria.eliminarCoche(Convert.ToInt32(e.Keys["id"]));
            
            if (ejecuta > 0)
            {
                concesionaria.gridCoches(gridProductos);
                lblMensaje.Text = "Coche Eliminado";
                LimpiarCampos();
            }
            else
            {
                lblMensaje.Text = "Coche No Eliminado";
            }
        }

        private void LimpiarCampos()
        {
            txtCodigo.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtDesc.Text = string.Empty;
            txtCantidad.Text = string.Empty;
            txtPrecio.Text = string.Empty;
        }

        // Declaración del control GridView
        protected global::System.Web.UI.WebControls.GridView gridProductos;
    }
}