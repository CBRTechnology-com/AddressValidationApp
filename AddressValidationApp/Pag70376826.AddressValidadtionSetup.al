page 70376826 "CBR Address Validation Setup"
{
    PageType = Card;
    Caption = 'Address Validation Setup';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CBR address Validation Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Setup)
            {
                field("Enable for Sales"; "Enable for Sales")
                {
                    ToolTip = 'Enables the users to use the Address validation app for Sales documents';
                    ApplicationArea = All;
                }
                field("Enable for Purchase"; "Enable for Purchase")
                {
                    ToolTip = 'Enables the users to use the Address validation app for Purchase documents';
                    ApplicationArea = All;
                }
                field("Enable for Service"; "Enable for Service")
                {
                    ToolTip = 'Enables the users to use the Address validation app for Service documents';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Create Permission Set")
            {
                ApplicationArea = All;
                Image = Permission;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Create Permission Set for Users to Use Address Check Utility';

                trigger OnAction()
                begin
                    CBRSetup.CreateBasicPermissionSet;
                end;
            }
        }
    }


    var
        CBRSetup: Record "CBR Address Validation Setup";

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then
            Insert()
    end;
}