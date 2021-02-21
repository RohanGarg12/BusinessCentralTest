/// <summary>
/// Codeunit Scrap Customization (ID 50110).
/// </summary>
codeunit 50110 "Scrap Customization"
{

    // Insert Production Order Component   if Scrap Boolean is true on Item Card 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate Prod. Order", 'OnAfterProdOrderCompInsert', '', true, true)]
    local procedure OnAfterProdOrderCompInsert(ProdOrderComponent: Record "Prod. Order Component"; ProductionBOMLine: Record "Production BOM Line")
    var
        RecItem: Record Item;
        ProdOrderComponentInsert: Record "Prod. Order Component";
    begin
        RecItem.GET(ProductionBOMLine."No.");
        IF NOT RecItem.Scrap THEN
            EXIT;

        ProdOrderComponentInsert := ProdOrderComponent;
        ProdOrderComponentInsert."Line No." := ProdOrderComponentInsert."Line No." + 10000;
        ProdOrderComponentInsert.VALIDATE("Quantity per", (ProdOrderComponent."Quantity per" * RecItem."Scrap Rate") / 100);

        //MESSAGE(FORMAT((ProdOrderComponent."Qty. per Unit of Measure"*RecItem."Scrap Rate")/100));
        ProdOrderComponentInsert."Scrap Rate" := RecItem."Scrap Rate";
        ProdOrderComponentInsert.Scrap := TRUE;
        ProdOrderComponentInsert.INSERT;

        //Modify Production Order Component
        ProdOrderComponent."Scrap Rate" := RecItem."Scrap Rate";
        ProdOrderComponent.MODIFY;

    end;


    // Flow Scrap Rate and Boolean From Production Component  to Item Journal Line
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Production Journal Mgt", 'OnBeforeInsertConsumptionJnlLine', '', true, true)]
    local procedure OnBeforeInsertConsumptionJnlLine(var ItemJournalLine: Record "Item Journal Line"; ProdOrderComp: Record "Prod. Order Component")
    begin
        ItemJournalLine."Scrap Rate" := ProdOrderComp."Scrap Rate";
        ItemJournalLine.Scrap := ProdOrderComp.Scrap;
        IF ItemJournalLine.Scrap THEN
            ItemJournalLine."Inventory Posting Group" := 'SCRAP NEW';
    end;

    //Flow Scrap Rate and Boolean From  Item Journal Line to Item Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry.Scrap := ItemJournalLine.Scrap;
        NewItemLedgEntry."Scrap Rate" := ItemJournalLine."Scrap Rate";
    end;

    //Flow Scrap Rate and Boolean From  Item Journal Line to Value Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', true, true)]
    local procedure OnAfterInitValueEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        ValueEntry.Scrap := ItemJournalLine.Scrap;
        ValueEntry."Scrap Rate" := ItemJournalLine."Scrap Rate";
    end;

    var
        myInt: Integer;
}