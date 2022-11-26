<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductMaster.aspx.cs" Inherits="MLMMaster_ProductMaster" %>



<%@ Register Src="~/MLMMaster/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/MLMMaster/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/MLMMaster/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Product Master</title>
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../plugins/package/src/pnotify.css" rel="stylesheet" />
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
                                            <h3>Product Master</h3>
                                        </center>
                                        <hr />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        Product Name
                                    <asp:TextBox runat="server" ID="txtproductname" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV1" runat="server" Display="Dynamic" ControlToValidate="txtproductname"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtproductname" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z0-9\s]{2,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="col-md-6">
                                        Description
                                    <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtDesc"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtDesc" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-md-6">
                                        MRP
                                    <asp:TextBox runat="server" ID="txtmrp" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtmrp"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtmrp" ErrorMessage="InValidFormat" ValidationExpression="^[1-9][0-9]*$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="col-md-6">
                                        MOP
                                    <asp:TextBox runat="server" ID="txtmop" CssClass="form-control" OnTextChanged="txtmop_TextChanged" OnClick="valuecheck( false)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtmop"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtmop" ErrorMessage="InValidFormat" ValidationExpression="^[1-9][0-9]*$">
                                        </asp:RegularExpressionValidator>
                                        <asp:CompareValidator
                                            ID="cvEndYear2" Operator="LessThanEqual" runat="server" Type="Integer"
                                            ValidationGroup="me" ControlToValidate="txtmop" Display="Dynamic" ForeColor="Red" CssClass=" font-weight-bold"
                                            ControlToCompare="txtmrp" ErrorMessage=" Mop is less then Mrp" SetFocusOnError="true">
                                        </asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-md-6">
                                        Vendor
                                    <asp:DropDownList runat="server" ID="ddlvendor" CssClass="form-control">
                                    </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="ddlvendor" InitialValue="0"
                                         ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>--%>
                                    </div>

                                    <div class="col-md-6">
                                        Margin
                                    <asp:TextBox runat="server" ID="txtmargin" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ControlToValidate="txtmargin"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtmargin" ErrorMessage="InValidFormat" ValidationExpression="^[1-9][0-9]*$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>

                                <br />
                                <div align="">
                                    <asp:Button runat="server" ID="btnsubmit" Text="Submit" CssClass="btn btn-primary" OnClick="btnsubmit_Click" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Please wait...';"
                                        UseSubmitBehavior="false" />
                                    <asp:Label runat="server" ID="lblmsg" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div>
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>MRP</th>
                                        <th>MOP</th>
                                        <th>Vendor</th>
                                        <th>Margin</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                        <th>Block/UnBlock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="repeater" OnItemCommand="repeater_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Product_Name") %></td>
                                                <td><%#Eval("Description") %></td>
                                                <td><%#Eval("MRP") %></td>
                                                <td><%#Eval("MOP") %></td>
                                                <td><%#Eval("Vendor") %></td>
                                                <td><%#Eval("Margin") %></td>
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
        </div>

        <script>


</script>



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
