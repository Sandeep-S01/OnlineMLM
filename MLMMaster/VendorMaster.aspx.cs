using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

public partial class MLMMaster_VendorMaster : System.Web.UI.Page
{
    int returnvalue = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Bind();
        }
    }

    public void Bind()
    {
        try
        {
            DataSet dt = new DataSet();
            dt = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, "Select * from tblVendor");
            repeater.DataSource= dt;
            repeater.DataBind();
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: '" + ex.ToString() + "',type: 'error',styling: 'bootstrap3'});", true);
            lblmsg.Text = ex.Message;
        }
    }

    public static void ClearFields(ControlCollection pageControls)
    {
        foreach (Control contl in pageControls)
        {
            string strCntName = (contl.GetType()).Name;
            switch (strCntName)
            {
                case "TextBox":
                    TextBox tbSource = (TextBox)contl;
                    tbSource.Text = "";
                    break;

                case "DropDownList":
                    DropDownList ddlSource = (DropDownList)contl;
                    ddlSource.SelectedIndex = -1;
                    break;
                case "ListBox":
                    ListBox lbsource = (ListBox)contl;
                    lbsource.SelectedIndex = -1;
                    break;
            }
            ClearFields(contl.Controls);
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string vendor = txtvendorname.Text.ToString().Trim();

            List<SqlParameter> sqlparm = new List<SqlParameter>();
            sqlparm.Add(new SqlParameter("@returnvalue", returnvalue));
            sqlparm.Add(new SqlParameter("@Vendor_Name", vendor));
            sqlparm[0].Direction = ParameterDirection.Output;
            if (btnsubmit.Text == "Submit")
            {
                sqlparm.Add(new SqlParameter("ID", ""));
                sqlparm.Add(new SqlParameter("@StatementType", "INSERT"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_Vendormaster", sqlparm.ToArray());
                int.TryParse(sqlparm[0].Value.ToString(), out returnvalue);
                switch (returnvalue)
                {
                    case 0:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Inserted Successfully.',type: 'info',styling: 'bootstrap3'});", true);
                        Bind();
                        ClearFields(Form.Controls);
                        break;

                    case 1:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Already Exists.',type: 'info',styling: 'bootstrap3'});", true);
                        lblmsg.Text = "Data Already Available";
                        Bind();
                        ClearFields(Form.Controls);
                        break;

                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: 'Unexpected Error!',type: 'error',styling: 'bootstrap3'});", true);
                        break;
                }
            }
            else
            {
                sqlparm.Add(new SqlParameter("ID", ViewState["ID"]));
                sqlparm.Add(new SqlParameter("@StatementType", "UPDATE"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_Vendormaster", sqlparm.ToArray());
                int.TryParse(sqlparm[0].Value.ToString(), out returnvalue);
                switch (returnvalue)
                {
                    case 0:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Updated Successfully.',type: 'info',styling: 'bootstrap3'});", true);
                        Bind();
                        ClearFields(Form.Controls);
                        break;

                    case 1:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Already Exists.',type: 'info',styling: 'bootstrap3'});", true);
                        lblmsg.Text = "Data Already Available";
                        Bind();
                        ClearFields(Form.Controls);
                        break;

                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: 'Unexpected Error!',type: 'error',styling: 'bootstrap3'});", true);
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: '" + ex.ToString() + "',type: 'error',styling: 'bootstrap3'});", true);
            lblmsg.Text = ex.Message;
        }
    }

    protected void repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            string CommandName = e.CommandName.ToString();
            string ID = e.CommandArgument.ToString();

            ViewState["ID"] = ID;
            List<SqlParameter> parameterss = new List<SqlParameter>();
            parameterss.Add(new SqlParameter("@ID", ViewState["ID"].ToString()));

            if (CommandName == "EditRow")
            {
                DataSet dspatmst = new DataSet();
                String Sql = "select * from tblVendor where ID=@ID";
                dspatmst = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, Sql, parameterss.ToArray());



                if (dspatmst.Tables[0].Rows.Count > 0)
                {
                    btnsubmit.Text = "UPDATE";

                    txtvendorname.Text = dspatmst.Tables[0].Rows[0]["Vendor_Name"].ToString();
                    
                    Bind();
                }
            }
            if (CommandName == "UnBlock")
            {
                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "UnBlock"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_vendorblkunblk", parameterss.ToArray());
                Bind();

            }
            if (CommandName == "Block")
            {

                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "Block"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_vendorblkunblk", parameterss.ToArray());
                Bind();
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: '" + ex.ToString() + "',type: 'error',styling: 'bootstrap3'});", true);
            lblmsg.Text = ex.Message;
        }
    }


}