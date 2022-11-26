<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="HO_Header" %>


<!-- Navbar -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - MLM</title>

    <%--<asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>--%>
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" type="text/css" href="../plugins/open-iconic-master/font/css/open-iconic-bootstrap.min.css" />
    <!-- daterange picker -->
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
 <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../plugins/datePiker/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <%--<!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../../../Contentv/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">--%>
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../plugins/datatables-buttons/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.dataTables.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
        rel="stylesheet">
    <!-- PNotify 3.2.1 -->
    <link rel="stylesheet" type="text/css" href="../plugins/package/dist/pnotify.css" />
    <link rel="stylesheet" type="text/css" href="../plugins/package/dist/pnotify.buttons.css" />
    <link rel="stylesheet" type="text/css" href="../plugins/package/dist/pnotify.nonblock.css" />
    <link rel="stylesheet" type="text/css" href="../CheckBox_radio.css" />
    <!-- Icone -->
    <link rel="stylesheet" href="../plugins/NewIcone/assets/Pe-icon-7-stroke.css">
    <script type="text/javascript">
        function AllowAlphabet(e) {
            var inputValue = event.charCode;
            //alert(inputValue);
            if (!((inputValue > 64 && inputValue < 91) || (inputValue > 96 && inputValue < 123) || (inputValue == 32) || (inputValue == 0))) {
                event.preventDefault();
            }
        }
    </script>
    <script type="text/javascript">
        function Numbers(e) {
            var inputValue = event.charCode;
            //alert(inputValue);(inputValue == 190)(inputValue == 110) for .
            if (!((inputValue > 47 && inputValue < 58) || (inputValue == 32) || (inputValue == 190) || (inputValue == 110) || (inputValue == 0))) {
                event.preventDefault();
            }
        }
    </script>
    <script type="text/javascript">
        function Alphanumeric(e) {
            var inputValue = event.charCode;
            //alert(inputValue);
            if (!((inputValue > 64 && inputValue < 91) || (inputValue > 96 && inputValue < 123) || (inputValue == 32) || (inputValue > 47 && inputValue < 58) || (inputValue == 32) || (inputValue == 0))) {
                event.preventDefault();
            }
        }
    </script>
    <script type="text/javascript">
        function checkEmail(event) {
            //var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (!re.test(event.value)) {
                alert("Please enter a valid email address");
                return false;
            }
            return true;
        }
    </script>
