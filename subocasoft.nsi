#Install a file and create an uninstaller to remove it
!include "Sections.nsh"

!define APPNAME "Subocasoft"
!define VERSION "1.0"
!define REGPATH_UNINSTSUBKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"

# Configuración básica
Name "${APPNAME}"
RequestExecutionLevel admin
BrandingText "Subocasoft © 2025"
InstallDir "$PROGRAMFILES\${APPNAME}"
InstallDirRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" UninstallString

# define installer name (SOLO UNA LÍNEA OutFile)
OutFile "SubocastoftInstaller.exe"

# Configurar idioma español
LoadLanguageFile "${NSISDIR}\Contrib\Language files\Spanish.nlf"

# Textos personalizados en español
ComponentText "Seleccione los componentes que desea instalar y desmarque los componentes que no desea instalar. Haga clic en Siguiente para continuar." "" "Seleccione los componentes a instalar:"
DirText "El programa se va a instalar en la siguiente carpeta. Para instalar en una carpeta diferente, haga clic en Examinar y seleccione otra carpeta. Haga clic en Siguiente para continuar." "Carpeta de destino" "Examinar" "Seleccione la carpeta en la que desea instalar ${APPNAME}:"

# Personalizar textos de botones y mensajes
SpaceTexts "Espacio requerido: " "Espacio disponible: "
CompletedText "Completado"
UninstallText "Este programa se va a desinstalar ${APPNAME}. Haga clic en Desinstalar para continuar."

# Páginas del instalador
Page components
Page directory
Page instfiles

# Páginas del desinstalador  
UninstPage uninstConfirm
UninstPage instfiles

# Sección principal - OBLIGATORIA
Section "Facturacion (requerido)" SEC_MAIN
    SectionIn RO  # Read Only - no se puede desmarcar
    
    # define output path
    SetOutPath $INSTDIR
     
    # specify file to go in output path
    File "Facturacion.exe"
    File "Facturacion.ini"
    File "Facturacion_Icon1.ico"

    # Crear acceso directo
    CreateShortCut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\Facturacion.exe" "" "$INSTDIR\Facturacion_Icon1.ico"

    # Registro para desinstalador
    WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayName" "${APPNAME}"
    WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayVersion" "${VERSION}"
    WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "Publisher" "Facturacion"
    WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "UninstallString" '"$INSTDIR\uninstaller.exe"'
    WriteRegDWORD HKLM "${REGPATH_UNINSTSUBKEY}" "NoModify" 1
    WriteRegDWORD HKLM "${REGPATH_UNINSTSUBKEY}" "NoRepair" 1

    # Crear desinstalador
    WriteUninstaller "$INSTDIR\uninstaller.exe"
SectionEnd

# Sección opcional para MariaDB
Section "Base de Datos MariaDB (Recomendado)" SEC_MARIADB
    DetailPrint "Instalando MariaDB silenciosamente..."
    SetOutPath $TEMP
    File "mariadb_installer.msi"
    
    # Instalar MariaDB
    ExecWait 'msiexec /i "$TEMP\mariadb_installer.msi" DATADIR="$INSTDIR\BaseDatos\mariadb\data" PORT=3310 PASSWORD=Zamora2023 SERVICENAME=MariaDBFzam ADDLOCAL=ALL REMOVE=HeidiSQL /qn'
    
    # Marcar que MariaDB fue instalado
    WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalled" "1"
    
    # Limpiar archivo temporal
    Delete "$TEMP\mariadb_installer.msi"
SectionEnd

# Descripciones de las secciones en español
LangString DESC_MAIN ${LANG_SPANISH} "Instala los archivos principales del sistema de facturación (obligatorio)"
LangString DESC_MARIADB ${LANG_SPANISH} "Instala el servidor de base de datos MariaDB. Se recomienda para el funcionamiento completo de la aplicación."

# Función para mostrar descripciones
Function .onSelChange
    !insertmacro StartRadioButtons $1
        !insertmacro RadioButton ${SEC_MAIN}
        !insertmacro RadioButton ${SEC_MARIADB}
    !insertmacro EndRadioButtons
FunctionEnd

# Función de inicialización
Function .onInit
    # Seleccionar por defecto ambas secciones
    IntOp $0 ${SF_SELECTED} | ${SF_RO}
    SectionSetFlags ${SEC_MAIN} $0
    SectionSetFlags ${SEC_MARIADB} ${SF_SELECTED}
    
    # Establecer descripciones
    StrCpy $1 "Instala los archivos principales del sistema de facturación (obligatorio)"
    StrCpy $2 "Instala el servidor de base de datos MariaDB. Se recomienda para el funcionamiento completo de la aplicación."
FunctionEnd

# Sección de desinstalación
Section "Uninstall"
    # Eliminar archivos instalados
    Delete "$INSTDIR\Facturacion.exe"
    Delete "$INSTDIR\Facturacion.ini" 
    Delete "$INSTDIR\Facturacion_Icon1.ico"
    Delete "$DESKTOP\${APPNAME}.lnk"

    # Verificar si MariaDB fue instalado
    ReadRegStr $0 HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalled"
    StrCmp $0 "1" 0 +4
        DetailPrint "Desinstalando MariaDB..."
        # Usar el desinstalador de MariaDB
        ExecWait 'sc stop "MariaDBFzam"'
        ExecWait 'sc delete "MariaDBFzam"'

    # Eliminar entradas del registro
    DeleteRegKey HKLM "${REGPATH_UNINSTSUBKEY}"

    # Eliminar desinstalador y directorio
    Delete "$INSTDIR\uninstaller.exe"
    RMDir /r "$INSTDIR"
SectionEnd