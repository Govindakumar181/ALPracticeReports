report 50123 QuerySalesReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Objects/3.Reports/New/NewSalesQueryReport.rdlc';

    dataset
    {
        dataitem(Integer; Integer)
        {
            column(CustomerName; salesDashBoard.CustomerName)
            {

            }
            column(City; salesDashBoard.City)
            {

            }
            column(Posting_Date; salesDashBoard.Posting_Date)
            {

            }

            trigger OnPreDataItem()
            begin
                salesDashBoard.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not salesDashBoard.Read() then
                    CurrReport.Break();
            end;
        }
    }






    var
        salesDashBoard: Query "Sales Dashboard";
}