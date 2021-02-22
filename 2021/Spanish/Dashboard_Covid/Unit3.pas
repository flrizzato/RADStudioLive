unit Unit3;

{Autor: José Castillo Reyes - Embarcadero MVP - R2 DATA TECHNOLOGY
 País: Perú
 E-mail: josecastilloreyes@gmail.com
 Blog: https://josecastilloreyes.blogspot.com/
}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series.Surface, FMXTee.Series.Map, FMXTee.Series.World, FMXTee.Procs,
  FMXTee.Chart, FMXTee.DBChart, System.Rtti, FMX.Grid.Style, FMX.Grid,
  FMX.Controls.Presentation, FMX.ScrollBox, FMXTee.Chart.Grid, FMXTee.Series,
  FMXTee.Tools, FMXTee.Series.ActivityGauge, FMXTee.Series.Donut, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.StdCtrls, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ListBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope,
  FMXTee.Tools.PageNumber, FMXTee.Chart.Crosstab, FMXTee.Tools.ScrollPager;

type
  TForm3 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField: TLinkFillControlToField;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Button1: TButton;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    LinkFillControlToField1: TLinkFillControlToField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Recuperados: TLabel;
    Muertes: TLabel;
    Totales: TLabel;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    RESTClient3: TRESTClient;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
    RESTResponseDataSetAdapter3: TRESTResponseDataSetAdapter;
    FDMemTable3: TFDMemTable;
    Panel3: TPanel;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    DBChart5: TDBChart;
    Series5: TDonutSeries;
    Splitter1: TSplitter;
    ChartTool1: TPageNumTool;
    Splitter2: TSplitter;
    DataSource1: TDataSource;
    titulo: TLabel;
    ChartTool2: TPageNumTool;
    FDMemTable2country: TWideStringField;
    FDMemTable2last_update: TDateTimeField;
    FDMemTable2cases: TFloatField;
    FDMemTable2deaths: TFloatField;
    FDMemTable2recovered: TFloatField;
    DBCrossTabSource1: TDBCrossTabSource;
    Series2: TLineSeries;
    Series3: TLineSeries;
    DBCrossTabSource2: TDBCrossTabSource;
    DBChart2: TDBChart;
    Series4: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    StyleBook1: TStyleBook;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
 RESTRequest1.Execute;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
 titulo.Text := 'COVID-19 Casos Actuales: ' + ComboBox1.Selected.Text;

 if not FDMemTable1.Locate('name', ComboBox1.Selected.Text, [])  then
  ShowMessage('No se encontró')
 else
  begin
   RESTRequest2.Resource := '/' + FDMemTable1.FieldByName('alpha2').Value;
   RESTRequest2.Execute;

   titulo.Text := titulo.Text + '       Fecha:' + FDMemTable2.FieldByName('last_update').AsString;

   RESTRequest3.Resource := '/' + FDMemTable1.FieldByName('alpha2').Value;
   RESTRequest3.Execute;

   FDMemTable3.IndexFieldNames := 'last_update:A';
   DBChart1.RefreshData;
   DBChart2.RefreshData;

  end;

end;

end.
