unit ufrmMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Maps, FMX.Ani, FMX.Layouts, FMX.Controls.Presentation;

type
  TfrmMap = class(TForm)
    StyleBookLight: TStyleBook;
    LayoutContent: TLayout;
    VertScrollBoxMain: TVertScrollBox;
    PanelBottom: TPanel;
    animateBottom: TFloatAnimation;
    GridPanelLayout1: TGridPanelLayout;
    btnMap: TSpeedButton;
    btnList: TSpeedButton;
    Layout1: TLayout;
    btnAdd: TSpeedButton;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    FloatAnimationShowCaption: TFloatAnimation;
    LabelButtonsCaption: TLabel;
    FloatAnimationDisableCaption: TFloatAnimation;
    tDestroyAnime: TTimer;
    tDestroyCaptionAnimation: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tDestroyAnimeTimer(Sender: TObject);
    procedure btnBottomMenuClick(Sender: TObject);
    procedure tDestroyCaptionAnimationTimer(Sender: TObject);
  private
    FSuccProc: TProc;
  public
    function RunDialog(const SuccProc: TProc): string;
  end;

  function ShowMapForm(): TfrmMap;

var
  frmMap: TfrmMap;

implementation

{$R *.fmx}

function ShowMapForm(): TfrmMap;
begin
  if Assigned(frmMap) then
    frmMap.Free;

  frmMap:= TfrmMap.Create(Application);
  Result:= frmMap;
end;

function TfrmMap.RunDialog(const SuccProc: TProc): string;
begin
  FSuccProc:= SuccProc;
  {$IF DEFINED(Win64) or DEFINED(Win32)}
  ShowModal;
  {$ELSE}
  Self.Show;
  {$ENDIF}
end;

procedure TfrmMap.FormShow(Sender: TObject);
begin
//
end;

procedure TfrmMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSuccProc) then
  begin
    FSuccProc();
    FSuccProc:= nil;
  end;
end;

procedure TfrmMap.btnBottomMenuClick(Sender: TObject);

  procedure StartCircleAnimation(aButton: TSpeedButton = nil);
  var
    lAnimane: TFloatAnimation;
  begin
    if Assigned(aButton) then
    begin
      lAnimane:= aButton.FindStyleResource('CircleAnimation') as  TFloatAnimation;

      if Assigned(lAnimane) then
        lAnimane.Start;
    end;
  end;

begin
  LabelButtonsCaption.Text:= TSpeedButton(Sender).Text + ' Clicked';;
  FloatAnimationShowCaption.Start;

  case TFmxObject(Sender).Tag of
    0:
      begin
        btnMap.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnMap);
      end;
    1:
      begin
        btnAdd.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnAdd);
      end;
    2:
      begin
        btnList.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnList);
      end;
  end;

  tDestroyAnime.Enabled:= True;
  tDestroyCaptionAnimation.Enabled:= True;
end;

procedure TfrmMap.tDestroyAnimeTimer(Sender: TObject);
begin
  tDestroyAnime.Enabled:= False;

  btnMap.StylesData['Circle.Visible']:= False;
  btnAdd.StylesData['Circle.Visible']:= False;
  btnList.StylesData['Circle.Visible']:= False;
end;

procedure TfrmMap.tDestroyCaptionAnimationTimer(Sender: TObject);
begin
  tDestroyCaptionAnimation.Enabled:= False;

  FloatAnimationDisableCaption.Start;
end;

end.
