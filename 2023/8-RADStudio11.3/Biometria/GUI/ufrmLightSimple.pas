unit ufrmLightSimple;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.StdCtrls, FMX.MultiView, FMX.Edit, FMX.ListBox, FMX.Layouts,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Objects, System.ImageList,
  FMX.ImgList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, System.Rtti,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLightSimple = class(TForm)
    StyleBookLight: TStyleBook;
    LayoutContent: TLayout;
    VertScrollBoxMain: TVertScrollBox;
    Layout4: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    GridPanelLayoutMain: TGridPanelLayout;
    Layout1: TLayout;
    LabelGroupCaption1: TLabel;
    Layout2: TLayout;
    LabelGroupCaption2: TLabel;
    tDestroyAnime: TTimer;
    ListBoxFeatured1: TListBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    Layout3: TLayout;
    LabelGroupCaption3: TLabel;
    PanelBottom: TPanel;
    animateBottom: TFloatAnimation;
    PanelTop: TPanel;
    PanelMenu: TPanel;
    btnMenu: TButton;
    FloatAnimationbtnMenu: TFloatAnimation;
    Button1: TButton;
    FloatAnimationbtnMic: TFloatAnimation;
    eSearch: TEdit;
    animateTop: TFloatAnimation;
    mvSliderMenu: TMultiView;
    lbMainMenu: TListBox;
    lbiMoveBack: TListBoxItem;
    GridPanelLayout1: TGridPanelLayout;
    btnNew: TSpeedButton;
    ColorAnimation6: TColorAnimation;
    btnAdd: TSpeedButton;
    ColorAnimation1: TColorAnimation;
    btnMail: TSpeedButton;
    ColorAnimation2: TColorAnimation;
    btnPerson: TSpeedButton;
    ColorAnimation3: TColorAnimation;
    Layout5: TLayout;
    TabControl2: TTabControl;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ImageListFeatured: TImageList;
    FDMemTableFeatured: TFDMemTable;
    StringField3: TStringField;
    BlobField2: TBlobField;
    IntegerField2: TIntegerField;
    ListBoxCategories1: TListBox;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    FDMemTableCategories: TFDMemTable;
    StringField1: TStringField;
    BlobField1: TBlobField;
    IntegerField1: TIntegerField;
    FDMemTableCategoriesColor: TIntegerField;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    GridPanelLayout2: TGridPanelLayout;
    Layout6: TLayout;
    Label1: TLabel;
    Layout7: TLayout;
    Label2: TLabel;
    ListBoxFeatured2: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    Layout8: TLayout;
    Label3: TLabel;
    Layout9: TLayout;
    TabControl3: TTabControl;
    TabItem9: TTabItem;
    Panel5: TPanel;
    Image5: TImage;
    TabItem10: TTabItem;
    Panel6: TPanel;
    Image6: TImage;
    TabItem11: TTabItem;
    Panel7: TPanel;
    Image7: TImage;
    TabItem12: TTabItem;
    Panel8: TPanel;
    Image8: TImage;
    ListBoxCategories2: TListBox;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    GridPanelLayout3: TGridPanelLayout;
    Layout10: TLayout;
    Label4: TLabel;
    Layout11: TLayout;
    Label5: TLabel;
    ListBoxFeatured3: TListBox;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    Layout12: TLayout;
    Label6: TLabel;
    Layout13: TLayout;
    TabControl4: TTabControl;
    TabItem13: TTabItem;
    Panel9: TPanel;
    Image9: TImage;
    TabItem14: TTabItem;
    Panel10: TPanel;
    Image10: TImage;
    TabItem15: TTabItem;
    Panel11: TPanel;
    Image11: TImage;
    TabItem16: TTabItem;
    Panel12: TPanel;
    Image12: TImage;
    ListBoxCategories3: TListBox;
    ListBoxItem22: TListBoxItem;
    ListBoxItem23: TListBoxItem;
    ListBoxItem24: TListBoxItem;
    ListBoxItem25: TListBoxItem;
    ListBoxItem26: TListBoxItem;
    ListBoxItem27: TListBoxItem;
    GridPanelLayout4: TGridPanelLayout;
    Layout14: TLayout;
    Label7: TLabel;
    Layout15: TLayout;
    Label8: TLabel;
    ListBoxFeatured4: TListBox;
    ListBoxItem28: TListBoxItem;
    ListBoxItem29: TListBoxItem;
    ListBoxItem30: TListBoxItem;
    Layout16: TLayout;
    Label9: TLabel;
    Layout17: TLayout;
    TabControl5: TTabControl;
    TabItem17: TTabItem;
    Panel13: TPanel;
    Image13: TImage;
    TabItem18: TTabItem;
    Panel14: TPanel;
    Image14: TImage;
    TabItem19: TTabItem;
    Panel15: TPanel;
    Image15: TImage;
    TabItem20: TTabItem;
    Panel16: TPanel;
    Image16: TImage;
    ListBoxCategories4: TListBox;
    ListBoxItem31: TListBoxItem;
    ListBoxItem32: TListBoxItem;
    ListBoxItem33: TListBoxItem;
    ListBoxItem34: TListBoxItem;
    ListBoxItem35: TListBoxItem;
    ListBoxItem36: TListBoxItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnBottomMenuClick(Sender: TObject);
    procedure tDestroyAnimeTimer(Sender: TObject);
    procedure VertScrollBoxMainViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
    procedure btnMenuClick(Sender: TObject);
    procedure lbiMoveBackClick(Sender: TObject);
  private
    FSuccProc: TProc;
    FBarsIsShowing: Boolean;

    procedure InsertTestDataToTheMemTables();

    procedure LoadFeaturedListboxItems(aListBox: TListBox);
    procedure ListBoxItemFeaturedClick(Sender: TObject);
    procedure LoadCategoriesListboxItems(aListBox: TListBox);
    procedure ListBoxItemCategoriesClick(Sender: TObject);
  public
    function RunDialog(const SuccProc: TProc): string;
  end;

  function ShowLightSimpleForm(): TfrmLightSimple;

var
  frmLightSimple: TfrmLightSimple;

implementation

{$R *.fmx}

function ShowLightSimpleForm(): TfrmLightSimple;
begin
  if Assigned(frmLightSimple) then
    frmLightSimple.Free;

  frmLightSimple:= TfrmLightSimple.Create(Application);
  Result:= frmLightSimple;
end;

function TfrmLightSimple.RunDialog(const SuccProc: TProc): string;
begin
  FSuccProc:= SuccProc;
  {$IF DEFINED(Win64) or DEFINED(Win32)}
  ShowModal;
  {$ELSE}
  Self.Show;
  {$ENDIF}
end;

procedure TfrmLightSimple.FormShow(Sender: TObject);
begin
  InsertTestDataToTheMemTables();
  FBarsIsShowing:= True;

  TabItem1.Text:= btnNew.Text;
  TabItem6.Text:= btnAdd.Text;
  TabItem7.Text:= btnMail.Text;
  TabItem8.Text:= btnPerson.Text;

  LoadFeaturedListboxItems(ListBoxFeatured1);
  LoadCategoriesListboxItems(ListBoxCategories1);
end;

procedure TfrmLightSimple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSuccProc) then
  begin
    FSuccProc();
    FSuccProc:= nil;
  end;
end;

procedure TfrmLightSimple.btnBottomMenuClick(Sender: TObject);

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
  VertScrollBoxMain.ViewportPosition:= TPointF.Create(0, 0);

  TabControl1.TabIndex:= TFmxObject(Sender).Tag;

  case TFmxObject(Sender).Tag of
    0:
      begin
        btnNew.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnNew);

        LoadFeaturedListboxItems(ListBoxFeatured1);
        LoadCategoriesListboxItems(ListBoxCategories1);
      end;
    1:
      begin
        btnAdd.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnAdd);

        LoadFeaturedListboxItems(ListBoxFeatured2);
        LoadCategoriesListboxItems(ListBoxCategories2);
      end;
    2:
      begin
        btnMail.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnMail);

        LoadFeaturedListboxItems(ListBoxFeatured3);
        LoadCategoriesListboxItems(ListBoxCategories3);
      end;
    3:
      begin
        btnPerson.StylesData['Circle.Visible']:= True;
        StartCircleAnimation(btnPerson);

        LoadFeaturedListboxItems(ListBoxFeatured4);
        LoadCategoriesListboxItems(ListBoxCategories4);
      end;
  end;

  tDestroyAnime.Enabled:= True;
end;

procedure TfrmLightSimple.tDestroyAnimeTimer(Sender: TObject);
begin
  tDestroyAnime.Enabled:= False;

  btnNew.StylesData['Circle.Visible']:= False;
  btnAdd.StylesData['Circle.Visible']:= False;
  btnMail.StylesData['Circle.Visible']:= False;
  btnPerson.StylesData['Circle.Visible']:= False;
end;

procedure TfrmLightSimple.InsertTestDataToTheMemTables();
var
  lMemoryStream: TMemoryStream;
begin
  {$region ' for featured listbox '}
  FDMemTableFeatured.Open;

  // First item
  FDMemTableFeatured.Insert;
  FDMemTableFeatured.FieldByName('ID').AsInteger:= 3;

  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListFeatured.Source[2].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTableFeatured.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTableFeatured.Post;

  // Second item
  FDMemTableFeatured.Insert;
  FDMemTableFeatured.FieldByName('ID').AsInteger:= 2;
  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListFeatured.Source[1].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTableFeatured.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTableFeatured.Post;

  // Third item
  FDMemTableFeatured.Insert;
  FDMemTableFeatured.FieldByName('ID').AsInteger:= 1;
  lMemoryStream:= TMemoryStream.Create;
  try
    ImageListFeatured.Source[0].MultiResBitmap.Bitmaps[1].SaveToStream(lMemoryStream);
    lMemoryStream.Position:= 0;
    (FDMemTableFeatured.FieldByName('Image') as TBlobField).LoadFromStream(lMemoryStream);
  finally
    lMemoryStream.Free;
  end;
  FDMemTableFeatured.Post;
  {$endregion}

  {$region ' for categories listbox '}
  FDMemTableCategories.Open;

  // 1 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 6;
  FDMemTableCategories.FieldByName('Text').AsString:= 'POLITICS';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($ff76909a);

  FDMemTableCategories.Post;

  // 2 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 5;
  FDMemTableCategories.FieldByName('Text').AsString:= 'BUSINESS';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($ff9bcc63);

  FDMemTableCategories.Post;

  // 3 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 4;
  FDMemTableCategories.FieldByName('Text').AsString:= 'FASHION';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($fffda722);

  FDMemTableCategories.Post;

  // 4 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 3;
  FDMemTableCategories.FieldByName('Text').AsString:= 'SPORT';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($ff5a6abe);

  FDMemTableCategories.Post;

  // 5 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 2;
  FDMemTableCategories.FieldByName('Text').AsString:= 'TECHNOLOGY';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($ff40a5f3);

  FDMemTableCategories.Post;

  // 6 item
  FDMemTableCategories.Insert;
  FDMemTableCategories.FieldByName('ID').AsInteger:= 1;
  FDMemTableCategories.FieldByName('Text').AsString:= 'AUTOMOTIVE';
  FDMemTableCategories.FieldByName('Color').AsInteger:= Integer($ffee534e);

  FDMemTableCategories.Post;

  {$endregion}
end;

procedure TfrmLightSimple.LoadFeaturedListboxItems(aListBox: TListBox);
var
  lLBItem: TListBoxItem;
  lMemoryStream: TMemoryStream;
begin
  aListBox.BeginUpdate;
  try
    aListBox.Clear;

    FDMemTableFeatured.First;
    while not FDMemTableFeatured.Eof do
    begin
      lLBItem:= TListBoxItem.Create(nil);
      lLBItem.StyleLookup:= 'ListboxItemFeaturedStyle';
      lLBItem.OnClick:= ListBoxItemFeaturedClick;

      lLBItem.Width:= (Width - 25) / 3;
      lLBItem.Tag:= FDMemTableFeatured.FieldByName('ID').AsInteger;
      lLBItem.Text:= FDMemTableFeatured.FieldByName('Text').AsString;

      {$region ' Load image to stream '}
      lMemoryStream:= TMemoryStream.Create;
      try
        (FDMemTableFeatured.FieldByName('Image') as TBlobField).SaveToStream(lMemoryStream);
        lLBItem.ItemData.Bitmap:= TBitmap.CreateFromStream(lMemoryStream);
      finally
        lMemoryStream.Free;
      end;
      {$endregion}

      aListBox.AddObject(lLBItem);

      FDMemTableFeatured.Next;
    end;
  finally
    aListBox.EndUpdate;
  end;
end;

procedure TfrmLightSimple.ListBoxItemFeaturedClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmLightSimple.LoadCategoriesListboxItems(aListBox: TListBox);
var
  lLBItem: TListBoxItem;
begin
  aListBox.BeginUpdate;
  try
    aListBox.Clear;

    FDMemTableCategories.First;
    while not FDMemTableCategories.Eof do
    begin
      lLBItem:= TListBoxItem.Create(nil);
      lLBItem.StyleLookup:= 'ListboxItemCategoriesStyle';
      lLBItem.OnClick:= ListBoxItemCategoriesClick;

      {$IF DEFINED(ANDROID) or DEFINED(iOS)}
      lLBItem.Height:= 45;
      {$ELSE}
      lLBItem.Height:= 60;
      {$ENDIF}

      lLBItem.Tag:= FDMemTableCategories.FieldByName('ID').AsInteger;
      lLBItem.Text:= FDMemTableCategories.FieldByName('Text').AsString;
      lLBItem.StylesData['background.fill.Color']:= TValue.From<TAlphaColor>(TAlphaColor(FDMemTableCategories.FieldByName('Color').AsInteger));
      lLBItem.StylesData['background.stroke.Color']:= TValue.From<TAlphaColor>(TAlphaColor(FDMemTableCategories.FieldByName('Color').AsInteger));

      aListBox.AddObject(lLBItem);

      FDMemTableCategories.Next;
    end;
  finally
    aListBox.EndUpdate;
  end;
end;

procedure TfrmLightSimple.ListBoxItemCategoriesClick(Sender: TObject);
begin
  if TListBoxItem(Sender).Tag > 0 then
  begin

  end;
end;

procedure TfrmLightSimple.VertScrollBoxMainViewportPositionChange( Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);

  procedure DoAnimate(AVisible: Boolean);
  begin
    animateBottom.Inverse:= AVisible;
    animateBottom.Start;

    animateTop.Inverse:= AVisible;
    animateTop.Start;
  end;

begin
    if FBarsIsShowing and (NewViewportPosition.Y > OldViewportPosition.Y) then
    begin
      FBarsIsShowing:= False;
      DoAnimate(FBarsIsShowing);
    end else
    if not FBarsIsShowing and (NewViewportPosition.Y < OldViewportPosition.Y) then
    begin
      FBarsIsShowing:= True;
      DoAnimate(FBarsIsShowing);
    end;
end;

procedure TfrmLightSimple.btnMenuClick(Sender: TObject);
begin
  if not mvSliderMenu.IsShowed then
    mvSliderMenu.ShowMaster
  else
    mvSliderMenu.HideMaster;
end;

procedure TfrmLightSimple.lbiMoveBackClick(Sender: TObject);
begin
  mvSliderMenu.HideMaster;
  Close;
end;

end.
