<%@ Page Title="Concesionaria - Gestión de Coches" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
CodeBehind="Tiendita.aspx.cs" Inherits="Crud_WebForms.Tiendita" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <h1>Gestión de Coches</h1>
 
 <asp:Label ID="lblCodigo" runat="server" CssClass="badge" BackColor="#003399" FontSize="Small">Placa</asp:Label>
 <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ejemplo: ABC-1234"></asp:TextBox>
 
 <asp:Label ID="lblNombre" runat="server" CssClass="badge" BackColor="#003399" FontSize="Small">Marca</asp:Label>
 <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ejemplo: Toyota"></asp:TextBox>
 
 <asp:Label ID="lblDesc" runat="server" CssClass="badge" BackColor="#003399" FontSize="Small">Modelo</asp:Label>
 <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" placeholder="Ejemplo: Corolla"></asp:TextBox>
 
 <asp:Label ID="lblExistencias" runat="server" CssClass="badge" BackColor="#003399" FontSize="Small">Año</asp:Label>
 <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" placeholder="Ejemplo: 2023"></asp:TextBox>
 
 <asp:Label ID="lblPrecio" runat="server" CssClass="badge" BackColor="#003399" FontSize="Small">Tipo</asp:Label>
 <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Ejemplo: Sedán, SUV, Pickup"></asp:TextBox>
 
 <br />
 <asp:Button ID="btnAgregar" runat="server" Text="Agregar Coche" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
 <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Coche" CssClass="btn btn-success" OnClick="btnActualizar_Click" />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:Label ID="lblMensaje" CssClass="form-label" runat="server" Text=""></asp:Label>
 
 <br />
 <br />
 
 <asp:GridView ID="gridProductos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover"
DataKeyNames="id" OnRowDeleting="gridProductos_RowDeleting" OnSelectedIndexChanged="gridProductos_SelectedIndexChanged">
 <Columns>
 <asp:TemplateField ShowHeader="False">
 <ItemTemplate>
 <asp:Button ID="btn_Seleccionar" runat="server" CausesValidation="False" CommandName="Select"
Text="Seleccionar" CssClass="btn btn-info btn-sm" />
 </ItemTemplate>
 </asp:TemplateField>
 <asp:TemplateField ShowHeader="False">
 <ItemTemplate>
 <asp:Button ID="btn_Eliminar" runat="server" CausesValidation="False" CommandName="Delete"
Text="Eliminar" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('¿Está seguro de eliminar este coche?');" />
 </ItemTemplate>
 </asp:TemplateField>
 <asp:BoundField DataField="placa" HeaderText="Placa" />
 <asp:BoundField DataField="marca" HeaderText="Marca" />
 <asp:BoundField DataField="modelo" HeaderText="Modelo" />
 <asp:BoundField DataField="anio" HeaderText="Año" />
 <asp:BoundField DataField="tipo" HeaderText="Tipo" />
 <asp:BoundField DataField="fecha_registro" HeaderText="Fecha Registro" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
 <asp:BoundField DataField="fecha_actualizacion" HeaderText="Última Actualización" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
 </Columns>
 <EmptyDataTemplate>
 <div class="alert alert-info">No hay coches registrados en la base de datos.</div>
 </EmptyDataTemplate>
 </asp:GridView>
 </asp:Content>