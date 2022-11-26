<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="HO_Header" %>

<nav class="main-header navbar navbar-expand navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="#" class="nav-link">Home</a>
        </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->
        <li class="nav-item d-sm-inline-block">
            <span class="oi oi-account-logout">
                <asp:LinkButton ID="lbtnLogout" runat="server" Text="Logout" ForeColor="GrayText" class="nav-item" CausesValidation="false"></asp:LinkButton>
            </span>
        </li>
    </ul>
</nav>
<!-- /.navbar -->
<!-- Main Sidebar Container -->
<aside class="main-sidebar elevation-3 ele sidebar-light-primary">
    <!-- Brand Logo -->
    <a href="#" class="brand-link md-opjjpmhoiojifppkkcdabiobhakljdgm_doc navbar-light">
        <img src="../asset/images/download.png" " alt="MLM Logo" class="brand-image elevation-2"
            style="opacity: .8; margin-left: 4.8rem; margin-top: -6px; max-height: 42px;"/>
        <span class="brand-text font-weight-light" style="visibility: hidden;">MLM</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="../dist/img/avatar.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">
                    <asp:Label ID="labUser" runat="server"></asp:Label></a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column text-sm" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                           with font-awesome or any other icon font library -->

                <li class="nav-item has-treeview">
                    <a href="/MLMMaster/CityMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           City Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/StateMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           State Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/CountryMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Country Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/VendorMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Vendor Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/ProductMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Product Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/ResellerMaster.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Reseller Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/Remapping.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Remapping Master
                            <i class=""></i>
                        </p>
                    </a>
                    <a href="/MLMMaster/Transaction_Form.aspx" class="nav-link">
                        <i class="nav-icon"></i>
                        <p>
                           Transaction Master
                            <i class=""></i>
                        </p>
                    </a>
<%--<ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a href="CityMaster.aspx" class="nav-link">
                                <span class="oi oi-cog"></span>
                                <p style="padding-left: 5px;">City Master</p>
                            </a>
                        </li>
                    </ul>--%>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
