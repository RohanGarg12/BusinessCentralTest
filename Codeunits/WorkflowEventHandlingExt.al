codeunit 50101 "Workflow Event Handling Ext"
{

    trigger OnRun()
    begin

    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    /// <summary> 
    /// Description for OnAddWorkflowEventsToLibrary.
    /// </summary>
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobDocForApprovalCode, DATABASE::Job, 'Send Job Approval Document', 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJob, DATABASE::Job, 'An Approval Request for Job is cancelled', 0, FALSE);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowTableRelationsToLibrary', '', true, true)]

    /// <summary> 
    /// Description for OnAddWorkflowTableRelationsToLibrary.
    /// </summary>
    local procedure OnAddWorkflowTableRelationsToLibrary()
    var
        WorkFlowSetup: Codeunit "Workflow Setup";
    begin
        WorkFlowSetup.InsertTableRelation(DATABASE::"Job", 0, DATABASE::"Approval Entry", 22);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    /// <summary> 
    /// Description for OnAddWorkflowEventPredecessorsToLibrary.
    /// </summary>
    /// <param name="EventFunctionName">Parameter of type Code[128].</param>
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        CASE EventFunctionName OF
            RunWorkflowOnCancelJob:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelJob, RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode, RunWorkflowOnSendJobDocForApprovalCode);
            WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode:
                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode, RunWorkflowOnSendJobDocForApprovalCode);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgt Ext", 'OnSendJobForApproval', '', true, true)]

    /// <summary> 
    /// Description for RunWorkFlowOnSendJobForApproval.
    /// </summary>
    /// <param name="job">Parameter of type Record Job.</param>
    local procedure RunWorkFlowOnSendJobForApproval(var job: Record Job)
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendJobDocForApprovalCode, Job);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgt Ext", 'OnCancelJobApprovalRequest', '', true, true)]

    /// <summary> 
    /// Description for RunWorkFlowOnCancelJobForApproval.
    /// </summary>
    /// <param name="job">Parameter of type Record Job.</param>
    local procedure RunWorkFlowOnCancelJobForApproval(var job: Record Job)
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelJob, Job);
    end;

    /// <summary> 
    /// Description for RunWorkflowOnCancelJob.
    /// </summary>
    procedure RunWorkflowOnCancelJob() myCode: Code[128];
    begin
        EXIT(UPPERCASE('RunWorkflowOnCancelJob'));
    end;


    /// <summary> 
    /// Description for RunWorkflowOnSendJobDocForApprovalCode.
    /// </summary>
    procedure RunWorkflowOnSendJobDocForApprovalCode() myCode: Code[128];
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendJobDocForApproval'));
    end;


}