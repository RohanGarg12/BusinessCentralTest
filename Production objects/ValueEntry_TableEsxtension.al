/// <summary>
/// TableExtension Value EntryExtension (ID 50110) extends Record Value Entry.
/// </summary>
tableextension 50110 "Value EntryExtension" extends "Value Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50000; Scrap; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Scrap Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}