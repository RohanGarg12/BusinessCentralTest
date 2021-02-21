codeunit 50100 "Approval Mgt Ext"
{
    var
        NoWorkflowEnabledErr: TextConst ENU = 'This record is not supported by related approval workflow.';
        as: Codeunit "Email Account";

    [IntegrationEvent(true, false)]
    /// <summary> 
    /// Description for OnSendJobForApproval.
    /// </summary>
    /// <param name="Job">Parameter of type Record Job.</param>
    procedure OnSendJobForApproval(var Job: Record Job)
    begin
    end;

    [IntegrationEvent(true, false)]
    /// <summary> 
    /// Description for OnCancelJobApprovalRequest.
    /// </summary>
    /// <param name="Job">Parameter of type Record Job.</param>
    procedure OnCancelJobApprovalRequest(var Job: Record Job)
    begin

    end;

    /// <summary> 
    /// Description for CheckJobApprovalsWorkflowEnabled.
    /// </summary>
    /// <param name="Job">Parameter of type Record Job.</param>
    /// <returns>Return variable "Boolean".</returns>
    procedure CheckJobApprovalsWorkflowEnabled(var Job: Record Job): Boolean

    begin
        IF NOT IsJobApprovalsWorkflowEnabled(Job) THEN
            ERROR(NoWorkflowEnabledErr);

        EXIT(TRUE);
    end;

    /// <summary> 
    /// Description for IsJobApprovalsWorkflowEnabled.
    /// </summary>
    /// <param name="Job">Parameter of type Record Job.</param>
    /// <returns>Return variable "Boolean".</returns>
    procedure IsJobApprovalsWorkflowEnabled(var Job: Record Job): Boolean
    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling Ext";

    begin
        EXIT(WorkflowManagement.CanExecuteWorkflow(Job, WorkflowEventHandling.RunWorkflowOnSendJobDocForApprovalCode));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    /// <summary> 
    /// Description for PopulateApprovalEntryArgument.
    /// </summary>
    /// <param name="RecRef">Parameter of type RecordRef.</param>
    /// <param name="WorkflowStepInstance">Parameter of type Record "Workflow Step Instance".</param>
    /// <param name="ApprovalEntryArgument">Parameter of type Record "Approval Entry".</param>
    local procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        RecJob: Record Job;
    begin
        case RecRef.Number of
            DATABASE::"Job":
                begin
                    RecRef.SetTable(RecJob);

                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
                    ApprovalEntryArgument."Document No." := RecJob."No.";
                    ApprovalEntryArgument.Amount := RecJob."Applied Sales G/L Amount";
                    ApprovalEntryArgument."Currency Code" := RecJob."Currency Code";
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]

    /// <summary> 
    /// Description for SetStatusToPendingApproval.
    /// </summary>
    /// <param name="RecRef">Parameter of type RecordRef.</param>
    /// <param name="Variant">Parameter of type Variant.</param>
    /// <param name="IsHandled">Parameter of type Boolean.</param>
    local procedure SetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        RecJob: Record Job;
    begin
        case RecRef.Number of
            DATABASE::"Job":
                begin
                    RecRef.SetTable(RecJob);
                    RecJob.Validate(Status, RecJob.Status::Planning);
                    RecJob.Modify(true);
                    Variant := RecJob;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeShowCommonApprovalStatus', '', true, true)]

    /// <summary> 
    /// Description for InformUserOnStatusChange.
    /// </summary>
    /// <param name="RecRef">Parameter of type RecordRef.</param>
    /// <param name="IsHandle">Parameter of type Boolean.</param>
    local procedure InformUserOnStatusChange(var RecRef: RecordRef; var IsHandle: Boolean)
    var
        RecJob: Record Job;
    begin
        case RecRef.Number of
            DATABASE::"Job":
                begin
                    RecRef.SetTable(RecJob);
                    if RecJob.Status::Open = RecJob.Status then
                        Message('Status has been change to Open')
                    else
                        if RecJob.Status::Completed = RecJob.Status then
                            Message('Status has been change to Completed')
                        else
                            if RecJob.Status::Planning = RecJob.Status then
                                Message('Status has been change to planning')
                            else
                                if RecJob.Status::Quote = RecJob.Status then
                                    Message('Status has been change to Quote');
                    IsHandle := true;

                end;

        End;
    end;



}
