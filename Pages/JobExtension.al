pageextension 50106 Job extends "Job Card"
{

    /*layout
    {
        addafter(General)
        {
            group(UserControlGroup)
            {
                Caption = 'Javascript color';

                usercontrol("HTMLMAP"; MAPEmbed)
                {
                    ApplicationArea = all;

                    trigger OnStartup()
                    var
                    begin
                        Ready := true;
                        CurrPage.HTMLMAP.CallMAPProd(Rec.Description);
                    end;
                }
            }
        }
    }
*/

    actions
    {
        addafter("&Copy")
        {
            /*action("Generate Port ")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedOnly = true;
                trigger OnAction()
                var
                // ApprovalMgt: Codeunit "Approval Mgt Ext";
                begin

                    CurrPage.HTMLMAP.CallMAPProd(Rec.Description);
                    CurrPage.Update();

                end;

            }*/
            action("Generate Port1 ")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedOnly = true;
                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit "Approval Mgt Ext";
                    JSimage: Page JSImage;
                begin
                    // JSimage.SetPortNo(Rec.Description);
                    JSimage.Run();
                    // CurrPage.HTMLMAP.CallMAPProd(Rec.Description);
                    //    / CurrPage.Update();

                end;

            }
            action("JSON test")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedOnly = true;
                trigger OnAction()
                var
                    DHLP: Codeunit "DHLP Integeration";

                begin
                    // JSimage.SetPortNo(Rec.Description);
                    DHLP.Run();
                    // CurrPage.HTMLMAP.CallMAPProd(Rec.Description);
                    //    / CurrPage.Update();

                end;

            }

            action("Send Doc For Approval")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approval Mgt Ext";
                begin
                    IF ApprovalMgt.CheckJobApprovalsWorkflowEnabled(Rec) THEN
                        ApprovalMgt.OnSendJobForApproval(Rec);
                end;
            }

            action("Cancel Doc For Approval")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approval Mgt Ext";
                begin
                    ApprovalMgt.OnCancelJobApprovalRequest(Rec);
                end;
            }

            action(SendMail)
            {
                Caption = 'Send Mail';
                ApplicationArea = all;
                trigger OnAction()
                var
                    OutS: OutStream;
                    InS: InStream;
                    B: Codeunit "Temp Blob";
                    Ref: RecordRef;
                    FRef: FieldRef;
                    Mail: Codeunit "SMTP Mail";

                    Recipients: List of [Text];
                    Body: Text;
                    recCust: Record Customer;
                    Recipient: Text[100];
                begin
                    B.CreateOutStream(OutS);
                    Ref.OPEN(DATABASE::"Sales Invoice Header");
                    Fref := Ref.Field(3);
                    //Fref.Setrange(Rec."No.");
                    Fref.Setrange('103234');
                    Report.SaveAs(50101, '', ReportFormat::Html, OutS, Ref);

                    B.CreateInStream(InS);
                    InS.ReadText(Body);
                    B.CreateInStream(InS);
                    InS.ReadText(Body);
                    Mail.AddAttachmentStream(InS, 'zakir.pdf');
                    Body := Body.Replace('%%%%HOMEPAGE%%%%', '<a href="https://' + 'WWW.google.com' + '">Homepage</a>');
                    //Recipients.add('zakirwarsi09@gmail.com');
                    Mail.CreateMessage('ROhan', 'rohan.garg@mindshell.info', 'rohangrg110@gmail.com', '', Body, true);
                    Mail.Send();
                end;
            }
            action(SaveFile)
            {
                Caption = 'Save File';
                ApplicationArea = all;
                trigger OnAction()
                var
                    OutS: OutStream;
                    InS: InStream;
                    B: Codeunit "Temp Blob";
                    Ref: RecordRef;
                    FRef: FieldRef;
                    Mail: Codeunit "SMTP Mail";

                    Recipients: List of [Text];
                    Body: Text;
                    recCust: Record Customer;
                    Recipient: Text[100];
                begin
                    B.CreateOutStream(OutS);
                    Ref.OPEN(DATABASE::"Sales Invoice Header");
                    Fref := Ref.Field(3);
                    //Fref.Setrange(Rec."No.");
                    Fref.Setrange('103234');
                    Report.SaveAs(50101, '', ReportFormat::Pdf, OutS, Ref);

                end;
            }
            action("SEND MAIL")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Mail: Codeunit SendMail;
                begin
                    Mail.Email();
                end;
            }
        }

    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        //  Message('hi');
    end;

    var
        myInt: Integer;
        Ready: boolean;
}