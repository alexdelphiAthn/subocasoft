object frmMtoVisorFoto: TfrmMtoVisorFoto
  Left = 0
  Top = 0
  Caption = 'Visor de Imagen'
  ClientHeight = 589
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 753
    Height = 411
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 105
      Height = 105
      Cursor = crHandPoint
      OnDblClick = Image1DblClick
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
  end
  object pnlNavigation: TPanel
    Left = 0
    Top = 452
    Width = 753
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAnterior: TSpeedButton
      Left = 127
      Top = 6
      Width = 75
      Height = 25
      Caption = '<- Anterior'
      OnClick = btnAnteriorClick
    end
    object btnSiguiente: TSpeedButton
      Left = 207
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Siguiente ->'
      OnClick = btnSiguienteClick
    end
    object btnPrimera: TSpeedButton
      Left = 46
      Top = 6
      Width = 75
      Height = 25
      Caption = '|<- Primera'
      OnClick = btnPrimeraClick
    end
    object btnUltima: TSpeedButton
      Left = 288
      Top = 6
      Width = 96
      Height = 25
      Caption = #218'ltima ->|'
      OnClick = btnUltimaClick
    end
  end
  object pnlCarrusel: TPanel
    Left = 0
    Top = 493
    Width = 753
    Height = 96
    Align = alBottom
    TabOrder = 2
    object ScrollBoxMiniaturas: TScrollBox
      Left = 1
      Top = 1
      Width = 751
      Height = 94
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
    end
  end
  object pnlZoom: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 41
    Align = alTop
    TabOrder = 3
    object lblZoom: TLabel
      Left = 200
      Top = 14
      Width = 62
      Height = 13
      Caption = 'Zoom: 100%'
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 8
      Width = 50
      Height = 25
      Caption = 'Zoom +'
      OnClick = btnZoomInClick
    end
    object SpeedButton2: TSpeedButton
      Left = 72
      Top = 8
      Width = 50
      Height = 25
      Caption = 'Zoom -'
      OnClick = btnZoomOutClick
    end
    object SpeedButton3: TSpeedButton
      Left = 128
      Top = 8
      Width = 60
      Height = 25
      Caption = '100%'
      OnClick = btnZoom100Click
    end
    object SpeedButton4: TSpeedButton
      Left = 344
      Top = 8
      Width = 105
      Height = 25
      Caption = '<- Anterior'
      OnClick = btnAnteriorClick
    end
    object SpeedButton5: TSpeedButton
      Left = 455
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Siguiente ->'
      OnClick = btnSiguienteClick
    end
  end
end
