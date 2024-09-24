unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.FMTBcd,
  Data.SqlExpr, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    BtnCadastrar: TButton;
    BtnAlterar: TButton;
    BtnGuardar: TButton;
    BtnCAncelar: TButton;
    BtnExluir: TButton;
    Conexao: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    QueryProdutos: TFDQuery;
    DsProdutos: TDataSource;
    DBGrid1: TDBGrid;
    ID: TLabel;
    EdtNome: TDBEdit;
    EdtId: TDBEdit;
    EdtPeso: TDBEdit;
    EdtMarca: TDBEdit;
    QueryProdutosid: TIntegerField;
    QueryProdutosnome: TWideStringField;
    QueryProdutosmarca: TWideStringField;
    QueryProdutospeso: TWideStringField;
    QueryProdutosdata: TDateField;
    DBEdit1: TDBEdit;
    EdtPesquisar: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGuardarClick(Sender: TObject);
    procedure BtnCAncelarClick(Sender: TObject);
    procedure BtnExluirClick(Sender: TObject);
    procedure EdtPesquisarChange(Sender: TObject);
    procedure EdtDataChange(Sender: TObject);
  private
  //AQUI SAO DECLARADAS APENAS AS CLASSES PRIVADAS QUE SERAO ACESSADOS NO PROPRIO METODO
    procedure InativarCampos;
    procedure AtivarCampos;

  public
    { Public declarations }
  end;

var
//VARIAVEL DA TELA PRINCIPAL
  FrmPrincipal: TFrmPrincipal;
  SwProduct: string;
  IsEditing: Boolean;

implementation

{$R *.dfm}

//AQUI É UM POUCO DE REGRA DE NEGOCIO DOS BOTOES, ATIVANDO E DESATIVANDO DE
//ACORDO O MOMENTO
procedure TFrmPrincipal.AtivarCampos;
begin
  EdtId.Enabled := False;
  EdtNome.Enabled := True;
  EdtPeso.Enabled := True;
  EdtMarca.Enabled := True;
  EdtPesquisar.Enabled := True;
end;

//AQUI FICA A CONFIGURAÇÃO DO BOTAO ALTERAR
procedure TFrmPrincipal.BtnAlterarClick(Sender: TObject);
begin
  QueryProdutos.Edit;
  AtivarCampos;
  IsEditing := True;
  EdtNome.SetFocus;
end;

//AQUI FICA A CONFIGURAÇÃO DO BOTAO CADASTRAR
procedure TFrmPrincipal.BtnCadastrarClick(Sender: TObject);
begin
  QueryProdutos.Insert;
  AtivarCampos;
  IsEditing := False;
  EdtNome.SetFocus;
end;
//AQUI FICA A CONFIGURAÇÃO DO BOTAO CANCELAR
procedure TFrmPrincipal.BtnCAncelarClick(Sender: TObject);
begin
  QueryProdutos.Cancel;
  AtivarCampos;
end;

//AQUI FICA A CONFIGURAÇÃO DO BOTAO EXCLUIR
procedure TFrmPrincipal.BtnExluirClick(Sender: TObject);
begin
  if QueryProdutos.IsEmpty then
    begin
      ShowMessage('Nenhum produto selecionado para exclusão!');
      Exit;
    end;

    SwProduct := QueryProdutos.FieldByName('nome').AsString;

    if (Application.MessageBox(PChar('Deseja realmente excluir o produto "' + SwProduct + '"?'),'Confirmacao',MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
      Begin
        QueryProdutos.Delete;
        ShowMessage('Produto "' + SwProduct + '" excluído com sucesso!');
    End;
end;

//AQUI FICA A CONFIGURAÇÃO DO BOTAO SALVAR COM REGRA DE NEGOCIO
procedure TFrmPrincipal.BtnGuardarClick(Sender: TObject);
begin

  if (EdtNome.Text = '') or (EdtPeso.Text = '') or (EdtMarca.Text = '') then
  begin
    ShowMessage('Preencha todos os campos antes de salvar!');
    Exit;
  end;

  QueryProdutos.FieldByName('data').AsDateTime := Now;

  if IsEditing then
  begin
    QueryProdutos.Post;
    ShowMessage('Produto alterado com sucesso!');
  end
  else
  begin
    QueryProdutos.Post;
    ShowMessage('Produto cadastrado com sucesso!');
  end;

  Conexao.Commit;
  QueryProdutos.Refresh;
  AtivarCampos;
end;

//AQUI PEGANDO A DATA ATUAL DA MAQUINA
procedure TFrmPrincipal.EdtDataChange(Sender: TObject);
begin
  QueryProdutos.Insert;
  QueryProdutos.FieldByName('data').AsDateTime := Now;  // Data e hora atuais
  EdtNome.SetFocus;
end;

//AQUI FICA A CONFIGURAÇÃO DE REALIZAÇÃO DA PESQUISA NO BANCO
procedure TFrmPrincipal.EdtPesquisarChange(Sender: TObject);
begin
  QueryProdutos.Close;
  QueryProdutos.SQL.Text := 'SELECT * FROM PRODUTOS WHERE UPPER (nome) LIKE UPPER(:nome)';
  QueryProdutos.ParamByName('nome').AsString := EdtPesquisar.Text + '%';
  QueryProdutos.Open;
end;

//AQUI FICA A CONFIGURAÇÃO DE CRIAR UM NOVO PRODUTO
procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Conexao.Connected := True;
  QueryProdutos.Open();
  InativarCampos;
end;

//AQUI FICA A CONFIGURAÇÃO DE DESATIVAÇÃO DE BOTOES
procedure TFrmPrincipal.InativarCampos;
begin
  EdtId.Enabled := False;
  EdtNome.Enabled := False;
  EdtPeso.Enabled := False;
  EdtMarca.Enabled := False;
end;

end.
