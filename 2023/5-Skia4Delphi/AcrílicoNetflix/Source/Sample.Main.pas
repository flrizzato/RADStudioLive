unit Sample.Main;

interface

uses
  { Delphi }
  System.SysUtils, System.Types, System.UITypes, System.Classes, FMX.Types,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts,

  { Skia }
  Skia, Skia.FMX,

  { Sample }
  Sample.Acrylic;

type
  TfrmMain = class(TForm)
    Header: TAcrylicFrame;
    Navigation: TAcrylicFrame;
    FakeContent: TVertScrollBox;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label2: TLabel;
    Rectangle2: TRectangle;
    Label3: TLabel;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Rectangle4: TRectangle;
    Label5: TLabel;
    Rectangle5: TRectangle;
    Label6: TLabel;
    Rectangle6: TRectangle;
    Label7: TLabel;
    Rectangle7: TRectangle;
    Label8: TLabel;
    Rectangle8: TRectangle;
    Label9: TLabel;
    Layout2: TLayout;
    Label11: TLabel;
    SkSvg1: TSkSvg;
    Image9: TImage;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    Rectangle10: TRectangle;
    Label1: TLabel;
    Rectangle11: TRectangle;
    Label10: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    SkSvg4: TSkSvg;
    Label12: TLabel;
    SkSvg5: TSkSvg;
    Label13: TLabel;
    SkSvg6: TSkSvg;
    Label14: TLabel;
    SkSvg7: TSkSvg;
    Label15: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

end.
