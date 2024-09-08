
# Qlik Sense Connection Script

Este script de PowerShell se utiliza para conectarse a un servidor Qlik Sense, autenticar la sesión de usuario, recuperar el script de carga de una aplicación específica, y obtener información detallada sobre dimensiones y medidas de dicha aplicación.

## Requisitos

- PowerShell (v5.1 o superior).
- Bibliotecas de Qlik Sense .NET SDK:

  - `Newtonsoft.Json.dll`
  - `Qlik.Engine.dll`
  - `Qlik.Sense.JsonRpc.dll`
  - `Qlik.Sense.Client.dll`
- Acceso a un servidor Qlik Sense con permisos adecuados.

## Instalación

1. Clona este repositorio en tu máquina local:
    ```bash
    git clone https://github.com/tu-usuario/nombre-repositorio.git
    ```

2. Asegúrate de que las bibliotecas necesarias estén presentes en tu máquina. Actualiza las rutas en el script de acuerdo a donde hayas descargado estas bibliotecas.

3. Modifica las variables del script para adaptarlas a tu entorno:

   - `$SenseServerURL`: URL de tu servidor Qlik Sense.
   - `$AppID`: ID de la aplicación Qlik Sense a la que deseas conectarte.
   - `$dimensionId`: ID de la dimensión que deseas obtener.
   - `$MedidaId`: ID de la medida que deseas obtener.

## Uso

1. Ejecuta el script de PowerShell:
   ```powershell
   .\QlikSenseConnectionScript.ps1
   ```
   
2. Se te solicitarán tus credenciales de usuario para autenticación.

3. El script realizará la autenticación y recuperará el script de carga de la aplicación, junto con la información de dimensiones y medidas especificadas.

## Funcionalidades

- **Conectar al servidor Qlik Sense**: Autenticación utilizando credenciales de usuario.
- **Obtener el script de carga**: Recupera y muestra el script de carga de una aplicación específica.
- **Listar objetos de la aplicación**: Muestra todos los objetos presentes en la aplicación.
- **Obtener detalles de dimensiones y medidas**: Recupera información detallada de dimensiones y medidas específicas.

## Personalización

- Puedes personalizar el script modificando las variables como el ID de la aplicación, ID de dimensiones y medidas, y ajustando los parámetros de autenticación.

## Contribución

Si deseas contribuir a este proyecto, por favor sigue los siguientes pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -am 'Agrega nueva funcionalidad'`).
4. Sube tus cambios a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

## Contacto

Si tienes alguna pregunta o problema, no dudes en abrir un issue en el repositorio o contactarme directamente.
