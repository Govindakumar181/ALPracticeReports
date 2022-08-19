pageextension 50122 PurchaseExtension extends "Purchase Order List"
{

    actions
    {
        // Add changes to page actions here
        addfirst(navigation)
        {
            action(NewPurchaseOrderList)
            {
                ApplicationArea = All;
                Caption = 'Purchase Order Report';
                ToolTip = 'Shows New Purchase Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "New Purchase Report";
            }
        }
    }


}