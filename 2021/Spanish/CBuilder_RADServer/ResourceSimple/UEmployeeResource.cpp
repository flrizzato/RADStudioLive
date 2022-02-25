//---------------------------------------------------------------------------
#pragma hdrstop

#include "UEmployeeResource.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TEmployeeResource1::TEmployeeResource1(TComponent* Owner)
	: TDataModule(Owner)
{
}

void TEmployeeResource1::Get(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Retorna todos los registros en JSON
	std::unique_ptr<TJSONArray> _employees(new TJSONArray());
	std::unique_ptr<TFDQuery> _qry(new TFDQuery(NULL));
	_qry->Connection = EmployeeConnection;
	_qry->SQL->Text = "select * from employee";
	_qry->Active = true;
	while(!_qry->Eof) {
		TJSONObject * _employee = new TJSONObject();
		_employee->AddPair("emp_no", new TJSONNumber(_qry->FieldByName("emp_no")->AsInteger));
		_employee->AddPair("first_name", _qry->FieldByName("first_name")->AsString);
		_employee->AddPair("last_name", _qry->FieldByName("last_name")->AsString);
		_employee->AddPair("salary", new TJSONNumber(_qry->FieldByName("salary")->AsFloat));
		_employees->AddElement(_employee);
		_qry->Next();
	}
	AResponse->Body->SetValue(static_cast<TJSONValue*>(_employees->Clone()), true);
}

void TEmployeeResource1::GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	// Obtener la clave primaria
	item = ARequest->Params->Values["item"];
    // Retorna todos los registros en JSON
	std::unique_ptr<TJSONObject> _employee(new TJSONObject());
	std::unique_ptr<TFDQuery> _qry(new TFDQuery(NULL));
	_qry->Connection = EmployeeConnection;
	_qry->SQL->Text = "select * from employee where emp_no = :emp_no";
	_qry->Params->ParamByName("emp_no")->Value = item;
	_qry->Active = true;
	if(!_qry->Eof) {
		_employee->AddPair("emp_no", new TJSONNumber(_qry->FieldByName("emp_no")->AsInteger));
		_employee->AddPair("first_name", _qry->FieldByName("first_name")->AsString);
		_employee->AddPair("last_name", _qry->FieldByName("last_name")->AsString);
		_employee->AddPair("salary", new TJSONNumber(_qry->FieldByName("salary")->AsFloat));
	}
	AResponse->Body->SetValue(static_cast<TJSONValue*>(_employee->Clone()), true);
}

void TEmployeeResource1::Post(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	// Obtener el JSONObject que contiene los datos para insertar
	TJSONValue * _jsonRequest = ARequest->Body->GetValue();
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	std::unique_ptr<TFDQuery> _qry(new TFDQuery(NULL));
	_qry->Connection = EmployeeConnection;
	_qry->SQL->Text = "insert into employee (emp_no, first_name, last_name, salary) \
		values (:emp_no, :first_name, :last_name, :salary)";
	 _qry->Params->ParamByName("emp_no")->Value = _jsonRequest->GetValue<int>("emp_no");
	 _qry->Params->ParamByName("first_name")->Value = _jsonRequest->GetValue<System::UnicodeString>("first_name");
	 _qry->Params->ParamByName("last_name")->Value = _jsonRequest->GetValue<System::UnicodeString>("last_name");
	 _qry->Params->ParamByName("salary")->Value = _jsonRequest->GetValue<double>("salary");
	 try {
		 _qry->ExecSQL();
		 _return->AddPair("errorcode", new TJSONNumber(0));
		 AResponse->Body->SetValue(static_cast<TJSONValue*>(_return->Clone()), true);
	 } catch (...) {
		_return->AddPair("errorcode", new TJSONNumber(-1));
		 AResponse->Body->SetValue(static_cast<TJSONValue*>(_return->Clone()), true);
	 }
}

void TEmployeeResource1::PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
    // Obtener el JSONObject que contiene los datos para insertar
	TJSONValue * _jsonRequest = ARequest->Body->GetValue();
    std::unique_ptr<TFDQuery> _qry(new TFDQuery(NULL));
	_qry->Connection = EmployeeConnection;
	_qry->SQL->Text = "update employee set first_name = :first_name, last_name = :last_name, \
		salary = :salary where emp_no = :emp_no";
	 _qry->Params->ParamByName("emp_no")->Value = item;
	 _qry->Params->ParamByName("first_name")->Value = _jsonRequest->GetValue<System::UnicodeString>("first_name");
	 _qry->Params->ParamByName("last_name")->Value = _jsonRequest->GetValue<System::UnicodeString>("last_name");
	 _qry->Params->ParamByName("salary")->Value = _jsonRequest->GetValue<double>("salary");
	 try {
		 _qry->ExecSQL();
		 _return->AddPair("errorcode", new TJSONNumber(0));
		 AResponse->Body->SetValue(static_cast<TJSONValue*>(_return->Clone()), true);
	 } catch (...) {
		_return->AddPair("errorcode", new TJSONNumber(-1));
		 AResponse->Body->SetValue(static_cast<TJSONValue*>(_return->Clone()), true);
	 }
}

void TEmployeeResource1::DeleteItem(TEndpointContext* AContext, TEndpointRequest* ARequest, TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
}

static void Register()
{
    std::unique_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
    attributes->ResourceName = "Employee";
	attributes->ResourceSuffix["GetItem"] = "{item}";
    attributes->ResourceSuffix["PutItem"] = "{item}";
    attributes->ResourceSuffix["DeleteItem"] = "{item}";
    RegisterResource(__typeinfo(TEmployeeResource1), attributes.release());
}

#pragma startup Register 32
