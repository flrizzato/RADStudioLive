//---------------------------------------------------------------------------

#ifndef UFrmMainH
#define UFrmMainH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.Bind.Components.hpp>
#include <Data.Bind.ObjectScope.hpp>
#include <REST.Backend.BindSource.hpp>
#include <REST.Backend.EMSProvider.hpp>
#include <REST.Backend.EMSServices.hpp>
#include <REST.Backend.MetaTypes.hpp>
#include <REST.Backend.ServiceComponents.hpp>
#include <REST.Backend.ServiceTypes.hpp>
#include <System.JSON.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <REST.Backend.Providers.hpp>
//---------------------------------------------------------------------------
class TFrmMain : public TForm
{
__published:	// IDE-managed Components
	TEMSProvider *EMSProvider1;
	TBackendAuth *BackendAuth1;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TTabSheet *TabSheet2;
	TLabel *Label1;
	TGroupBox *GroupBox1;
	TLabeledEdit *edtUserName;
	TLabeledEdit *edtPassword;
	TButton *Button1;
	TBackendUsers *BackendUsers1;
	TLabel *Label2;
	TListBox *ListBox1;
	TButton *Button2;
	TBackendQuery *BackendQueryUsers;
	TGroupBox *GroupBox2;
	TLabeledEdit *edtGroupName;
	TButton *Button3;
	TBackendGroups *BackendGroups1;
	TBackendQuery *BackendQueryGroups;
	TLabel *Label3;
	TListBox *ListBox2;
	TButton *Button4;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFrmMain(TComponent* Owner);
    void __fastcall LimpiarEdits(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TFrmMain *FrmMain;
//---------------------------------------------------------------------------
#endif
