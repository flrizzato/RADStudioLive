// EMS Resource Modules
//---------------------------------------------------------------------------

#ifndef UFiredacResourceH
#define UFiredacResourceH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <System.SysUtils.hpp>
#include <EMS.Services.hpp>
#include <EMS.ResourceAPI.hpp>
#include <EMS.ResourceTypes.hpp>
#include <Data.DB.hpp>
#include <EMS.DataSetResource.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.ConsoleUI.Wait.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.IB.hpp>
#include <FireDAC.Phys.IBDef.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.Stan.StorageJSON.hpp>
#include <FireDAC.UI.Intf.hpp>
//---------------------------------------------------------------------------
#pragma explicit_rtti methods (public)
class TFiredacDemoResource1 : public TDataModule
{
__published:
    TFDConnection *FDConnection1;
    TFDQuery *qryCOUNTRY;
    TEMSDataSetResource *dsrCOUNTRY;
    TFDQuery *qryCUSTOMER;
    TEMSDataSetResource *dsrCUSTOMER;
    TFDQuery *qryDEPARTMENT;
    TEMSDataSetResource *dsrDEPARTMENT;
    TFDQuery *qryEMPLOYEE;
    TEMSDataSetResource *dsrEMPLOYEE;
    TFDQuery *qryEMPLOYEE_PROJECT;
    TEMSDataSetResource *dsrEMPLOYEE_PROJECT;
    TFDQuery *qryJOB;
    TEMSDataSetResource *dsrJOB;
    TFDQuery *qryPHONE_LIST;
    TEMSDataSetResource *dsrPHONE_LIST;
    TFDQuery *qryPROJECT;
    TEMSDataSetResource *dsrPROJECT;
    TFDQuery *qryPROJ_DEPT_BUDGET;
    TEMSDataSetResource *dsrPROJ_DEPT_BUDGET;
    TFDQuery *qrySALARY_HISTORY;
    TEMSDataSetResource *dsrSALARY_HISTORY;
    TFDQuery *qrySALES;
    TEMSDataSetResource *dsrSALES;
	TFDStanStorageJSONLink *FDStanStorageJSONLink1;

private:
public:
	__fastcall TFiredacDemoResource1(TComponent* Owner);
	void Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
	void DeleteItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse);
};
#endif
