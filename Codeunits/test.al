codeunit 50104 MyCodeunit
{
    trigger OnRun()
    begin


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", 'OnBeforeSendEmail', '', true, true)]
    /// <summary> 
    /// Description for MyProcedure.
    /// </summary>
    /// <param name="TempEmailItem">Parameter of type Record "Email Item".</param>
    /// <param name="ReportUsage">Parameter of type Integer.</param>
    /// <param name="EmailSentSuccesfully">Parameter of type Boolean.</param>
    /// <param name="HideDialog">Parameter of type Boolean.</param>
    /// <param name="IsFromPostedDoc">Parameter of type Boolean.</param>
    /// <param name="IsHandled">Parameter of type Boolean.</param>
    /// <param name="PostedDocNo">Parameter of type Code[20].</param>
    local procedure MyProcedure(var TempEmailItem: Record "Email Item"; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var HideDialog: Boolean; var IsFromPostedDoc: Boolean; var IsHandled: Boolean; var PostedDocNo: Code[20])
    var
        reportselection: Record "Report Selections";
    begin
        if ReportUsage = reportselection.Usage::"S.Invoice".AsInteger() then
            ReportUsage := 50101;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Report Selections", 'OnBeforeSetReportLayout', '', true, true)]
    /// <summary> 
    /// Description for setreport.
    /// </summary>
    /// <param name="RecordVariant">Parameter of type Variant.</param>
    /// <param name="ReportUsage">Parameter of type Integer.</param>
    /// <param name="sender">Parameter of type Record "Report Selections".</param>
    local procedure setreport(RecordVariant: Variant; ReportUsage: Integer; sender: Record "Report Selections")
    begin
        ReportUsage := 50101;
        sender."Report ID" := 50101;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Report Selections", 'OnBeforeGetEmailBodyCustomer', '', true, true)]
    /// <summary> 
    /// Description for setreport.
    /// </summary>
    /// <param name="RecordVariant">Parameter of type Variant.</param>
    /// <param name="ReportUsage">Parameter of type Integer.</param>
    /// <param name="sender">Parameter of type Record "Report Selections".</param>
    local procedure setreport1(CustNo: Code[20]; RecordVariant: Variant; ReportUsage: Integer; var CustEmailAddress: Text[250]; var IsHandled: Boolean; var TempBodyReportSelections: Record "Report Selections")
    begin
        ReportUsage := 50101;
        TempBodyReportSelections.SetRange(Usage, TempBodyReportSelections.Usage::"S.Invoice");
        TempBodyReportSelections.SetRange(Sequence, '2');
        if TempBodyReportSelections.FindFirst() then;
        TempBodyReportSelections."Report ID" := 50101;
        TempBodyReportSelections.Modify();
    end;

}
