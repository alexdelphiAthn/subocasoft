object frmMtoVisorFoto: TfrmMtoVisorFoto
  Left = 0
  Top = 0
  Caption = 'Visor de Imagen'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 41
    Width = 800
    Height = 559
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 796
    ExplicitHeight = 558
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
  object pnlZoom: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 796
    object lblZoom: TLabel
      Left = 200
      Top = 14
      Width = 62
      Height = 13
      Caption = 'Zoom: 100%'
    end
    object btnZoomIn: TSpeedButton
      Left = 16
      Top = 8
      Width = 50
      Height = 25
      Caption = 'Zoom +'
      OnClick = btnZoomInClick
    end
    object btnZoomOut: TSpeedButton
      Left = 72
      Top = 8
      Width = 50
      Height = 25
      Caption = 'Zoom -'
      OnClick = btnZoomOutClick
    end
    object btnZoom100: TSpeedButton
      Left = 128
      Top = 8
      Width = 60
      Height = 25
      Caption = '100%'
      OnClick = btnZoom100Click
    end
  end
end
