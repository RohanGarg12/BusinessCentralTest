pageextension 50102 "Prod Bomm List" extends "Production BOM List"
{
    Editable = true;

    layout
    {
        addafter("No.")
        {
            field("Version"; rec."Version Nos.")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}