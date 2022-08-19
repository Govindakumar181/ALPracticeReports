pageextension 50121 SalesExtension extends "Sales Order List"
{

    actions
    {
        addfirst(navigation)
        {
            action(NewSalesReport)
            {
                ApplicationArea = All;
                Caption = 'New Sales Report';
                ToolTip = 'Shows New Sales Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "New Sales Report";
            }
        }
    }
}

