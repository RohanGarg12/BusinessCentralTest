page 50149 JSImage
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Data Exch.";

    layout
    {
        area(Content)
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
                        // Ready := true;
                        CurrPage.HTMLMAP.CallMAPProd(PortCode);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    procedure SetPortNo(port: text)
    var
        myInt: Integer;
    begin
        PortCode := port;
    end;

    var
        PortCode: text;
}