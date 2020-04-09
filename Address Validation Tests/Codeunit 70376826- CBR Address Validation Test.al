codeunit 70376826 "Address Validation Test"
{
    Subtype = Test;
    TestPermissions = Disabled;

    trigger OnRun()
    begin
    end;

    [TEST]
    procedure Initialize()
    var
        AVSetup: Record "CBR Address Validation Setup";
    begin
        if not AVSetup.Get() then begin
            AVSetup.Init();
            AVSetup."Primary Key" := '';
            AVSetup.Enable := true;
            AVSetup.Insert();
        end;
    end;

    [ModalPageHandler]
    procedure AddressValidationPageHandler(var AddressValidationPage: TestPage "CBR Address Suggestion List");
    begin
    end;

    [MessageHandler]
    procedure UpdatesMsgHandler(Msg: Text[1024])
    begin
    end;

    [Test]
    [HandlerFunctions('AddressValidationPageHandler,UpdatesMsgHandler')]
    procedure ValidateAddressforSalesDocument()
    begin
        Initialize();
        SalesOrderPage.OpenView();
        SalesOrderPage.AddressValidation.Invoke();
    end;

    [Test]
    [HandlerFunctions('AddressValidationPageHandler,UpdatesMsgHandler')]
    procedure ValidateAddressforPurchDocument()
    begin
        Initialize();
        PurchOrderPage.OpenView();
        PurchOrderPage.AddressValidation.Invoke();
    end;

    var

        SalesOrderPage: TestPage "Sales Order";
        PurchOrderPage: TestPage "Purchase Order";
        PurchHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        Assert: Codeunit Assert;
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        LibrarySales: Codeunit "Library - Sales";
}