object frmMtoVisorFoto: TfrmMtoVisorFoto
  Left = 0
  Top = 0
  Caption = 'Visor de Imagen'
  ClientHeight = 580
  ClientWidth = 747
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 747
    Height = 415
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 0
    ExplicitHeight = 408
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
  object pnlCarrusel: TPanel
    Left = 0
    Top = 456
    Width = 747
    Height = 124
    Align = alBottom
    TabOrder = 1
    object ScrollBoxMiniaturas: TScrollBox
      Left = 1
      Top = 1
      Width = 745
      Height = 122
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      ExplicitTop = 6
      ExplicitHeight = 89
    end
  end
  object pnlZoom: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 41
    Align = alTop
    TabOrder = 2
    object lblZoom: TLabel
      Left = 236
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
      Width = 49
      Height = 25
      Caption = '100%'
      OnClick = btnZoom100Click
    end
    object btnAnterior: TSpeedButton
      Left = 344
      Top = 8
      Width = 105
      Height = 25
      Caption = '<- Anterior'
      OnClick = btnAnteriorClick
    end
    object btnSiguiente: TSpeedButton
      Left = 455
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Siguiente ->'
      OnClick = btnSiguienteClick
    end
    object btnPrimera: TSpeedButton
      Left = 304
      Top = 8
      Width = 34
      Height = 25
      Caption = '|<-'
      OnClick = btnPrimeraClick
    end
    object btnUltima: TSpeedButton
      Left = 569
      Top = 8
      Width = 34
      Height = 25
      Caption = '->|'
      OnClick = btnUltimaClick
    end
    object Rotar90dcha: TSpeedButton
      Left = 641
      Top = 8
      Width = 88
      Height = 25
      Caption = 'Rotar 90'#186' Dcha'
      OnClick = Rotar90dchaClick
    end
    object btnAjustar: TSpeedButton
      Left = 181
      Top = 8
      Width = 44
      Height = 25
      Caption = 'Ajustar'
      OnClick = btnAjustarClick
    end
  end
end
