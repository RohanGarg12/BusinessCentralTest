/// <summary>
/// TableExtension Production Component Extension (ID 50109) extends Record Prod. Order Component.
/// </summary>
tableextension 50109 "Production Component Extension" extends "Prod. Order Component"
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