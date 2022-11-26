using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

public partial class MLMMaster_Remapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            UIServices.fill_ComboBox(ddlresellerlist, "Select * from tblResellermaster where Status='UnBlock' Order by Company_Name", "Company_Name", "ID", "Select Reseller");
            UIServices.fill_ComboBox(ddlnewmap, "Select * from tblResellermaster where Status='UnBlock' Order by Company_Name", "Company_Name", "ID", "Select Reseller");
        }
    }
}