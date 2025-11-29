# Sistema de Gestión de Concesionaria - CRUD de Coches

## Descripción
Aplicación web ASP.NET Web Forms para gestionar el inventario de coches de una concesionaria.
Permite realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre la tabla de coches.

## Estructura de la Base de Datos

### Base de Datos: `concesionaria`
### Tabla: `coches`

| Campo | Tipo | Descripción |
|-------|------|-------------|
| id | INT | ID único auto-incremental (Primary Key) |
| placa | VARCHAR(20) | Placa del vehículo (Único) |
| marca | VARCHAR(50) | Marca del vehículo |
| modelo | VARCHAR(50) | Modelo del vehículo |
| anio | INT | Año del vehículo |
| tipo | VARCHAR(20) | Tipo de vehículo (Sedán, SUV, Pickup, etc.) |
| fecha_registro | TIMESTAMP | Fecha de registro (auto) |
| fecha_actualizacion | TIMESTAMP | Última actualización (auto) |

## Configuración

### 1. Base de Datos
Ejecuta el script SQL ubicado en `Scripts/crear_base_datos.sql` en MySQL Workbench o desde la terminal:

```bash
mysql -u root -p < Scripts/crear_base_datos.sql
```

### 2. Web.config
Verifica la configuración de conexión en `Web.config`:

```xml
<appSettings>
    <add key="servidor" value="localhost"/>
    <add key="puerto" value="3306"/>
    <add key="baseDatos" value="concesionaria"/>
    <add key="usuario" value="root"/>
    <add key="password" value="TU_CONTRASEÑA"/>
</appSettings>
```

**IMPORTANTE:** Cambia el valor de `password` por tu contraseña de MySQL.

## Funcionalidades

### ? Crear (Agregar Coche)
- Completa los campos: Placa, Marca, Modelo, Año y Tipo
- Haz clic en "Agregar Coche"
- El sistema registrará automáticamente la fecha de registro

### ? Leer (Consultar Coches)
- Al cargar la página se muestra automáticamente la lista de coches
- El GridView muestra todos los campos incluyendo fechas de registro y actualización

### ? Actualizar (Modificar Coche)
1. Haz clic en "Seleccionar" en el coche que deseas modificar
2. Los datos se cargarán en los campos del formulario
3. Modifica los campos necesarios
4. Haz clic en "Actualizar Coche"
5. El sistema actualizará automáticamente la fecha de actualización

### ? Eliminar (Borrar Coche)
1. Haz clic en "Eliminar" en el coche que deseas borrar
2. Confirma la acción en el mensaje de confirmación
3. El registro se eliminará de la base de datos

## Características de Seguridad

- ? **Consultas Parametrizadas**: Protección contra SQL Injection
- ? **Validación de Datos**: Los campos se validan antes de insertarse
- ? **Confirmación de Eliminación**: Mensaje de confirmación antes de eliminar
- ? **Manejo de Errores**: Mensajes informativos al usuario
- ? **Gestión de Recursos**: Uso de `using` statements para liberar conexiones

## Estructura del Proyecto

```
CRUD_web_from/
??? Tiendita.aspx              # Interfaz del usuario
??? Tiendita.aspx.cs           # Lógica de la página
??? Web.config                 # Configuración de la aplicación
??? Scripts/
    ??? crear_base_datos.sql   # Script de creación de BD

Modelo/
??? Conexion.cs                # Clase de conexión a MySQL
??? Producto.cs                # Clase Concesionaria con métodos CRUD
```

## Campos del Formulario

| Campo | Descripción | Ejemplo |
|-------|-------------|---------|
| Placa | Placa del vehículo (única) | ABC-1234 |
| Marca | Fabricante del vehículo | Toyota, Honda, Ford |
| Modelo | Modelo específico | Corolla, CR-V, F-150 |
| Año | Año de fabricación | 2023 |
| Tipo | Categoría del vehículo | Sedán, SUV, Pickup |

## Ejemplos de Tipos de Vehículos
- Sedán
- SUV
- Pickup
- Hatchback
- Coupé
- Convertible
- Minivan
- Camioneta

## Notas Importantes

1. **Placa Única**: El sistema no permite registrar dos coches con la misma placa
2. **Índices**: La tabla tiene índices en `marca` y `anio` para mejorar el rendimiento de búsquedas
3. **Timestamps Automáticos**: No es necesario ingresar manualmente las fechas
4. **Validación de Año**: El campo año debe ser numérico
5. **Diagnóstico**: La aplicación verifica automáticamente la conexión y existencia de tablas al conectarse

## Solución de Problemas

### Error: "Table 'concesionaria.coches' doesn't exist"
**Solución:** Ejecuta el script `Scripts/crear_base_datos.sql`

### Error: "Access denied for user..."
**Solución:** Verifica usuario y contraseña en `Web.config`

### Los datos no se cargan al seleccionar
**Solución:** Verifica que el GridView tenga `DataKeyNames="id"` en Tiendita.aspx

## Tecnologías Utilizadas
- ASP.NET Web Forms (.NET Framework 4.8)
- C# 7.3
- MySQL 8.0+
- Bootstrap (para estilos)
- MySql.Data (NuGet package)

## Autor
Sistema desarrollado para gestión de concesionaria de vehículos.
