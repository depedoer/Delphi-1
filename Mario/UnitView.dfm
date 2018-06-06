object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Mario'
  ClientHeight = 498
  ClientWidth = 615
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object allimg: TPaintBox
    Left = 320
    Top = 16
    Width = 105
    Height = 105
  end
  object Springen: TTimer
    Enabled = False
    Interval = 300
    OnTimer = SpringenTimer
    Left = 456
    Top = 24
  end
  object Hindernis: TTimer
    Enabled = False
    Interval = 500
    OnTimer = HindernisTimer
    Left = 488
    Top = 24
  end
  object Uhr: TTimer
    Enabled = False
    Interval = 10
    OnTimer = UhrTimer
    Left = 520
    Top = 24
  end
  object Allesweg: TTimer
    Enabled = False
    OnTimer = AlleswegTimer
    Left = 552
    Top = 24
  end
end
