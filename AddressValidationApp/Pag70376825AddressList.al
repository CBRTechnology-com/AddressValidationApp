page 70376825 "CBR Address Suggestion List"
{

    PageType = List;
    SourceTable = "CBR Address Validation";
    SourceTableView = WHERE(City = FILTER(<> ''));
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Address; Address)
                {
                    ApplicationArea = all;
                }
                field(City; City)
                {
                    ApplicationArea = all;
                }
                field("Postal Code"; "Postal Code")
                {
                    ApplicationArea = all;
                }
                field("State Code"; "State Code")
                {
                    Caption = 'State Code';
                    ApplicationArea = all;
                }
                field("Country Code"; "Country Code")
                {
                    ApplicationArea = all;
                }
                field(Region; Region)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

