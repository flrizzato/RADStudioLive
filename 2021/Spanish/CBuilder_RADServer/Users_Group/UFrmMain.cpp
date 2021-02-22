//---------------------------------------------------------------------------

#include <vcl.h>
#include <memory>
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
	// Obtenemos a través de BackendUser
	std::unique_ptr<TBackendUsersApi> _users(BackendUsers1->CreateUserAPI());
	std::unique_ptr<TJSONObject> AUserData(new TJSONObject());
	TBackendEntityValue ACreatedObject;
	_users->SignupUser(edtUserName->Text, edtPassword->Text, AUserData.get(), ACreatedObject);
    this->LimpiarEdits();

}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::LimpiarEdits(void)
{
	edtUserName->Text = "";
	edtPassword->Text = "";
}
void __fastcall TFrmMain::Button2Click(TObject *Sender)
{
	BackendQueryUsers->Execute();
	std::unique_ptr<TJSONArray> jsonUsers(BackendQueryUsers->JSONResult);
	ListBox1->Items->Clear();
	for (int i = 0; i < jsonUsers->Count; i++) {
		TJSONValue * _user = jsonUsers->operator [](i);
        ListBox1->Items->Add(_user->GetValue<System::UnicodeString>("username"));
	}
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::Button3Click(TObject *Sender)
{
	std::unique_ptr<TBackendGroupsApi> _groups(BackendGroups1->CreateGroupsAPI());
	std::unique_ptr<TJSONObject> AJSON(new TJSONObject());
	TBackendEntityValue ACreatedObject;
	_groups->CreateGroup(edtGroupName->Text, AJSON.get(), ACreatedObject);
}
//---------------------------------------------------------------------------
void __fastcall TFrmMain::Button4Click(TObject *Sender)
{
	BackendQueryGroups->Execute();
	std::unique_ptr<TJSONArray> _grupos(BackendQueryGroups->JSONResult);
	ListBox2->Items->Clear();
	for (int i = 0; i < _grupos->Count; i++) {
		TJSONValue * _grupo = _grupos->operator [](i);
        ListBox2->Items->Add(_grupo->GetValue<System::UnicodeString>("groupname"));
	}
}
//---------------------------------------------------------------------------
