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
