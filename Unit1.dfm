object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Casino - Kontostand: 0'
  ClientHeight = 211
  ClientWidth = 494
  Color = clBtnFace
  Constraints.MaxHeight = 250
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 250
  Constraints.MinWidth = 510
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    494
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 33
    Caption = 'Kontostand:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LKontostand: TLabel
    Left = 159
    Top = 8
    Width = 15
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 223
    Top = 64
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label2: TLabel
    Left = 191
    Top = 113
    Width = 42
    Height = 13
    Caption = 'Interval:'
  end
  object LMessage: TLabel
    Left = 0
    Top = 192
    Width = 494
    Height = 19
    Align = alBottom
    Alignment = taCenter
    Caption = '-'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    WordWrap = True
    ExplicitWidth = 6
  end
  object Label4: TLabel
    Left = 178
    Top = 140
    Width = 93
    Height = 13
    Caption = 'Gewinnchance: 1 in'
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 61
    Width = 121
    Height = 21
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'Roulette spielen:'
    TabOrder = 0
    OnEnter = LabeledEdit1Enter
    OnExit = LabeledEdit1Exit
  end
  object Button1: TButton
    Left = 239
    Top = 60
    Width = 75
    Height = 23
    Caption = 'Arbeiten'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 135
    Top = 60
    Width = 75
    Height = 23
    Caption = 'Wetten'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 88
    Width = 233
    Height = 17
    Caption = 'DoubleTactic verwenden mit Standard-Wert:'
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 239
    Top = 86
    Width = 75
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    Text = '5'
    OnChange = Edit1Change
    OnClick = Edit1Click
  end
  object Edit2: TEdit
    Left = 239
    Top = 111
    Width = 75
    Height = 21
    NumbersOnly = True
    TabOrder = 5
    Text = '300'
    OnChange = Edit2Change
    OnClick = Edit2Click
  end
  object Edit3: TEdit
    Left = 277
    Top = 137
    Width = 36
    Height = 21
    NumbersOnly = True
    TabOrder = 6
    Text = '2'
    OnChange = Edit3Change
    OnClick = Edit3Click
  end
  object Edit4: TEdit
    Left = 109
    Top = 164
    Width = 123
    Height = 21
    NumbersOnly = True
    TabOrder = 7
    OnChange = Edit3Change
    OnClick = Edit3Click
    OnEnter = Edit4Enter
    OnExit = Edit4Exit
  end
  object Button3: TButton
    Left = 238
    Top = 164
    Width = 75
    Height = 21
    Caption = 'KS setzen'
    TabOrder = 8
    OnClick = Button3Click
  end
  object StringGrid1: TStringGrid
    Left = 320
    Top = 8
    Width = 166
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 2
    FixedCols = 0
    RowCount = 6
    FixedRows = 0
    TabOrder = 9
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 8
    Top = 112
  end
end
