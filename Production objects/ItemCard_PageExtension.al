pageextension 50103 MyExtension extends "Item Card"
{

    layout
    {
        addafter(AssemblyBOM)
        {
            field("Production BOM No"; rec."Production BOM No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
            field("Routing No"; rec."Routing No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
            field("Scrap"; rec.Scrap)
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
            field("Scrap Rate"; rec."Scrap Rate")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
            field("Scrap%"; rec."Scrap %")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
            field("Flushing_Method"; rec."Flushing Method")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
            field("Rounding_Precision"; rec."Rounding Precision")
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