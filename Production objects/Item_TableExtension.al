/// <summary>
/// TableExtension Item Extension (ID 50106) extends Record Item.
/// </summary>
tableextension 50106 "Item Extension" extends Item
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