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

# Sección opcional para MariaDB - AHORA DESELECCIONADA POR DEFECTO
Section /o "Base de Datos MariaDB (Solo instalaciones nuevas)" SEC_MARIADB
    # Verificar si ya existe una instalación de MariaDB
    ReadRegStr $0 HKLM "SOFTWARE\MariaDB 10.11" "INSTALLDIR"
    ${If} $0 != ""
        MessageBox MB_YESNO|MB_ICONQUESTION "Se detectó MariaDB ya instalado en el sistema. ¿Desea continuar? Esto podría causar conflictos." IDYES continue_mariadb IDNO skip_mariadb
        skip_mariadb:
            DetailPrint "Instalación de MariaDB omitida - ya existe una instalación"
            Goto end_mariadb
        continue_mariadb:
    ${EndIf}
    
    DetailPrint "Instalando MariaDB silenciosamente..."
    SetOutPath $TEMP
    File "mariadb_installer.msi"
    
    # Instalar MariaDB
    DetailPrint "Ejecutando instalador de MariaDB..."
    ExecWait 'msiexec /i "$TEMP\mariadb_installer.msi" DATADIR="$INSTDIR\BaseDatos\mariadb\data" PORT=3310 PASSWORD=Zamora2023 SERVICENAME=MariaDBFzam ADDLOCAL=ALL REMOVE=HeidiSQL /qn' $1
    
    ${If} $1 == 0
        DetailPrint "MariaDB instalado correctamente"
        # Marcar que MariaDB fue instalado por nuestro programa
        WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalled" "1"
        WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalledBy" "Subocasoft"
    ${Else}
        DetailPrint "Error en la instalación de MariaDB (código: $1)"
        MessageBox MB_OK|MB_ICONEXCLAMATION "Hubo un error al instalar MariaDB. La aplicación funcionará pero necesitará configurar la base de datos manualmente."
        WriteRegStr HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalled" "0"
    ${EndIf}
    
    # Limpiar archivo temporal
    Delete "$TEMP\mariadb_installer.msi"
    
    end_mariadb:
SectionEnd

# Descripciones de las secciones en español
LangString DESC_MAIN ${LANG_SPANISH} "Instala los archivos principales del sistema de facturación (obligatorio)"
LangString DESC_MARIADB ${LANG_SPANISH} "Instala el servidor de base de datos MariaDB. Recomendado SOLO para instalaciones nuevas. NO seleccionar en actualizaciones para preservar datos existentes."

# Función para mostrar descripciones y validar selecciones
Function .onSelChange
    # Verificar si es una actualización
    ReadRegStr $0 HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayVersion"
    ${If} $0 != ""
        # Es una actualización
        ${If} ${SectionIsSelected} ${SEC_MARIADB}
            MessageBox MB_YESNO|MB_ICONQUESTION "ADVERTENCIA: Se detectó una versión anterior de ${APPNAME}.$\n$\n¿Está seguro de que desea reinstalar MariaDB?$\nEsto podría sobrescribir su base de datos existente.$\n$\n¿Continuar?" IDYES keep_mariadb_selected
            # Deseleccionar MariaDB si el usuario dice que no
            SectionSetFlags ${SEC_MARIADB} 0
            keep_mariadb_selected:
        ${EndIf}
    ${EndIf}
FunctionEnd

# Función de inicialización - CAMBIO PRINCIPAL AQUÍ
Function .onInit
    # Verificar si ya existe una instalación
    ReadRegStr $0 HKLM "${REGPATH_UNINSTSUBKEY}" "DisplayVersion"
    ${If} $0 != ""
        # Es una actualización
        MessageBox MB_ICONINFORMATION "Se detectó ${APPNAME} v$0 instalado.$\n$\nEsta instalación actualizará a la versión ${VERSION}.$\n$\nPor defecto, MariaDB NO será reinstalado para preservar sus datos."
        # Mantener MariaDB deseleccionado para actualizaciones
        SectionSetFlags ${SEC_MAIN} ${SF_SELECTED}|${SF_RO}
        SectionSetFlags ${SEC_MARIADB} 0  # Deseleccionado
    ${Else}
        # Primera instalación
        MessageBox MB_ICONINFORMATION "Bienvenido a la instalación de ${APPNAME} v${VERSION}.$\n$\nPuede seleccionar instalar MariaDB si es una instalación nueva.$\nSi ya tiene una base de datos configurada, déjelo deseleccionado."
        # En instalaciones nuevas, también dejar MariaDB deseleccionado por defecto
        SectionSetFlags ${SEC_MAIN} ${SF_SELECTED}|${SF_RO}
        SectionSetFlags ${SEC_MARIADB} 0  # Deseleccionado por defecto
    ${EndIf}
FunctionEnd

# Sección de desinstalación
Section "Uninstall"
    # Eliminar archivos instalados
    Delete "$INSTDIR\Facturacion.exe"
    Delete "$INSTDIR\Facturacion.ini" 
    Delete "$INSTDIR\Facturacion_Icon1.ico"
    Delete "$DESKTOP\${APPNAME}.lnk"

    # Verificar si MariaDB fue instalado POR NUESTRO PROGRAMA
    ReadRegStr $0 HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalled"
    ReadRegStr $1 HKLM "${REGPATH_UNINSTSUBKEY}" "MariaDBInstalledBy"
    
    ${If} $0 == "1"
    ${AndIf} $1 == "Subocasoft"
        MessageBox MB_YESNO|MB_ICONQUESTION "¿Desea desinstalar también MariaDB?$\n$\nADVERTENCIA: Se perderán TODOS los datos de la base de datos." IDYES remove_mariadb IDNO keep_mariadb
        remove_mariadb:
            DetailPrint "Desinstalando MariaDB..."
            # Detener y eliminar el servicio
            ExecWait 'sc stop "MariaDBFzam"'
            ExecWait 'sc delete "MariaDBFzam"'
            # Intentar desinstalar MariaDB usando msiexec
            ReadRegStr $2 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{MariaDB}" "UninstallString"
            ${If} $2 != ""
                ExecWait '$2 /qn'
            ${EndIf}
            DetailPrint "MariaDB desinstalado"
            Goto continue_uninstall
        keep_mariadb:
            DetailPrint "MariaDB conservado en el sistema"
        continue_uninstall:
    ${EndIf}

    # Eliminar entradas del registro
    DeleteRegKey HKLM "${REGPATH_UNINSTSUBKEY}"

    # Eliminar desinstalador y directorio
    Delete "$INSTDIR\uninstaller.exe"
    RMDir /r "$INSTDIR"
SectionEnd