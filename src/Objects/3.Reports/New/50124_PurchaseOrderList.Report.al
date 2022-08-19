report 50124 "New Purchase Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Objects/3.Reports/New/PurchaseListReport.rdlc';
    ApplicationArea = Reservation;
    Caption = 'New Purchase List Report';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(DataItemPurchaseHeader; "Purchase Header")
        {
            column(No_; "No.")
            {

            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Status; Status)
            {

            }
            column(Amount; Amount)
            {

            }

            column(Pay_to_Name; "Pay-to Name")
            {

            }

            trigger OnPreDataItem()
            begin
                if (FromDate > 0D) AND (ToDate > 0D) then begin
                    SetRange("Document Date", FromDate, ToDate);
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
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
                        trigger OnValidate()
                        var
                            txt001: Label 'TO DATE cannot be less then from Date';
                        begin
                            if (ToDate < FromDate) then begin
                                Error(txt001);
                            end;
                        end;
                    }

                }
            }
        }

    }

    var
        FromDate: Date;
        ToDate: Date;
}