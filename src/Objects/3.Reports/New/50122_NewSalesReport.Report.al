report 50122 "New Sales Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Objects/3.Reports/New/NewSalesReport.rdlc';
    ApplicationArea = Reservation;
    Caption = 'New Sales Report';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            column(No_SalesLine; "No.")
            {
                IncludeCaption = true;
            }
            column(Description_SalesLine; Description)
            {
                IncludeCaption = true;
            }
            column(ShpmtDt__SalesLine; Format("Shipment Date"))
            {
            }
            column(Reserve__SalesLine; Reserve)
            {
                IncludeCaption = true;
            }

            column(OutstdngQtyBase_SalesLine; "Outstanding Qty. (Base)")
            {
                IncludeCaption = true;
            }
            column(ResrvdQtyBase_SalesLine; "Reserved Qty. (Base)")
            {
                IncludeCaption = true;
            }


            trigger OnPreDataItem()

            begin
                If (FromDate > 0D) and (ToDate > 0D) then begin
                    SetRange("Shipment Date", FromDate, ToDate);
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("From Date"; FromDate)
                    {
                        ApplicationArea = All;
                        NotBlank = true;
                    }
                    field("To Date"; ToDate)
                    {
                        ApplicationArea = ALL;
                        NotBlank = true;
                    }

                }
            }

        }
    }

    var
        FromDate: Date;
        ToDate: Date;
}
