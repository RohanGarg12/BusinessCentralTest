/// <summary>
/// TableExtension Item Journal Line Extension (ID 50108) extends Record Item Journal Line.
/// </summary>
tableextension 50108 "Item Journal Line Extension" extends "Item Journal Line"
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