object Form1: TForm1
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Rechenprogramm'
  ClientHeight = 136
  ClientWidth = 362
  Color = clSilver
  Constraints.MinHeight = 164
  Constraints.MinWidth = 368
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 135
    Top = 19
    Width = 43
    Height = 13
    Caption = '+  -   *  /'
  end
  object Label2: TLabel
    Left = 10
    Top = 2
    Width = 29
    Height = 13
    Caption = 'Zahl 1'
  end
  object Label3: TLabel
    Left = 185
    Top = 2
    Width = 29
    Height = 13
    Caption = 'Zahl 2'
  end
  object lbErgebnisText: TLabel
    Left = 5
    Top = 53
    Width = 45
    Height = 13
    Caption = 'Ergebnis:'
  end
  object lbErgebnisAnzeige: TLabel
    Left = 55
    Top = 48
    Width = 57
    Height = 19
    Caption = '-keins-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdZahl1: TEdit
    Left = 8
    Top = 15
    Width = 121
    Height = 21
    Color = clSkyBlue
    TabOrder = 0
    OnKeyPress = EdZahl1KeyPress
  end
  object EdZahl2: TEdit
    Left = 184
    Top = 15
    Width = 121
    Height = 21
    Color = clSkyBlue
    TabOrder = 1
    OnKeyPress = EdZahl2KeyPress
  end
  object btnplus: TButton
    Left = 0
    Top = 90
    Width = 80
    Height = 25
    Caption = 'Addieren'
    TabOrder = 2
    OnClick = btnplusClick
  end
  object btnmal: TButton
    Left = 89
    Top = 90
    Width = 80
    Height = 25
    Caption = 'Multiplizieren'
    TabOrder = 3
    OnClick = btnmalClick
  end
  object btnminus: TButton
    Left = 175
    Top = 90
    Width = 80
    Height = 25
    Caption = 'Subtrahieren'
    TabOrder = 4
    OnClick = btnminusClick
  end
  object btndurch: TButton
    Left = 261
    Top = 90
    Width = 80
    Height = 25
    Caption = 'Dividieren'
    TabOrder = 5
    OnClick = btndurchClick
  end
  object BtnHelp: TButton
    Left = 329
    Top = 5
    Width = 25
    Height = 25
    Caption = '?'
    TabOrder = 6
    OnClick = BtnHelpClick
  end
end
