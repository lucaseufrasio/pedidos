unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCurrencyEdit, cxDBEdit, cxSpinEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TPedidos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnInserirProduto: TBitBtn;
    BtnCancelarProduto: TBitBtn;
    fdConexao: TFDConnection;
    fdPedidos: TFDQuery;
    dtspedidos: TDataSource;
    cdsPedidos: TClientDataSet;
    prvPedidos: TDataSetProvider;
    FDItens: TFDQuery;
    prvitens: TDataSetProvider;
    cdsitens: TClientDataSet;
    dtsItens: TDataSource;
    cdsitenspedidos_codigo: TStringField;
    cdsitensprodutos_codigo: TIntegerField;
    cdsitensdescricao: TStringField;
    cdsitensquantidade: TBCDField;
    cdsitenspreco: TBCDField;
    cdsitenstotal: TBCDField;
    BitBtn3: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    dbeCodCli: TDBEdit;
    btnGravaPedido: TBitBtn;
    btnCancelaPedido: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    cdsPedidosid: TAutoIncField;
    cdsPedidoscodigo: TStringField;
    cdsPedidosdata: TDateField;
    cdsPedidosclientes_codigo: TIntegerField;
    cdsPedidoscliente: TStringField;
    cdsPedidostotal: TBCDField;
    FDSql: TFDQuery;
    btnExcluiPedido: TBitBtn;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    FDUpdPedido: TFDUpdateSQL;
    cdsitenscalc: TAggregateField;
    dbeCodProduto: TDBEdit;
    dbeDescricao: TDBEdit;
    dbePreco: TDBEdit;
    dbeQtde: TDBEdit;
    btnAdcionar: TBitBtn;
    edtCli: TEdit;
    Panel7: TPanel;
    edtcodigo: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cdsPedidosAfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure cdsPedidosAfterInsert(DataSet: TDataSet);
    procedure btnCancelaPedidoClick(Sender: TObject);
    procedure btnInserirProdutoClick(Sender: TObject);
    procedure BtnCancelarProdutoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeCodCliExit(Sender: TObject);
    procedure btnGravaPedidoClick(Sender: TObject);
    procedure dtspedidosDataChange(Sender: TObject; Field: TField);
    function CalculaNovoId(Tabela: string): integer;
    procedure dbeCodProdutoExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdcionarClick(Sender: TObject);
    procedure dbeQtdeExit(Sender: TObject);
    procedure dtsItensDataChange(Sender: TObject; Field: TField);
    procedure edtcodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pedidos: TPedidos;

implementation

{$R *.dfm}

procedure TPedidos.btnGravaPedidoClick(Sender: TObject);
begin
  try
    cdsPedidostotal.AsFloat := StrToFloat(cdsitenscalc.AsString);
    cdsPedidos.Post;
    cdsPedidos.ApplyUpdates(0);

    cdsitens.ApplyUpdates(0);
  except
     on e:exception do
      begin
         Application.MessageBox(pchar('Erro ao Gravar o Pedido.'+e.Message),'Atenção',MB_OK+MB_ICONINFORMATION );
         cdsPedidos.Edit;
         cdsitens.Edit;
      end;
  end;
end;

procedure TPedidos.btnInserirProdutoClick(Sender: TObject);
begin
  cdsPedidos.Edit;
  cdsitenspedidos_codigo.AsString  := cdsPedidoscodigo.AsString;
  cdsitenstotal.AsFloat            := cdsitensquantidade.AsFloat * cdsitenspreco.AsFloat;
  cdsitens.Post;

  dbePreco.Enabled := false;
  dbeQtde.Enabled := false;


  {try
    with FDSql do
    begin
      SQL.Text := 'insert into pedidos_produtos set '+
                  'pedidos_codigo =:pPedido,'+
                  'produtos_codigo =:pProduto,'+
                  'quantidade =:pQtde,preco =:pPreco,total=:pTot';
      ExecSQL;
    end;
    cdsitens.Post;
  except
    cdsitens.Cancel;
  end; }

end;

function TPedidos.CalculaNovoId(Tabela: string): integer;
var
  ZSQL: TFDQuery;
  vId: integer;
begin
  ZSQL := TFDQuery.Create(nil);
  try
    with ZSQL do
    begin
      Connection := fdConexao;
      Close;
      SQL.Text := 'select (max(id) + 1) as id from ' + Tabela;
      open;
      vId := ZSQL.FieldByName('id').AsInteger;
      if vId < 1 then
        vId := 1;
    end;
    Result := vId;
  finally
    // dmConexao.ZConnection.Connected := False;
    ZSQL.Free;
  end;
end;

procedure TPedidos.btnAdcionarClick(Sender: TObject);
begin
  cdsitens.Insert;
  dbeCodProduto.SetFocus;
  dbePreco.Enabled := true;
  dbeQtde.Enabled := true;
end;

procedure TPedidos.BitBtn3Click(Sender: TObject);
begin
  cdsPedidos.Insert;
  cdsPedidosid.AsInteger := CalculaNovoId('pedidos');
end;

procedure TPedidos.btnCancelaPedidoClick(Sender: TObject);
begin
  cdsPedidos.Cancel;
end;

procedure TPedidos.BtnCancelarProdutoClick(Sender: TObject);
begin
  cdsitens.Cancel;
  dbePreco.Enabled := false;
  dbeQtde.Enabled := false;
end;

procedure TPedidos.cdsPedidosAfterInsert(DataSet: TDataSet);
begin
  cdsPedidosId.AsInteger := 0;
  cdsPedidoscodigo.AsString := FormatDateTime('ddmmyy',Date)+FormatDateTime('hhmmss',Time);
end;

procedure TPedidos.cdsPedidosAfterScroll(DataSet: TDataSet);
begin
  cdsitens.Close;
  FDItens.ParamByName('pcodigo').AsString := cdsPedidoscodigo.AsString;
  cdsitens.Open;
  edtCli.Text := cdsPedidoscliente.AsString;
end;

procedure TPedidos.dbeCodCliExit(Sender: TObject);
begin
  if dbeCodCli.Text <> '' then
  begin

    with FDSql do
    begin
      SQL.Text := 'select codigo,nome from clientes where codigo =:pcod';
      ParamByName('pcod').AsString := dbeCodCli.Text;
      try
        open;
        if IsEmpty then
        begin
          ShowMessage('Cliente não encontrado');
          dbeCodCli.Text := '';
          dbeCodCli.SetFocus;
        end else
          edtCli.Text := FieldByName('nome').AsString;
      except
        on e:exception do
         Application.MessageBox(pchar('Erro ao buscar o cliente.'+e.Message),'Atenção',MB_OK+MB_ICONINFORMATION );
      end;
    end;

  end;
end;

procedure TPedidos.dbeCodProdutoExit(Sender: TObject);
begin
  if dbeCodProduto.Text <> '' then
  begin

    with FDSql do
    begin
      SQL.Text := 'select codigo,descricao,preco from produtos where codigo =:pcod';
      ParamByName('pcod').AsString := dbeCodProduto.Text;
      try
        open;
        if IsEmpty then
        begin
          ShowMessage('Produto não encontrado');
          dbeCodProduto.Text := '';
          dbeCodProduto.SetFocus;
        end else
        begin
          cdsitensdescricao.AsString := FieldByName('descricao').AsString;
          cdsitenspreco.AsFloat := FieldByName('preco').AsFloat;
          dbePreco.SetFocus;
        end;
      except
        on e:exception do
         Application.MessageBox(pchar('Erro ao buscar o produto.'+e.Message),'Atenção',MB_OK+MB_ICONINFORMATION );
      end;
    end;

  end;
end;

procedure TPedidos.dbeQtdeExit(Sender: TObject);
begin
  if (dbeQtde.Text = '') and (cdsitens.State in [dsInsert]) then
  begin
    ShowMessage('Informe a quantidade');
    Abort;
  end;
end;

procedure TPedidos.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DELETE then
  begin
    if Application.MessageBox('Deseja excluir o item ?','Atenção',MB_ICONQUESTION+MB_YESNO)=ID_YES then
    begin
      try
        cdsitens.Delete;
        cdsitens.ApplyUpdates(0);
        cdsPedidos.Edit;
      except
        on e:exception do
         Application.MessageBox(pchar('Erro ao excluir o produto.'+e.Message),'Atenção',MB_OK+MB_ICONINFORMATION );
      end;
    end;

  end;

  if key = VK_RETURN then
  begin
    if Application.MessageBox('Deseja alterar o item ?','Atenção',MB_ICONQUESTION+MB_YESNO)=ID_YES then
    begin
        cdsitens.edit;
        dbePreco.Enabled := true;
        dbeQtde.Enabled := True;
        dbePreco.SetFocus;
    end;
  end;
end;

procedure TPedidos.dtsItensDataChange(Sender: TObject; Field: TField);
begin
  btnInserirProduto.Enabled := cdsitens.State in [dsInsert,dsEdit];
  BtnCancelarProduto.Enabled := cdsitens.State in [dsInsert,dsEdit];
  btnAdcionar.Enabled := cdsitens.State in [dsBrowse];
end;

procedure TPedidos.dtspedidosDataChange(Sender: TObject; Field: TField);
begin
  btnGravaPedido.Enabled := cdsPedidos.State in [dsInsert,dsEdit];
  btnCancelaPedido.Enabled := cdsPedidos.State in [dsInsert,dsEdit];
  btnExcluiPedido.Enabled := (cdsPedidos.State in [dsBrowse,dsEdit]) and (cdsPedidosid.AsInteger > 0);
end;

procedure TPedidos.edtcodigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    cdsPedidos.Close;
    cdsPedidos.Filtered := False;
    cdsPedidos.Filter := 'cliente Like ' +UpperCase(QuotedStr('%' + edtcodigo.Text + '%'));
    cdsPedidos.Filtered := True;
    cdsPedidos.Open;
end;

procedure TPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
     Perform(Wm_NextDlgCtl,0,0);
end;

procedure TPedidos.FormShow(Sender: TObject);
begin
  cdsPedidos.Open;
end;

end.
