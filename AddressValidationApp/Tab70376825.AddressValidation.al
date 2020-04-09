table 70376825 "CBR Address Validation"
{
    // version VLES1.00


    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; City; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; "State Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Postal Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(5; Address; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Country Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(7; Region; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

