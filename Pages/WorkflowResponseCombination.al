page 50105 MyPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "WF Event/Response Combination";

    layout
    {
        area(Content)
        {
            repeater(Events)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = All;
                }

                field("Predecessor Type"; Rec."Predecessor Type")
                {
                    ApplicationArea = All;

                }

                field("Predecessor Function Name"; Rec."Predecessor Function Name")
                {
                    ApplicationArea = All;

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

    var
        myInt: Integer;
}