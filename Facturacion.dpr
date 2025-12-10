program Facturacion;

uses
  Forms,
  Controls,
  MidasLib,
  inMtoGen in 'src\UI\Core\inMtoGen.pas' {frmMtoGen},
  inLibtb in 'src\Lib\Core\inLibtb.pas',
  inMtoPrincipal in 'src\UI\Core\inMtoPrincipal.pas' {frmMtoPrincipal},
  UniDataConn in 'src\Core\UniDataConn.pas' {dmConn: TDataModule},
  inLibDir in 'src\Lib\Core\inLibDir.pas',
  inLibWin in 'src\Lib\Core\inLibWin.pas',
  inLibDevExp in 'src\Lib\Core\inLibDevExp.pas',
  inLibData in 'src\Lib\Core\inLibData.pas',
  inMtoClientes in 'src\UI\Maintenance\inMtoClientes.pas' {frmMtoClientes},
  inMtoGenSearch in 'src\UI\Core\inMtoGenSearch.pas' {frmMtoSearch},
  inMtoFac in 'src\UI\Maintenance\inMtoFac.pas' {frmMtoFac},
  UniDataFac in 'src\Data\UniDataFac.pas' {dmFac: TDataModule},
  inMtoContadores in 'src\UI\Support\inMtoContadores.pas' {frmMtoContadores},
  Vcl.Themes,
  Vcl.Styles,
  dxCore,
  inMtoArticulos in 'src\UI\Maintenance\inMtoArticulos.pas' {frmMtoArticulos},
  UniDataArticulos in 'src\Data\UniDataArticulos.pas' {DMArticulos: TDataModule},
  UniDataClientes in 'src\Data\UniDataClientes.pas' {DMClientes: TDataModule},
  inMtoModalHistoriaCli in 'src\UI\Modals\inMtoModalHistoriaCli.pas' {frmClientesHistoria},
  inMtoHistoriaClientes in 'src\UI\Maintenance\inMtoHistoriaClientes.pas' {frmMtoHistoriaClientes},
  UniDataHistoriaClientes in 'src\Data\UniDataHistoriaClientes.pas' {DMHistoriaClientes: TDataModule},
  inMtoFacturasHistoria in 'src\UI\Maintenance\inMtoFacturasHistoria.pas' {frmFacturasHistoria},
  inMtoOdontologos in 'src\UI\Maintenance\inMtoOdontologos.pas' {frmMtoOdontologos},
  inMtoFormasdePago in 'src\UI\Maintenance\inMtoFormasdePago.pas' {frmMtoFormasdePago},
  inMtoModalFacImp in 'src\UI\Modals\inMtoModalFacImp.pas' {frmPrintFac},
  inMtoPre in 'src\UI\Maintenance\inMtoPre.pas' {frmMtoPre},
  UniDataPre in 'src\Data\UniDataPre.pas' {dmPre: TDataModule},
  inMtoModalFacRec in 'src\UI\Modals\inMtoModalFacRec.pas' {frmGenFacRec},
  inMtoModalPreImp in 'src\UI\Modals\inMtoModalPreImp.pas' {frmPrintPre},
  inMtoModalPreRecImp in 'src\UI\Modals\inMtoModalPreRecImp.pas' {frmPrintPreRec},
  inMtoModalFacRecImp in 'src\UI\Modals\inMtoModalFacRecImp.pas' {frmPrintFacRec},
  inMtoModalPresuFac in 'src\UI\Modals\inMtoModalPresuFac.pas' {frmGenPreFac},
  inMtoModalCliEti in 'src\UI\Modals\inMtoModalCliEti.pas' {frmPrintCliEti},
  inMtoPreguntas in 'src\UI\Maintenance\inMtoPreguntas.pas' {frmMtoPreguntas},
  inMtoModalHisFac in 'src\UI\Modals\inMtoModalHisFac.pas' {frmModalHisFac},
  inMtoModalCliCues in 'src\UI\Modals\inMtoModalCliCues.pas' {frmPrintCliCues},
  inLibLog in 'src\Lib\Core\inLibLog.pas',
  inLibDocumentoValidator in 'src\Lib\Validators\inLibDocumentoValidator.pas',
  inMtoParametros in 'src\UI\Support\inMtoParametros.pas' {frmMtoParametros},
  inMtoPaises in 'src\UI\Maintenance\inMtoPaises.pas' {frmMtoPaises},
  inMtoModalNotaLegal in 'src\UI\Modals\inMtoModalNotaLegal.pas' {frmNotaLegal},
  inLibLogVeriFactu in 'src\Lib\VeriFactu\inLibLogVeriFactu.pas',
  inMtoRegVer in 'src\UI\Support\inMtoRegVer.pas',
  inMtoGenerarQR in 'src\UI\Support\inMtoGenerarQR.pas' {frmMtoGenerarQR},
  inLibVarGlob in 'src\Lib\Core\inLibVarGlob.pas',
  inLibJSON in 'src\Lib\Core\inLibJSON.pas',
  inLibVerifactuClient in 'src\Lib\VeriFactu\inLibVerifactuClient.pas',
  inLibJSONState in 'src\Lib\Core\inLibJSONState.pas',
  inLibVerifactuBuilder in 'src\Lib\VeriFactu\inLibVerifactuBuilder.pas',
  inMtoModalSubsanacion in 'src\UI\Modals\inMtoModalSubsanacion.pas' {frmModalSubsanacion},
  inMtoModalSubsanacionLineas in 'src\UI\Modals\inMtoModalSubsanacionLineas.pas' {frmModalSubsanacionLineas},
  inMtoModalVisorFoto in 'src\UI\Modals\inMtoModalVisorFoto.pas' {frmMtoVisorFoto},
  uEncryptHelper in '..\..\OdaVeriFactu\OdaVeriFactu\uEncryptHelper.pas',
  inLibImageUtils in 'src\Lib\Core\inLibImageUtils.pas',
  DelphiZXIngQRCode in 'src\Helpers\DelphiZXIngQRCode.pas';

//inIni in 'inIni.pas';

{$R *.res}

begin
    TdxDiacriticStringOptions.ComparisonMode :=
                                   TdxDiacriticStringComparisonMode.Insensitive;
  TdxDiacriticStringOptions.NormalizationMode :=
                                     TdxDiacriticStringNormalizationMode.System;
  Application.Initialize;
  Application.Title := 'Subocasana';
  Application.CreateForm(TfrmMtoPrincipal, frmMtoPrincipal);
  //Application.CreateForm(TfrmMtoVisorFoto, frmMtoVisorFoto);
  Application.Run;
end.
