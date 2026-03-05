//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UFrmMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFrmMain *FrmMain;
//---------------------------------------------------------------------------
__fastcall TFrmMain::TFrmMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::Button1Click(TObject *Sender)
{
    EMSFireDACClient1->GetData();
}
//---------------------------------------------------------------------------
