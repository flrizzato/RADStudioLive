unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,

  System.Rtti,
  ufrmBasic, ufrmShifting, ufrmLight, ufrmDark, ufrmIcon, ufrmPrimary, ufrmMap,
  ufrmLightSimple,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls,
  System.ImageList,
  FMX.ImgList, FMX.Edit, FMX.Ani, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Gestures,
  FMX.TabControl, FMX.MultiView, FMX.BiometricAuth;

type
  TfmrMain = class(TForm)
    StyleBookMain: TStyleBook;
    ImageListButtons: TImageList;
    LayoutContent: TLayout;
    PanelMenu: TPanel;
    PanelBottom: TPanel;
    lbMainMenu: TListBox;
    lbiBasic: TListBoxItem;
    lbiShifting: TListBoxItem;
    lbiLight: TListBoxItem;
    lbiDark: TListBoxItem;
    lbiIcon: TListBoxItem;
    lbiPrimary: TListBoxItem;
    lbiMapBlue: TListBoxItem;
    lbiLightSimple: TListBoxItem;
    BiometricAuthMain: TBiometricAuth;
    lblStatus: TLabel;
    Label1: TLabel;
    procedure ListBoxItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BiometricAuthMainAuthenticateSuccess(Sender: TObject);
    procedure BiometricAuthMainAuthenticateFail(Sender: TObject;
      const FailReason: TBiometricFailReason; const ResultMessage: string);
  private
    { Private declarations }
    fDialogNumber: integer;
    procedure RunDialog;
  public
    { Public declarations }
  end;

var
  fmrMain: TfmrMain;

implementation

{$R *.fmx}

uses TypInfo;

procedure TfmrMain.BiometricAuthMainAuthenticateFail(Sender: TObject;
  const FailReason: TBiometricFailReason; const ResultMessage: string);
var sMsg: string;
begin
  sMsg := GetEnumName(TypeInfo(TBiometricFailReason), integer(FailReason));
  if ResultMessage.Trim <> '' then
    sMsg := sMsg + ' - ' + ResultMessage;
  lblStatus.Text := 'Falha de Autenticação: ' + sMsg;
end;

procedure TfmrMain.BiometricAuthMainAuthenticateSuccess(Sender: TObject);
begin
  lblStatus.Text := 'Autenticação OK!';
  RunDialog;
end;

procedure TfmrMain.FormCreate(Sender: TObject);
begin
  fDialogNumber := -1;
end;

procedure TfmrMain.ListBoxItemClick(Sender: TObject);
begin
  fDialogNumber := TListBoxItem(Sender).Tag;
  if BiometricAuthMain.IsSupported then
    BiometricAuthMain.Authenticate
  else
  begin
    // login tradicional ?
  end;
end;

procedure TfmrMain.RunDialog;
begin
  case fDialogNumber of
    0:
      ShowBasicForm().RunDialog(
        procedure()
        begin
        end);
    1:
      ShowShiftingForm().RunDialog(
        procedure()
        begin
        end);
    2:
      ShowLightForm().RunDialog(
        procedure()
        begin
        end);
    3:
      ShowDarkForm().RunDialog(
        procedure()
        begin
        end);
    4:
      ShowIconForm().RunDialog(
        procedure()
        begin
        end);
    5:
      ShowPrimaryForm().RunDialog(
        procedure()
        begin
        end);
    6:
      ShowMapForm().RunDialog(
        procedure()
        begin
        end);
    7:
      ShowLightSimpleForm().RunDialog(
        procedure()
        begin
        end);
  end;
end;

end.
