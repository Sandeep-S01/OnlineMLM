<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResellerMaster.aspx.cs" Inherits="MLMMaster_ResellerMaster" %>


<%@ Register Src="~/MLMMaster/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/MLMMaster/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/MLMMaster/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <uc1:Header runat="server" ID="Header" />
    <title>Reseller</title>
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
                                            <h3>Reseller</h3>
                                        </center>
                                        <hr />
                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-md-4">
                                        Company Name
                                    <asp:TextBox runat="server" ID="txtcompanyname" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV1" runat="server" Display="Dynamic" ControlToValidate="txtcompanyname"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtcompanyname" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="col-md-4">
                                        Contact Person
                                    <asp:TextBox runat="server" ID="txtcontper" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtcontper"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtcontper" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-md-4">
                                        Company Type
                                    <asp:TextBox runat="server" ID="txtcomptype" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtcomptype"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtcomptype" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row mt-2">

                                    <div class="col-md-6">
                                        Address Line 1
                                    <asp:TextBox runat="server" ID="txtaddress1" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ControlToValidate="txtaddress1"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtaddress1" ErrorMessage="InValidFormat" ValidationExpression="^(\\d{1,}) [a-zA-Z0-9\\s]+(\\,)? [a-zA-Z]+(\\,)? [A-Z]{2} [0-9]{5,6}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>

                                    <div class="col-md-6">
                                        Address Line 2
                                    <asp:TextBox runat="server" ID="txtaddress2" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtaddress2"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtaddress2" ErrorMessage="InValidFormat" ValidationExpression="^(\\d{1,}) [a-zA-Z0-9\\s]+(\\,)? [a-zA-Z]+(\\,)? [A-Z]{2} [0-9]{5,6}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-3">
                                        City
                                    <asp:DropDownList runat="server" ID="ddlcity" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                    </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="ddlcity"
                                            ErrorMessage="*Required" ValidationGroup="me" InitialValue="0" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic"
                                        CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="ddlcity" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
                                    </div>

                                    <div class="col-md-4">
                                        Mobile.No
                                    <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ControlToValidate="txtmobile"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtmobile" ErrorMessage="InValidFormat" ValidationExpression="(|0|91)?[6-9][0-9]{9}">
                                        </asp:RegularExpressionValidator>
                                    </div>

                                    <div class="col-md-5">
                                        Email Address
                                    <asp:TextBox runat="server" ID="txtemail" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ControlToValidate="txtemail"
                                            ErrorMessage="*Required" ValidationGroup="me" ForeColor="Red" CssClass="font-weight-bold"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="InValidFormat" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$">
                                        </asp:RegularExpressionValidator>
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
                             <div>
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>Company Name</th>
                                        <th>Contact Person</th>
                                        <th>Company Type</th>
                                        <th>City</th>
                                        <th>Mobile</th>                                        
                                        <th>Email</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                        <th>Block/UnBlock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="repeater" OnItemCommand="repeater_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Company_Name") %></td>
                                                <td><%#Eval("Contact_Person") %></td>
                                                <td><%#Eval("Company_Type") %></td>
                                                <td><%#Eval("City") %></td>
                                                <td><%#Eval("Mobile") %></td>
                                                <td><%#Eval("Email") %></td>
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
