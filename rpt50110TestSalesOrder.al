report 50110 "Sales Order Report Test"
{

    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Sales Order Report Test.rdl';
    PreviewMode = PrintLayout;
    Caption = 'Sales Order Report';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            // DataItemTableView = where("Document Type" = const(Order));
            RequestFilterFields = "No.";

            column(No_; "No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Payment_Method_Code; "Payment Terms Code")
            {

            }
            column(Shipment_Method_Code; "Shipment Method Code")
            {

            }
            column(CustName; recCust.Name)
            {

            }
            column(CustAddress; CustAddress)
            {

            }
            column(PhoneNo; recCust."Phone No.")
            {

            }
            column(FaxNo; recCust."Fax No.")
            {

            }
            column(PoBoxNo; recCust."Post Code")
            {

            }
            column(CompPOBoxNo; recComp."Post Code")
            {

            }
            column(CompPhNo; recComp."Phone No.")
            {

            }
            column(CompFaxNo; recComp."Fax No.")
            {

            }
            column(CustTRN; CustTRN)
            {

            }
            column(CompAddress; CompAddress)
            {

            }
            column(CompName; recComp.Name)
            {

            }

            column(Currency_Code; "Currency Code")
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                //DataItemTableView = where("No." = filter(<> ''));
                column(Product; "No.")
                {

                }
                column(Sku; COPYSTR(Description, 1, 45))
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(IsImage; IsImage)
                {

                }
                column(Picture; recItem.Picture)
                {

                }
                column(VarPrice; VarPrice)
                {

                }
                column(VarTax; VarTax)
                {

                }
                column(VarSubTotal; VarSubTotal)
                {

                }
                column(VarGrandSubTotal; VarGrandSubTotal)
                {

                }
                column(VarTotalTax; VarTotalTax)
                {

                }
                column(TotalDiscAmount; TotalDiscAmount)
                {

                }
                column(VarGrandTotal; VarGrandTotal)
                {

                }
                column(AmountInWordFinal; AmountInWordFinal)
                {

                }
            }
        }
    }

    var
        recItem: Record Item;
        recCust: Record Customer;
        VarPrice: Decimal;
        VarQty: Decimal;
        VarSubTotal: Decimal;
        VarGrandTotal: Decimal;
        VarTax: Decimal;
        VarTotalTax: Decimal;
        CurrentItemNo: Code[20];
        VarGrandSubTotal: Decimal;
        CustAddress: Text[1024];
        recComp: Record "Company Information";
        CompAddress: Text[1024];
        CustTRN: Code[50];
        TotalDiscAmount: Decimal;
        repCheck: Report Check;
        AmountInWord: array[2] of Text[100];
        AmountInWordFinal: Text[200];
        LoopNo: Integer;
        TotalLines: Integer;
        InvDiscAmount: Decimal;
        recSLcount: Record "Sales Line";
        IsImage: Boolean;



}
