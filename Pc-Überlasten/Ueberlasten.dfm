object Form1: TForm1
  Left = 0
  Top = 0
  Cursor = crHourGlass
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 25
  ClientWidth = 219
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Button4: TButton
    Left = 72
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
  end
  object Button5: TButton
    Left = 0
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button5Click
  end
  object Button1: TButton
    Left = 144
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 2
    OnClick = Button1Click
  end
end
