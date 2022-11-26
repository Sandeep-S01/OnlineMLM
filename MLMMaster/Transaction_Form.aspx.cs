using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

public partial class MLMMaster_Transaction_Form : System.Web.UI.Page
{
    int returnvalue = 0;
    DataTable dtAttributes = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Bind();
            UIServices.fill_ComboBox(ddlproduct, "select * from tblProductmaster where Status='UnBlock' Order by Product_Name", "Product_Name", "ID", "Select Product");
        }
    }

    public void Bind()
    {
        try
        {
            DataSet dt = new DataSet();
            dt = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, "Select * from Transactionform");
            repeater.DataSource = dt;
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



    protected void ddlproduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataSet dset = new DataSet();

            List<SqlParameter> param = new List<SqlParameter>();
            param.Add(new SqlParameter("@ID", ddlproduct.SelectedItem.Value.Trim()));
            
            string sqlstring = "select * from tblProductmaster where ID=@ID ";
            dset = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, sqlstring, param.ToArray());

            if (dset.Tables[0].Rows.Count > 0)
            {
                txtrate.Text = dset.Tables[0].Rows[0]["MRP"].ToString();
                
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;
        }
    }

    protected void txtqty_TextChanged(object sender, EventArgs e)
    {
        if (txtqty.Text == "")
        {
            txtqty.Text = "1";
        }
        double a = Convert.ToDouble(txtrate.Text);
        double b = Convert.ToDouble(txtqty.Text);
        //double labamttot = Convert.ToDouble(lbltotalamt);
        double c = 0;
        c = a * b;
        txttotal.Text = c.ToString();
        Double ta = 0;
        //for (c=0):
        //{
        //}
        ta += c;
        
        lbltotalamt.Text = ta.ToString();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string salesno = txtsalesno.Text.ToString().Trim();
            string soldto = ddlsoldto.SelectedItem.Text.ToString().Trim();
            //string sr = txtsrno.Text.ToString().Trim();
            //string product = ddlproduct.SelectedItem.Text.ToString().Trim();
            //string qty = txtqty.Text.ToString().Trim();
            //string rate = txtrate.Text.ToString().Trim();
            //string total = txttotal.Text.ToString();

            
            DataTable DT = new DataTable();
            DT = (DataTable)ViewState["dtAttributes"];
            if (DT != null)
            {
                DT.Columns.Remove("SrNo");
            }

            if (btnsubmit.Text == "Submit")
            {
                //string VersionNo = "1.0";

                string StatementType = "INSERT";
                string ID = "0";

                string consString = Security.ConnectionString();
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_inserttransaction"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@returnvalue", returnvalue);
                        cmd.Parameters.AddWithValue("@ID", ID);
                        cmd.Parameters.AddWithValue("@Sales_No", salesno);
                        cmd.Parameters.AddWithValue("@Sold_To", soldto);
                        //cmd.Parameters.AddWithValue("@Attribute", Attribute);

                        //cmd.Parameters.AddWithValue("@Attribute", ViewState["dtAttributes"].ToString());
                        cmd.Parameters.AddWithValue("@type_transaction", DT);
                        cmd.Parameters.AddWithValue("@StatementType", StatementType);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        cmd.Parameters[0].Direction = ParameterDirection.Output;

                        switch (returnvalue)
                        {
                            case 0:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Success',text: 'Sucsessfully Saved',type: 'success',styling: 'bootstrap3'});", true);
                                lblmsg.Text = "Data Inserted";
                                ClearFields(form1.Controls);
                                Bind();
                                break;

                            case 1:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: '',text: 'Already Exists.',type: 'info',styling: 'bootstrap3'});", true);

                                break;

                            default:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: 'Unexpected Error!',type: 'error',styling: 'bootstrap3'});", true);
                                break;
                        }

                    }
                }
            }
            else
            {
                string StatementType = "UPDATE";
                string consString = Security.ConnectionString();

                Decimal CurrentVersionNO = Convert.ToDecimal(ViewState["dtAttributes"]);
                Decimal No2 = Convert.ToDecimal("0.1");
                Decimal NewVerison = Decimal.Add(CurrentVersionNO, No2);


                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_inserttransaction"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@returnvalue", returnvalue);
                        cmd.Parameters.AddWithValue("@ID", ViewState["ID"]);
                        cmd.Parameters.AddWithValue("@Sales_No", salesno);
                        cmd.Parameters.AddWithValue("@Sold_To", soldto);
                        //cmd.Parameters.AddWithValue("@Attribute", Attribute);

                        //cmd.Parameters.AddWithValue("@VersionNo", NewVerison);
                        //cmd.Parameters.AddWithValue("@EmployeeName", ViewState["dtAttributes"].ToString());
                        cmd.Parameters.AddWithValue("@type_transaction", DT);
                        cmd.Parameters.AddWithValue("@StatementType", StatementType);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        cmd.Parameters[0].Direction = ParameterDirection.Output;

                        switch (returnvalue)
                        {
                            case 0:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Success',text: 'successfully Updated',type: 'success',styling: 'bootstrap3'});", true);
                                btnsubmit.Text = "SUBMIT";
                                ClearFields(form1.Controls);
                                break;

                            default:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: 'Unexpected Error!',type: 'error',styling: 'bootstrap3'});", true);
                                break;
                        }

                    }
                }
            }
            Bind();
            ClearFields(form1.Controls);
            Gridview1.DataSource = null;
            Gridview1.DataBind();
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
                String Sql = "select * from Transactionform where ID=@ID";
                dspatmst = SQLHelper.ExecuteDataset(Security.ConnectionString(), CommandType.Text, Sql, parameterss.ToArray());



                if (dspatmst.Tables[0].Rows.Count > 0)
                {
                    btnsubmit.Text = "UPDATE";

                    txtsalesno.Text = dspatmst.Tables[0].Rows[0]["Sales_No"].ToString();
                    ddlsoldto.SelectedItem.Text = dspatmst.Tables[0].Rows[0]["Sold_To"].ToString();
                    ddlproduct.SelectedItem.Text = dspatmst.Tables[0].Rows[0]["Product"].ToString();
                    txtqty.Text = dspatmst.Tables[0].Rows[0]["Qty"].ToString();
                    txtrate.Text = dspatmst.Tables[0].Rows[0]["Rate"].ToString();
                    txttotal.Text = dspatmst.Tables[0].Rows[0]["Total"].ToString();

                    Bind();
                }
            }
            if (CommandName == "UnBlock")
            {
                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "UnBlock"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_transactionblkunblk", parameterss.ToArray());
                Bind();

            }
            if (CommandName == "Block")
            {

                parameterss.Add(new SqlParameter("@StatementType", "UPDATE"));
                parameterss.Add(new SqlParameter("@Status", "Block"));
                SQLHelper.ExecuteScalar(Security.ConnectionString(), CommandType.StoredProcedure, "sp_transactionblkunblk", parameterss.ToArray());
                Bind();
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", "new PNotify({title: 'Error',text: '" + ex.ToString() + "',type: 'error',styling: 'bootstrap3'});", true);
            lblmsg.Text = ex.Message;
        }
    }

    protected void btnaddmore_Click(object sender, EventArgs e)
    {
        try
        {

            
            string Product = "";
            string Qty = "";
            string Rate = "";
            string Total = "";

            switch (btnaddmore.Text.ToString().Trim())
            {
                case "ADD":

                    
                    Product = ddlproduct.SelectedItem.Text.ToString().Trim();
                    Qty = txtqty.Text.ToString().Trim();
                    Rate = txtrate.Text.ToString().Trim();
                    Total = txttotal.Text.ToString().Trim();

                    if (Gridview1.Rows.Count == 0)
                    {
                        dtAttributes.Columns.AddRange(new DataColumn[] { new DataColumn("SrNo"), new DataColumn("Product"), new DataColumn("Qty"), new DataColumn("Rate"), new DataColumn("Total") });
                        ViewState["Sr.No"] = 1;
                        dtAttributes.Rows.Add(ViewState["Sr.No"].ToString().Trim(), Product, Qty, Rate, Total);
                        ViewState["dtAttributes"] = dtAttributes;
                        Gridview1.DataSource = dtAttributes;
                        Gridview1.DataBind();
                        //ClearFields(form1.Controls);
                    }
                    else
                    {
                        DataTable dtNew = new DataTable();
                        dtNew = (DataTable)ViewState["dtAttributes"];
                        int SrNo = 0;
                        if (btnaddmore.Text == "Update")
                        {
                            foreach (GridViewRow dr in Gridview1.Rows)
                            {
                                int.TryParse(dr.Cells[0].Text.ToString(), out SrNo);
                            }
                            SrNo++;
                        }
                        else
                        {
                            int.TryParse(ViewState["Sr.No"].ToString(), out SrNo);
                            SrNo++;
                        }

                        ViewState["Sr.No"] = SrNo.ToString();
                        dtNew.Rows.Add(ViewState["Sr.No"].ToString().Trim(), Product, Qty, Rate, Total);
                        ViewState["dtAttributes"] = dtNew;
                        Gridview1.DataSource = dtNew;
                        Gridview1.DataBind();
                    }
                    break;


                case "Update":
                    DataTable dtUpdate = new DataTable();
                    dtUpdate = (DataTable)ViewState["dtAttributes"];
                    DataRow row = dtUpdate.Select("SrNo='" + ViewState["Sr.No"].ToString().Trim() + "'").FirstOrDefault();

                    /*row[1] = ddlprodcatg.Text.ToString().Trim()*/
                    ;
                    row[1] = ddlproduct.SelectedItem.Text.ToString().Trim();
                    row[2] = txtqty.Text.ToString().Trim();
                    row[3] = txtrate.Text.ToString().Trim();
                    row[4] = txttotal.Text.ToString().Trim();
                    ViewState["dtAttributes"] = dtUpdate;
                    Gridview1.DataSource = dtUpdate;
                    Gridview1.DataBind();
                    btnaddmore.Text = "Add More";
                    //ClearFields(form1.Controls);
                    break;
            }
        }
        catch (Exception ex)
        {
            lblmsg.Text = ex.Message;

        }
    }

    protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;

        // Intitialize TableCell list
        List<TableCell> columns = new List<TableCell>();
        foreach (DataControlField column in Gridview1.Columns)
        {
            //e.Row.Cells[2].Visible = false;
            //Get the first Cell /Column
            TableCell cell = row.Cells[0];
            // Then Remove it after
            row.Cells.Remove(cell);
            //And Add it to the List Collections
            columns.Add(cell);
        }
        // Add cells
        row.Cells.AddRange(columns.ToArray());
    }

    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "D":
                DataTable dtNew = new DataTable();
                dtNew = (DataTable)ViewState["dtAttributes"];
                for (int i = dtNew.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = dtNew.Rows[i];
                    if (dr["SrNo"].ToString().Trim() == e.CommandArgument.ToString().Trim())
                    {
                        dr.Delete();
                    }
                }
                dtNew.AcceptChanges();
                Gridview1.DataSource = dtNew;
                Gridview1.DataBind();
                break;

            case "E":
                GridViewRow gvr;
                GridViewRow row;
                int RowIndex;

                gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                RowIndex = gvr.RowIndex;
                row = Gridview1.Rows[RowIndex];
                //txtsrno.Text = row.Cells[1].ToString().Trim();
                ddlproduct.SelectedItem.Value = row.Cells[1].Text.ToString().Trim();
                txtqty.Text = row.Cells[2].Text.ToString().Trim();
                txtrate.Text = row.Cells[3].Text.ToString().Trim();
                txttotal.Text = row.Cells[4].Text.ToString().Trim();
                ViewState["Sr.No"] = e.CommandArgument.ToString().Trim();
                btnaddmore.Text = "Update";
                break;
        }
    }

}

