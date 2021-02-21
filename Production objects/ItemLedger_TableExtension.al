/// <summary>
/// TableExtension Item Ledger Entry Extension (ID 50107) extends Record Item Ledger Entry.
/// </summary>
tableextension 50107 "Item Ledger Entry Extension" extends "Item Ledger Entry"
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