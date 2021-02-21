codeunit 50102 WorkflowResponseHandling
{
    trigger OnRun()
    begin

    end;

    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandling: Codeunit "Workflow Event Handling Ext";


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    /// <summary> 
    /// Description for OnAddWorkflowResponsePredecessorsToLibrary.
    /// </summary>
    /// <param name="ResponseFunctionName">Parameter of type Code[128].</param>
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    begin
        CASE ResponseFunctionName OF
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowResponseHandling.CreateApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CreateApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelJob);
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelJob);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    /// <summary> 
    /// Description for OnReleaseDocument.
    /// </summary>
    /// <param name="RecRef">Parameter of type RecordRef.</param>
    /// <param name="Handled">Parameter of type Boolean.</param>
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Job: Record Job;
    begin
        case RecRef.Number of
            DATABASE::"job":
                begin
                    RecRef.SetTable(Job);
                    if Job."No." <> '' then BEGIN
                        IF Job.Status = Job.Status::Completed THEN
                            EXIT;
                        Job.Status := Job.Status::Completed;
                        Job.MODIFY(TRUE);
                    END;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]

    /// <summary> 
    /// Description for OnOpenDocument.
    /// </summary>
    /// <param name="RecRef">Parameter of type RecordRef.</param>
    /// <param name="Handled">Parameter of type Boolean.</param>
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Job: Record Job;
    begin
        case RecRef.Number of
            DATABASE::"job":
                begin
                    RecRef.SetTable(Job);
                    if Job."No." <> '' then BEGIN
                        IF Job.Status = Job.Status::Open THEN
                            EXIT;
                        Job.Status := Job.Status::Open;
                        Job.MODIFY(TRUE);
                    END;
                    Handled := true;
                end;
        end;
    end;

}