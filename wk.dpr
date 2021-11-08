program wk;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Pedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPedidos, Pedidos);
  Application.Run;
end.
