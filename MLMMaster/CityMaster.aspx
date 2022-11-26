<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityMaster.aspx.cs" Inherits="MLMMaster_CityMaster" %>

<%@ Register Src="~/MLMMaster/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/MLMMaster/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/MLMMaster/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <uc1:Header runat="server" id="Header" />
    <title>City</title>
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../plugins/package/src/pnotify.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <uc1:Menu runat="server" id="Menu" />
            <div class="content-wrapper">
                
            

                <div class="row p-3">
                    <div class="col-md-12">

                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col">
                                        <center>
                                            <h3>City</h3>
                                            <hr />
                                        </center>
                                    </div>
                                </div>


                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        City Name
                                    <asp:TextBox runat="server" ID="txtcity" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFVGST" ValidationGroup="me" Display="Dynamic" runat="server"
                                            ControlToValidate="txtcity" ForeColor="Red" CssClass="font-weight-bold" ErrorMessage=" *Required">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                            CssClass=" font-weight-bold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtcity" ErrorMessage="InValidFormat" ValidationExpression="^[a-zA-Z_\s]{2,}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="row pt-2">
                                    <div class="col-md-6">
                                        State Name
                                    <asp:DropDownList runat="server" ID="ddlstate" CssClass="form-control">
                                    </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="me" Display="Dynamic" runat="server"
                                            ControlToValidate="ddlstate" ForeColor="Red" CssClass=" font-weight-bold" InitialValue="0" ErrorMessage=" *Required">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                        CssClass="errfrm fw-semibold" Font-Size="Smaller" ForeColor="Red" ControlToValidate="txtDepartment" ErrorMessage="InValid Format"
                                        ValidationExpression="^[A-Z,a-z]{2,}$">
                                    </asp:RegularExpressionValidator>--%>
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
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                        <th>Block/UnBlock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="repeater" OnItemCommand="repeater_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("City") %></td>
                                                <td><%#Eval("State") %></td>
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
