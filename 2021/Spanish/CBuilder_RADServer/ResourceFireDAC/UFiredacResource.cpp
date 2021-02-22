//---------------------------------------------------------------------------
#pragma hdrstop

#include "UFiredacResource.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TFiredacDemoResource1::TFiredacDemoResource1(TComponent* Owner)
	: TDataModule(Owner)
{
}

void TFiredacDemoResource1::Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Sample code
	AResponse->Body->SetValue(new TJSONString("FiredacDemo"), true);
}

void TFiredacDemoResource1::GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	// Sample code
	AResponse->Body->SetValue(new TJSONString("FiredacDemo " +  item), true);
}

void TFiredacDemoResource1::Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
}

void TFiredacDemoResource1::PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
}

void TFiredacDemoResource1::DeleteItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
}

static void Register()
{
    std::unique_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
    attributes->ResourceName = "FiredacDemo";
    attributes->ResourceSuffix["dsrCOUNTRY"] = "COUNTRY";
    attributes->ResourceSuffix["dsrCUSTOMER"] = "CUSTOMER";
    attributes->ResourceSuffix["dsrDEPARTMENT"] = "DEPARTMENT";
    attributes->ResourceSuffix["dsrEMPLOYEE"] = "EMPLOYEE";
    attributes->ResourceSuffix["dsrEMPLOYEE_PROJECT"] = "EMPLOYEE_PROJECT";
    attributes->ResourceSuffix["dsrJOB"] = "JOB";
    attributes->ResourceSuffix["dsrPHONE_LIST"] = "PHONE_LIST";
    attributes->ResourceSuffix["dsrPROJECT"] = "PROJECT";
    attributes->ResourceSuffix["dsrPROJ_DEPT_BUDGET"] = "PROJ_DEPT_BUDGET";
    attributes->ResourceSuffix["dsrSALARY_HISTORY"] = "SALARY_HISTORY";
    attributes->ResourceSuffix["dsrSALES"] = "SALES";

    attributes->ResourceSuffix["GetItem"] = "{item}";
    attributes->ResourceSuffix["PutItem"] = "{item}";
    attributes->ResourceSuffix["DeleteItem"] = "{item}";
    RegisterResource(__typeinfo(TFiredacDemoResource1), attributes.release());
}

#pragma startup Register 32
