object frmNotaLegal: TfrmNotaLegal
  Left = 506
  Top = 279
  HorzScrollBar.Visible = False
  BorderStyle = bsSingle
  Caption = 'Nota Legal'
  ClientHeight = 605
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  FormStyle = fsStayOnTop
  Scaled = False
  TextHeight = 23
  object pnl1: TPanel
    Left = 720
    Top = 0
    Width = 127
    Height = 605
    Align = alRight
    TabOrder = 0
    object btnSalir: TcxButton
      Left = 1
      Top = 547
      Width = 125
      Height = 57
      Align = alBottom
      Caption = 'Salir'
      TabOrder = 0
      OnClick = btnSalirClick
      ExplicitLeft = 64
      ExplicitWidth = 127
    end
  end
  object mse1: TSynEdit
    Left = 0
    Top = 0
    Width = 720
    Height = 605
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    TabOrder = 1
    UseCodeFolding = False
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Consolas'
    Gutter.Font.Style = []
    Gutter.Bands = <
      item
        Kind = gbkMarks
        Width = 13
      end
      item
        Kind = gbkLineNumbers
      end
      item
        Kind = gbkFold
      end
      item
        Kind = gbkTrackChanges
      end
      item
        Kind = gbkMargin
        Width = 3
      end>
    Lines.Strings = (
      ''
      '    1. Declaraci'#243'n de Conformidad'
      
        '    El software Subocasoft, desarrollado por Susana Bartolom'#233' Ca' +
        'labozo, cumple con todos los requisitos t'#233'cnicos y funcionales e' +
        'stablecidos en el Real Decreto 1007/2023, de 5 de diciembre, que' +
        ' regula los sistemas inform'#225'ticos de facturaci'#243'n en Espa'#241'a (Regl' +
        'amento Veri*factu).'
      ''
      
        '    Susana Bartolom'#233' Calabozo ha presentado la preceptiva Declar' +
        'aci'#243'n Responsable ante la Agencia Tributaria, garantizando que e' +
        'ste software se ajusta a la legalidad vigente. Se adjunta una co' +
        'pia de la declaraci'#243'n responsable que se ha presentado en la Age' +
        'ncia Tributaria.'
      #9#9#9
      #9#9'DECLARACI'#211'N RESPONSABLE DEL SISTEMA INFORM'#193'TICO DE FACTURACI'#211'N'
      ''
      
        #9#9'De conformidad con el Art'#237'culo 15 del HAC/1177/2024, de 17 de ' +
        'octubre, por la que se desarrollan las especificaciones t'#233'cnicas' +
        ', funcionales y de contenido referidas en el Reglamento que esta' +
        'blece los requisitos que deben adoptar los sistemas y programas ' +
        'inform'#225'ticos o electr'#243'nicos que soporten los procesos de factura' +
        'ci'#243'n de empresarios y profesionales, y la estandarizaci'#243'n de for' +
        'matos de los registros de facturaci'#243'n, aprobado'
      
        #9#9'por el Real Decreto 1007/2023, de 5 de diciembre; y en el Regl' +
        'amento por el que se regulan las obligaciones de facturaci'#243'n, ap' +
        'robado por Real Decreto 1619/2012, de 30 de noviembre.'
      #9#9'A - Nombre del sistema inform'#225'tico: Subocasoft'
      #9#9'B - C'#243'digo identificador del sistema inform'#225'tico: F1.'
      #9#9'C - Identificador completo de la versi'#243'n: 109'
      
        #9#9'D - Componentes, hardware y software, y principales funcionali' +
        'dades: Se trata de un software para la gesti'#243'n integral de la fa' +
        'cturaci'#243'n, instalado localmente (on-premise) en los equipos del ' +
        'usuario. La instalaci'#243'n se configura en red, con un equipo princ' +
        'ipal (Administraci'#243'n) y uno secundario (Gerencia). El sistema ga' +
        'rantiza la integridad, trazabilidad y conservaci'#243'n de las factur' +
        'as, no permitiendo su modificaci'#243'n post-'
      
        #9#9'registro, asegurando la secuencialidad num'#233'rica y cronol'#243'gica,' +
        ' y generando un c'#243'digo QR para la autenticaci'#243'n de cada factura.' +
        ' Gestiona facturas normales y simplificadas, estas '#250'ltimas con u' +
        'n l'#237'mite de 400'#8364'.'
      
        #9#9'E - Indicaci'#243'n de si el sistema inform'#225'tico funciona exclusiva' +
        'mente como '#171'VERI*FACTU'#187': S'#237', el sistema se ha producido para fun' +
        'cionar exclusivamente como '#171'SOLO VERI*FACTU'#187'.'
      
        #9#9'F - Indicaci'#243'n de si permite ser usado por varios obligados tr' +
        'ibutarios: No, el sistema est'#225' dise'#241'ado para dar soporte a la fa' +
        'cturaci'#243'n de un '#250'nico obligado tributario.'
      
        #9#9'G - Tipos de firma utilizados (si no es '#171'VERI*FACTU'#187'): No proc' +
        'ede. Se comporta como SOLO VERI*FACTU.'
      
        #9#9'H - Nombre y apellidos de la persona o raz'#243'n social de la enti' +
        'dad productora: Susana Bartolom'#233' Calabozo'
      #9#9'I - N'#250'mero de identificaci'#243'n fiscal (NIF): 11957478P'
      
        #9#9'J - Direcci'#243'n postal completa de contacto: Plaza Cristo Rey, 5' +
        ' - 5'#186'D, 49019 Zamora'
      
        #9#9'K - Declaraci'#243'n de cumplimiento normativo: Susana Bartolom'#233' Ca' +
        'labozo deja constancia de que dicho sistema inform'#225'tico, en la v' +
        'ersi'#243'n indicada, cumple con lo dispuesto en el art'#237'culo 29.2.j) ' +
        'de la Ley 58/2003, de 17 de diciembre, General Tributaria, en el' +
        ' Reglamento aprobado por el Real Decreto 1007/2023, de 5 de'
      #9#9'diciembre, y en la normativa de desarrollo aplicable.'
      
        #9#9'L - Fecha y lugar de suscripci'#243'n: En Zamora, Espa'#241'a, a 1 de Ju' +
        'lio del 2026.'
      #9#9'M - Componentes Funcionales (CF) de terceros:'
      
        #9#9#8226' Componente Funcional externo: Bold API Veri*factu, Versi'#243'n 1' +
        '.0.0'
      #9#9#8226' Productor del componente: BOLD SOFTWARE SL (NIF: B13674197)'
      
        #9#9#8226' Funcionalidad asumida: Generaci'#243'n y remisi'#243'n de los registro' +
        's de facturaci'#243'n a la AEAT.'
      
        #9#9#8226' Interacci'#243'n entre componentes: El software Subocasoft realiz' +
        'a llamadas a trav'#233's de una API en la nube a Bold API Veri*factu ' +
        'con los datos necesarios para la creaci'#243'n de los registros. Bold' +
        ' API Veri*factu genera dicho registro, devuelve inmediatamente e' +
        'l c'#243'digo QR a Subocasoft y procede a la remisi'#243'n del'
      
        #9#9'registro a la AEAT. La respuesta de la AEAT es ofrecida por Bo' +
        'ld API Veri*factu mediante webhooks o un endpoint espec'#237'fico.'
      #9#9#8226' Email de contacto: soporteapiverifactu@boldsoftware.es'
      ''
      '2. Funcionalidades Clave de Cumplimiento'
      ''
      
        '    Integridad e Inmutabilidad: "Los registros de facturaci'#243'n ge' +
        'nerados no pueden ser alterados ni eliminados, garantizando la i' +
        'ntegridad de los datos una vez guardados".'
      ''
      
        '    Trazabilidad: "Cada factura est'#225' encadenada con la anterior ' +
        'mediante un sistema de firma electr'#243'nica (hash encadenado), crea' +
        'ndo un registro cronol'#243'gico y seguro".'
      ''
      
        '    Registro de Eventos: "El sistema registra autom'#225'ticamente to' +
        'dos los eventos relevantes (creaci'#243'n de facturas, anulaci'#243'n de f' +
        'acturas rectificativas, etc.) en un fichero de eventos no modifi' +
        'cable, tal como exige la normativa".'
      ''
      
        '    Firma Electr'#243'nica: "Todos los registros de facturaci'#243'n est'#225'n' +
        ' firmados electr'#243'nicamente en el sistema de Bold API para garant' +
        'izar su autenticidad e integridad".'
      ''
      
        '    C'#243'digo QR: "Cada factura expedida incluye un c'#243'digo QR que c' +
        'ontiene la informaci'#243'n esencial para su verificaci'#243'n, facilitand' +
        'o su digitalizaci'#243'n y comprobaci'#243'n por parte de los destinatario' +
        's y de la AEAT".'
      ''
      '3. Responsabilidades del Usuario'
      ''
      
        '    Correcta Introducci'#243'n de Datos: "El usuario es el '#250'nico resp' +
        'onsable de la veracidad y exactitud de los datos introducidos en' +
        ' el sistema (datos del cliente, conceptos, importes, impuestos a' +
        'plicables, etc.)".'
      ''
      
        '    Uso Adecuado del Sistema: "El usuario se compromete a no int' +
        'entar alterar, manipular o da'#241'ar los registros de facturaci'#243'n o ' +
        'el registro de eventos del software".'
      #9
      
        '    Obligaciones Fiscales: "Este software es una herramienta par' +
        'a cumplir con los requisitos t'#233'cnicos de facturaci'#243'n. El usuario' +
        ' sigue siendo el responsable '#250'ltimo de cumplir con todas sus obl' +
        'igaciones fiscales, contables y de facturaci'#243'n, incluyendo la pr' +
        'esentaci'#243'n de impuestos y la correcta aplicaci'#243'n de la normativa' +
        ' tributaria".'
      ''
      
        '    Conservaci'#243'n de Datos: "El usuario es responsable de realiza' +
        'r y custodiar las copias de seguridad de sus datos de facturaci'#243 +
        'n".'
      ''
      '4. Protecci'#243'n de Datos (RGPD y LOPDGDD)'
      ''
      
        '    Dado que el software manejar'#225' datos personales de los client' +
        'es del usuario, es obligatorio hacer referencia a la normativa d' +
        'e protecci'#243'n de datos.'
      ''
      
        '    Es obligaci'#243'n del usuario cumplir con el Reglamento General ' +
        'de Protecci'#243'n de Datos (UE) 2016/679 y la Ley Org'#225'nica 3/2018 de' +
        ' Protecci'#243'n de Datos Personales.'
      ''
      
        '    El usuario, como "Responsable del Tratamiento", es quien deb' +
        'e garantizar la legalidad de la recogida y tratamiento de los da' +
        'tos de sus clientes.'
      '')
    Options = [eoAutoIndent, eoDisableScrollArrows, eoDragDropEditing, eoDropFiles, eoEnhanceHomeKey, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoKeepCaretX, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabIndent, eoTabsToSpaces, eoShowLigatures]
    ReadOnly = True
    RightEdgeColor = clWhite
    SelectedColor.Alpha = 0.400000005960464500
    WordWrap = True
  end
end
