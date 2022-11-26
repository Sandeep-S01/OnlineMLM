using DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.ServiceModel.Channels;

public partial class MLMMaster_ProductMaster : System.Web.UI.Page
{
    int returnvalue = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Bind();
            UIServices.fill_ComboBox(ddlvendor, "Select * from tblVendor where Status = 'UnBlock' Order by Vendor_Name", "Vendor_Name", "ID", "Select Vendor");
        }
    }

    public void Bind()
    {
        try
        {
            DataSet dsWarehousemst = new DataSet();
            dsWarehousemst = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, "Select * from tblProductmaster");
            repeater.DataSource = dsWarehousemst;
            repeater.DataBind();
        }
        catch (Exception ex)
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
            string productname = txtproductname.Text.ToString().Trim();
            string description = txtDesc.Text.ToString().Trim();
            string mrp = txtmrp.Text.ToString().Trim();

            string mop = txtmop.Text.ToString().Trim();
            string vendor = ddlvendor.SelectedItem.Text.ToString().Trim();
            string margin = txtmargin.Text.ToString().Trim();



            List<SqlParameter> sqlparm = new List<SqlParameter>();
            sqlparm.Add(new SqlParameter("@returnvalue", returnvalue));
            sqlparm.Add(new SqlParameter("@Product_Name", productname));
            sqlparm.Add(new SqlParameter("@Description", description));
            sqlparm.Add(new SqlParameter("@MRP", mrp));
            sqlparm.Add(new SqlParameter("@MOP", mop));
            sqlparm.Add(new SqlParameter("@Vendor", vendor));
            sqlparm.Add(new SqlParameter("@Margin", margin));
            sqlparm[0].Direction = ParameterDirection.Output;

            if (btnsubmit.Text == "Submit")
            {
                //double a, b;
                //double.TryParse(mrp, out a);
                //double.TryParse(mop, out b);
                //if (b <= a)
                //{
                //    lblmsg.Text = "mop is less then mrp";
                //    //Message("Mop is less then mrp");

                //    txtmop.Text = "";
                //    txtmop.Focus();
                //}
                //else
                //{
                //    mop = b.ToString();
                //}


                sqlparm.Add(new SqlParameter("@ID", ""));
                sqlparm.Add(new SqlParameter("@StatementType", "INSERT"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_Productmaster", sqlparm.ToArray());
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
                sqlparm.Add(new SqlParameter("@ID", ViewState["ID"]));
                sqlparm.Add(new SqlParameter("@StatementType", "UPDATE"));

                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_Productmaster", sqlparm.ToArray());
                int.TryParse(sqlparm[0].Value.ToString(), out returnvalue);
                switch (returnvalue)
                {
                    case 0:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Updated Successfully.',type: 'info',styling: 'bootstrap3'});", true);
                        ClearFields(Form.Controls);
                        lblmsg.Text = "Data Updated Successfully";
                        btnsubmit.Text = "SUBMIT";
                        Bind();
                        break;

                    case 1:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Alert*',text: 'Data Already Exists.',type: 'info',styling: 'bootstrap3'});", true);
                        lblmsg.Text = "*Data allready available";
                        ClearFields(Form.Controls);
                        break;

                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: 'Unexpected Error!',type: 'error',styling: 'bootstrap3'});", true);
                        btnsubmit.Text = "Submit";
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
                String Sql = "select * from tblProductmaster where ID=@ID";
                dspatmst = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, Sql, parameterss.ToArray());



                if (dspatmst.Tables[0].Rows.Count > 0)
                {
                    btnsubmit.Text = "UPDATE";

                    txtproductname.Text = dspatmst.Tables[0].Rows[0]["Product_Name"].ToString();
                    txtDesc.Text = dspatmst.Tables[0].Rows[0]["Description"].ToString();
                    txtmrp.Text = dspatmst.Tables[0].Rows[0]["MRP"].ToString();
                    txtmop.Text = dspatmst.Tables[0].Rows[0]["MOP"].ToString();
                    ddlvendor.SelectedItem.Text = dspatmst.Tables[0].Rows[0]["Vendor"].ToString();
                    txtmargin.Text = dspatmst.Tables[0].Rows[0]["Margin"].ToString();

                    Bind();
                }
            }
            if (CommandName == "UnBlock")
            {
                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "UnBlock"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_productblkunblk", parameterss.ToArray());
                Bind();

            }
            if (CommandName == "Block")
            {

                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "Block"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_productblkunblk", parameterss.ToArray());
                Bind();
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: '" + ex.ToString() + "',type: 'error',styling: 'bootstrap3'});", true);
            lblmsg.Text = ex.Message;
        }
    }

    protected void txtmop_TextChanged(object sender, EventArgs e)
    {
        //double a1, b1;
        //double.TryParse(txtmrp.Text, out a1);
        //double.TryParse(txtmop.Text, out b1);
        //if (b1 < a1)
        //{
        //    txtmop.Text = b1.ToString("R");
        //}

    }
}