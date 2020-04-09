table 70376826 "CBR Address Validation Setup"
{
    Caption = 'Address Validation Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Enable for Sales"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(3; "Enable for Purchase"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Enable for Service"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        CBRAV: Label 'Would you like to Add AddressValidation Roles To Users?';

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


    procedure CreateBasicPermissionSet()
    var
        UserRole: Record "Permission Set";
        Permission: Record Permission;
        AllObj: Record AllObj;
        User: Record User;
        WindowsLogin: Record User;
        WindowsAccessControl: Record "Access Control";
        UserSetuppage: Page "User Setup";
    begin
        UserRole."Role ID" := 'CBR AV Basic';
        UserRole.Name := 'Required for all AV user';
        if not UserRole.Insert then;
        AllObj.Reset;
        AllObj.SetRange("Object Type", AllObj."Object Type"::TableData);
        AllObj.SetFilter("Object ID", '70376826..70376834');
        if AllObj.Find('-') then
            repeat
                Permission."Role ID" := UserRole."Role ID";
                Permission."Object Type" := AllObj."Object Type";
                Permission."Object ID" := AllObj."Object ID";

                Permission."Read Permission" := Permission."Read Permission"::Yes;
                if AllObj."Object ID" in [70376825, 70376826] then begin
                    Permission."Insert Permission" := Permission."Insert Permission"::Yes;
                    Permission."Modify Permission" := Permission."Modify Permission"::Yes;
                    Permission."Delete Permission" := Permission."Delete Permission"::Yes;
                    Permission."Execute Permission" := Permission."Execute Permission"::Yes;
                end else begin
                    Permission."Insert Permission" := Permission."Insert Permission"::" ";
                    Permission."Modify Permission" := Permission."Modify Permission"::" ";
                    Permission."Delete Permission" := Permission."Delete Permission"::" ";
                    Permission."Execute Permission" := Permission."Execute Permission"::" ";
                end;
                if not Permission.Insert then;
            until AllObj.Next = 0;
        Commit;
        UserSetuppage.CBRACUPermissionAssign(UserRole."Role ID");
        if Confirm(CBRAV, true) then begin
            UserSetuppage.LookupMode(true);
            UserSetuppage.RunModal;
        end;

    end;
}