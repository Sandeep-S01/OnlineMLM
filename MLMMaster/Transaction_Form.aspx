<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transaction_Form.aspx.cs" Inherits="MLMMaster_Transaction_Form" %>


<%@ Register Src="~/MLMMaster/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/MLMMaster/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/MLMMaster/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Transaction Form</title>
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../plugins/package/dist/pnotify.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <uc1:Menu runat="server" ID="Menu1" />

            <div class="content-wrapper">
                <div class="row p-3">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h3>Transaction Form</h3>
                                        </center>
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        Sales No
                                    <asp:TextBox runat="server" ID="txtsalesno" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV1" runat="server" Display="Dynamic" ControlToValidate="txtsalesno"
                                            ErrorMessage="*Required" ValidationGroup="me"  ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="ddlresellerlist" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>
                                
                                    <div class="col-md-6">
                                        Sold To
                                    <asp:DropDownList runat="server" ID="ddlsoldto" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Me"></asp:ListItem>
                                    </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="ddlsoldto"
                                            ErrorMessage="*Required" ValidationGroup="me" InitialValue="0" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtvendorname" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                <br />

                                <div class="row" align="">
                                    <div class="col-md-12">
                                        <table align="">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Qty</th>
                                                    <th>Rate</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList runat="server" ID="ddlproduct" CssClass="form-control" Width="200px" OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="ddlproduct" 
                                            ErrorMessage="*Required" ValidationGroup="me" InitialValue="0" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        

                                                    </td>
                                                    <td>
                                                        
                                                        <asp:TextBox runat="server" ID="txtqty" AutoPostBack="true" CssClass="form-control" Width="150px" OnTextChanged="txtqty_TextChanged"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="txtqty" 
                                            ErrorMessage="*Required" ValidationGroup="me"  ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtrate" CssClass="form-control" Width="150px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txttotal" CssClass="form-control" Width="150px"></asp:TextBox></td>
                                                    <td>
                                                        <asp:Button runat="server" ID="btnaddmore" CssClass="form-control btn btn-primary" Text="ADD" OnClick="btnaddmore_Click"></asp:Button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div>
                                            <asp:GridView runat="server" ID="Gridview1" CssClass="table table-bordered" AutoGenerateColumns="true" OnRowCreated="Gridview1_RowCreated" OnRowCommand="Gridview1_RowCommand" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("SrNo") %>'
                                                                CommandName="E" CausesValidation="false"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblDelete" runat="server" OnClientClick="return confirm('Are you sure want to delete?')"
                                                                Text="Delete" CommandArgument='<%# Eval("SrNo") %>' CommandName="D" CausesValidation="false">
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <%--<asp:TextBox runat="server" ID="TextBox1" CssClass=""></asp:TextBox>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="ddlsoldto"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtvendorname" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label runat="server" ID="lblpaynow">Pay Now(PG) : </asp:Label>
                                                <asp:Label runat="server" ID="lblpayvalue" CssClass="ml-2 font-weight-bold">0</asp:Label>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label runat="server" ID="Label2">Wallet : </asp:Label>
                                                <asp:Label runat="server" ID="lblwallet" CssClass="ml-2 font-weight-bold">0</asp:Label>
                                            </div>

                                            <div class="col-md-3">
                                                <asp:Label runat="server" ID="btntotal" Text="Total : " CssClass="" />
                                                <asp:Label runat="server" ID="lbltotalamt" CssClass="ml-2 font-weight-bold"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div align="">
                                    <asp:Button runat="server" ID="btnsubmit" Text="Submit" CssClass="btn btn-primary" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Please wait...';"
                                        UseSubmitBehavior="false" OnClick="btnsubmit_Click" />
                                    <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
                                </div>

                            </div>
                        </div>
                        <div>
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>Sales No</th>
                                        <th>Sold To</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                        <th>Block/UnBlock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="repeater" OnItemCommand="repeater_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Sales_No") %></td>
                                                <td><%#Eval("Sold_To") %></td>
                                                <td><%#Eval("Status") %></td>
                                                <td>
                                                    <asp:LinkButton runat="server" ID="lbtedit" CommandArgument='<%#Eval("ID") %>' CommandName="EditRow" Text="Edit" CausesValidation="false" CssClass=""></asp:LinkButton></td>
                                                <td>
                                                    <asp:LinkButton ID="Inkbu" runat="server" CausesValidation="false" Text='<%#Eval("Status").ToString().Equals("UnBlock")? "Block":"UnBlock"%>'
                                                        CommandName='<%#Eval("Status").ToString().Equals("UnBlock")? "Block":"UnBlock"%>'
                                                        CommandArgument='<%#Eval("ID") %>'></asp:LinkButton></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- jQuery -->
            <script src="../plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap 4 -->
            <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

            <script src="../Bootstrap/js/bootstrap.js"></script>
            <!-- PNotify 3.2.1 -->
            <script src="../plugins/package/dist/pnotify.js"></script>
            <script src="../plugins/package/dist/pnotify.buttons.js"></script>
            <script src="../plugins/package/dist/pnotify.nonblock.js"></script>
    </form>
    <uc1:Footer runat="server" id="Footer" />
</body>
</html>
