unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Edit;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    StyleBook1: TStyleBook;
    Edit1: TEdit;
    Layout1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if True then;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if True then;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if True then;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  if True then;
end;

end.
