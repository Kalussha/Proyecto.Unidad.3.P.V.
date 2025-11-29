# ?? Sistema de Gestión de Concesionaria

Aplicación web desarrollada en ASP.NET WebForms para la gestión integral de inventario de vehículos en una concesionaria.

## ?? Descripción

Este proyecto es un sistema CRUD (Create, Read, Update, Delete) completo que permite administrar el inventario de coches de una concesionaria, incluyendo operaciones de:

- ? Agregar nuevos vehículos al inventario
- ? Visualizar lista completa de vehículos
- ? Actualizar información de vehículos existentes
- ? Eliminar vehículos del inventario
- ? Interfaz intuitiva con GridView

## ??? Tecnologías Utilizadas

- **Framework:** ASP.NET WebForms
- **Target Framework:** .NET Framework 4.8
- **Lenguaje:** C# 7.3
- **Base de Datos:** MySQL
- **Frontend:** HTML, CSS, JavaScript
- **Librería de Datos:** MySql.Data (ADO.NET)

## ?? Requisitos Previos

Antes de ejecutar este proyecto, asegúrate de tener instalado:

- [Visual Studio 2019](https://visualstudio.microsoft.com/) o superior
- [MySQL Server 5.7](https://dev.mysql.com/downloads/mysql/) o superior
- .NET Framework 4.8 SDK
- MySQL Connector/NET

## ?? Configuración de la Base de Datos

### 1. Crear la base de datos

Ejecuta el siguiente script SQL en tu servidor MySQL:

```sql
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE coches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    cantidad INT NOT NULL DEFAULT 0,
    precio VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2. Datos de prueba (opcional)

```sql
INSERT INTO coches (codigo, nombre, descripcion, cantidad, precio) VALUES
('VW001', 'Volkswagen Golf', 'Compacto deportivo', 5, '$25,000'),
('FORD01', 'Ford Mustang', 'Deportivo americano', 3, '$45,000'),
('TOY001', 'Toyota Corolla', 'Sedán confiable', 10, '$22,000');
```

## ?? Instalación y Configuración

### 1. Clonar el repositorio

```bash
git clone https://github.com/Kalussha/Proyecto.Unidad.3.P.V..git
cd Proyecto.Unidad.3.P.V.
```

### 2. Configurar la conexión a la base de datos

Abre el archivo `Modelo/Conexion.cs` y actualiza las credenciales de MySQL:

```csharp
public void abrirBD()
{
    string servidor = "localhost";
    string bd = "tienda";
    string usuario = "root";
    string password = "TU_CONTRASEÑA_AQUI"; // ?? Cambia esto
    //...
}
```

### 3. Abrir en Visual Studio

1. Abre el archivo `.sln` con Visual Studio
2. Restaura los paquetes NuGet (clic derecho en la solución > Restore NuGet Packages)
3. Compila la solución (Ctrl + Shift + B)

### 4. Ejecutar el proyecto

1. Presiona F5 o haz clic en el botón "IIS Express"
2. La aplicación se abrirá en tu navegador predeterminado

## ?? Estructura del Proyecto

```
CRUD_web_from/
??? Modelo/                          # Capa de datos y lógica de negocio
?   ??? Conexion.cs                 # Clase de conexión a MySQL
?   ??? Concesionaria.cs            # Lógica CRUD de coches
?   ??? Modelo.csproj               # Proyecto de la capa de datos
?
??? Scripts/                         # Scripts SQL
?   ??? crear_base_datos.sql        # Script de creación de BD
?
??? Content/                         # Estilos CSS
??? Scripts/                         # JavaScript
?
??? Tiendita.aspx                   # Página principal (UI)
??? Tiendita.aspx.cs                # Code-behind de la página
??? Site.Master                     # Plantilla maestra
??? Web.config                      # Configuración de la aplicación
??? CRUD_web_from.csproj           # Proyecto web principal
```

## ?? Uso de la Aplicación

### Agregar un Coche

1. Completa los campos del formulario:
   - Código (único)
   - Nombre
   - Descripción
   - Cantidad
   - Precio
2. Haz clic en el botón **"Agregar"**
3. Verifica el mensaje de confirmación

### Actualizar un Coche

1. Selecciona un coche del GridView (clic en "Select")
2. Los datos se cargarán automáticamente en el formulario
3. Modifica los campos necesarios
4. Haz clic en el botón **"Actualizar"**

### Eliminar un Coche

1. Localiza el coche en el GridView
2. Haz clic en el botón **"Delete"** de la fila correspondiente
3. Confirma la acción

## ?? Advertencias de Seguridad

**IMPORTANTE:** Este proyecto es para fines educativos. Antes de usar en producción, considera:

### ?? Mejoras de Seguridad Recomendadas

1. **Inyección SQL:** Usa parámetros en lugar de concatenación de strings
   ```csharp
   // ? Vulnerable
   string sql = $"INSERT INTO coches VALUES('{codigo}')";
   
   // ? Seguro
   MySqlCommand cmd = new MySqlCommand("INSERT INTO coches VALUES(@codigo)", conn);
   cmd.Parameters.AddWithValue("@codigo", codigo);
   ```

2. **Credenciales:** NO almacenes contraseñas en el código
   - Usa `Web.config` con `connectionStrings`
   - Considera usar variables de entorno
   - Implementa cifrado de cadenas de conexión

3. **Validación:** Implementa validación del lado del servidor
   ```csharp
   if (string.IsNullOrWhiteSpace(txtCodigo.Text))
   {
       lblMensaje.Text = "El código es requerido";
       return;
   }
   ```

4. **Manejo de Errores:** Implementa logging adecuado
   - No muestres mensajes de error técnicos al usuario
   - Registra errores en archivos de log

## ?? Funcionalidades Principales

| Funcionalidad | Método | Descripción |
|--------------|--------|-------------|
| Listar Coches | `gridCoches()` | Carga todos los coches en el GridView |
| Agregar Coche | `agregarCoche()` | Inserta un nuevo coche en la BD |
| Actualizar Coche | `actualizarCoche()` | Modifica datos de un coche existente |
| Eliminar Coche | `eliminarCoche()` | Elimina un coche por ID |

## ?? Contribuciones

Las contribuciones son bienvenidas. Para cambios importantes:

1. Haz fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## ?? Problemas Conocidos

- [ ] Las contraseñas están hardcodeadas en el código
- [ ] No hay validación de entrada robusta
- [ ] Vulnerable a inyección SQL
- [ ] No implementa autenticación de usuarios

## ?? Tareas Pendientes

- [ ] Migrar a consultas parametrizadas
- [ ] Implementar sistema de login
- [ ] Agregar validaciones del lado del servidor
- [ ] Implementar paginación en GridView
- [ ] Agregar búsqueda y filtros
- [ ] Exportar datos a Excel/PDF

## ?? Licencia

Este proyecto es de código abierto y está disponible para fines educativos.

## ????? Autor

**Kalussha**
- GitHub: [@Kalussha](https://github.com/Kalussha)

## ?? Soporte

Si encuentras algún problema o tienes preguntas:
- Abre un [Issue](https://github.com/Kalussha/Proyecto.Unidad.3.P.V./issues)
- Revisa la [documentación](#)

---

? Si este proyecto te fue útil, considera darle una estrella en GitHub!
