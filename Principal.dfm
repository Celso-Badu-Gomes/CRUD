object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Produtos'
  ClientHeight = 625
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object ID: TLabel
    Left = 8
    Top = 112
    Width = 21
    Height = 28
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 135
    Top = 111
    Width = 76
    Height = 28
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 544
    Top = 111
    Width = 43
    Height = 28
    Caption = 'Peso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 8
    Top = 200
    Width = 59
    Height = 28
    Caption = 'Marca'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 8
    Top = 312
    Width = 89
    Height = 28
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TLabel
    Left = 544
    Top = 200
    Width = 45
    Height = 28
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 105
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 724
    object BtnCadastrar: TButton
      Left = 8
      Top = 31
      Width = 97
      Height = 41
      Caption = 'CADASTRAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      StyleElements = [seClient, seBorder]
      OnClick = BtnCadastrarClick
    end
    object BtnAlterar: TButton
      Left = 111
      Top = 31
      Width = 97
      Height = 41
      Caption = 'ALTERAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      StyleElements = [seClient, seBorder]
      OnClick = BtnAlterarClick
    end
    object BtnGuardar: TButton
      Left = 232
      Top = 31
      Width = 97
      Height = 41
      Caption = 'GUARDAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnGuardarClick
    end
    object BtnCAncelar: TButton
      Left = 344
      Top = 31
      Width = 97
      Height = 41
      Caption = 'CANCELAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleElements = [seClient, seBorder]
      OnClick = BtnCAncelarClick
    end
    object BtnExluir: TButton
      Left = 456
      Top = 31
      Width = 97
      Height = 41
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      StyleElements = [seClient, seBorder]
      OnClick = BtnExluirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 392
    Width = 726
    Height = 233
    Align = alBottom
    DataSource = DsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object EdtId: TDBEdit
    Left = 8
    Top = 146
    Width = 70
    Height = 20
    DataField = 'id'
    DataSource = DsProdutos
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 12
    Font.Name = 'EdtId'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object EdtNome: TDBEdit
    Left = 135
    Top = 146
    Width = 346
    Height = 23
    CharCase = ecUpperCase
    DataField = 'nome'
    DataSource = DsProdutos
    TabOrder = 3
  end
  object EdtMarca: TDBEdit
    Left = 8
    Top = 234
    Width = 233
    Height = 23
    CharCase = ecUpperCase
    DataField = 'marca'
    DataSource = DsProdutos
    TabOrder = 4
  end
  object EdtPeso: TDBEdit
    Left = 544
    Top = 145
    Width = 89
    Height = 23
    DataField = 'peso'
    DataSource = DsProdutos
    TabOrder = 5
  end
  object EdtPesquisar: TEdit
    Left = 8
    Top = 354
    Width = 377
    Height = 23
    TabOrder = 6
    OnChange = EdtPesquisarChange
  end
  object DBEdit1: TDBEdit
    Left = 544
    Top = 234
    Width = 97
    Height = 23
    DataField = 'data'
    DataSource = DsProdutos
    Enabled = False
    TabOrder = 7
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=Produtos'
      'Password=123'
      'User_Name=postgres'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 248
    Top = 440
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\Users\Celso\Desktop\ArecoSistemas'
    Left = 48
    Top = 432
  end
  object QueryProdutos: TFDQuery
    Filtered = True
    Connection = Conexao
    SQL.Strings = (
      'select * from produtos')
    Left = 336
    Top = 448
    object QueryProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object QueryProdutosmarca: TWideStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object QueryProdutospeso: TWideStringField
      FieldName = 'peso'
      Origin = 'peso'
      Size = 50
    end
    object QueryProdutosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object DsProdutos: TDataSource
    DataSet = QueryProdutos
    Left = 152
    Top = 432
  end
end
