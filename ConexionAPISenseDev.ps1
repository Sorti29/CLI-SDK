# Este script se utiliza para establecer una conexión con un servidor Qlik Sense, autenticar la sesión,
# recuperar el script de carga de una aplicación específica, y obtener información sobre dimensiones y medidas.

# 1. Importar las bibliotecas necesarias
# Asegúrate de actualizar estas rutas con las ubicaciones correctas de las bibliotecas descargadas
add-type -path "C:\Users\usuario\Desktop\Conection\newtonsoft.json.6.0.1\lib\net45\Newtonsoft.Json.dll"
add-type -path "C:\Users\usuario\Desktop\Conection\qliksense.netsdk\lib\net452\Qlik.Engine.dll"
add-type -path "C:\Users\usuario\Desktop\Conection\qliksense.netsdk\lib\net452\Qlik.Sense.JsonRpc.dll"
add-type -path "C:\Users\usuario\Desktop\Conection\qliksense.netsdk\lib\net452\Qlik.Sense.Client.dll"

# 2. Configurar la URL del servidor
# Define la variable con la URL de tu servidor Qlik Sense
$SenseServerURL = "https://servidor.dominio.com"
# Solicita las credenciales del usuario para autenticación
$QlikCredentials = Get-Credential
# Configurar si el proxy utiliza SSL
$ProxyUsesSSL = $true
# Configurar para confiar en todos los certificados (no recomendado en entornos de producción)
$TrustAllCerts = $true

# 3. Crear el objeto de ubicación del servidor
# Este objeto representa la ubicación del servidor Qlik Sense
$Location = [Qlik.Engine.Location]::FromUri($SenseServerURL)

# 4. Autenticar la sesión
# Intenta autenticarse en el servidor utilizando las credenciales proporcionadas
try {
    [Qlik.Engine.LocationExtensions]::AsNtlmUserViaProxy($Location, $ProxyUsesSSL, $QlikCredentials, $TrustAllCerts)
    Write-Output "Autenticación exitosa."
} catch {
    Write-Error "Error durante la autenticación: $_"
    exit
}

# 5. Conectar a una aplicación específica
# Define el ID de la aplicación a la que se conectará
$AppID = "ID de la APP a Leer"
# Obtener la referencia de la aplicación a partir de su ID
$AppIdentifiersByID = [Qlik.Engine.LocationExtensions]::AppWithId($Location, $AppID)

$Session = $null
$NoData = $true
# Conectar a la aplicación específica
$QEApp = [Qlik.Engine.LocationExtensions]::App($Location, $AppIdentifiersByID, $Session, $NoData)

# Mostrar información de la aplicación
Write-Output $AppIdentifiersByID
Write-Output $QEApp

# 6. Obtener el script de carga de la aplicación
$AppScript = $QEApp.GetScript()
Write-Output "Script de carga de la aplicación:"
Write-Output $AppScript

# 7. Recuperar todos los objetos de la aplicación
$AllInfos = $QEApp.GetAllInfos()
Write-Output "Todos los objetos de la aplicación:"
$AllInfos | ForEach-Object { Write-Output $_ }

# 8. Obtener información de una dimensión específica
# Define el ID de la dimensión a recuperar
$dimensionId = "Id de la dimension"
# Obtener la dimensión genérica utilizando su ID
$dimension = $QEApp.GetGenericDimension($dimensionId)
# Obtener el nombre y los campos de la dimensión
$dimensionName = $dimension.Properties.MetaDef.Title
$dimensionFields = $dimension.Properties.Dim.FieldDefs

# Mostrar información de la dimensión
Write-Output "Nombre de la dimensión: $dimensionName"
Write-Output "Contenido de la dimensión:"
$dimensionFields | ForEach-Object { Write-Output $_ }

# 9. Obtener información de una medida específica
# Define el ID de la medida a recuperar
$MedidaId = "ID de la Medida"
# Obtener la medida genérica utilizando su ID
$Medida = $QEApp.GetGenericMeasure($MedidaId)
# Obtener el nombre y el contenido de la medida
$MedidaName = $Medida.Properties.MetaDef.Title
$MedidaFields = $Medida.Properties.Measure

# Mostrar información de la medida
Write-Output "Nombre de la medida: $MedidaName"
Write-Output "Contenido de la medida:"
$MedidaFields | ForEach-Object { Write-Output $_ }

# Opcional: Mostrar todos los métodos disponibles
# $QEApp | Get-Member

