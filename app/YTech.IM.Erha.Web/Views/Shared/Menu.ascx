<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="YTech.IM.Erha.Web.Controllers.Transaction" %>
<%@ Import Namespace="YTech.IM.Erha.Web.Controllers.Utility" %>
<div id="accordion">
    <h3>
        <a href="#">Home</a></h3>
    <div class="child-menu-container">
        <%=Html.ActionLinkForAreas<HomeController>(c => c.Index(), "Home") %>
    </div>
    <% if (Request.IsAuthenticated)
       {
    %>

<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
    <h3>
        <a href="#">Data Pokok</a></h3>
    <div class="child-menu-container">
        <%= Html.ActionLinkForAreas<WarehouseController>(c => c.Index(),"Master Gudang") %>
        <%= Html.ActionLinkForAreas<MItemCatController>(c => c.Index(),"Master Kategori Produk") %>
        <%= Html.ActionLinkForAreas<BrandController>(c => c.Index(),"Master Merek") %>
        <%= Html.ActionLinkForAreas<ItemController>(c => c.Index(), "Master Produk")%>
        <%-- 
            <%= Html.ActionLinkForAreas<PacketController>(c => c.Index(), "Master Paket")%>--%>
        <%= Html.ActionLinkForAreas<RoomController>(c => c.Index(), "Master Ruangan")%>
        <%= Html.ActionLinkForAreas<SupplierController>(c => c.Index(),"Master Supplier") %>
        <%--
            <%= Html.ActionLinkForAreas<CustomerController>(c => c.Index(),"Master Konsumen") %>--%>
        <%= Html.ActionLinkForAreas<DepartmentController>(c => c.Index(),"Master Departemen") %>
        <%= Html.ActionLinkForAreas<EmployeeController>(c => c.Index(), "Master Karyawan")%>
        <%= Html.ActionLinkForAreas<CostCenterController>(c => c.Index(),"Master Cost Center") %>
        <%= Html.ActionLinkForAreas<AccountController>(c => c.Index(),"Master Akun") %>
        <%=Html.ActionLinkForAreas<ActionCatController>(c => c.Index(), "Master Kategori Tindakan")%>
        <%=Html.ActionLinkForAreas<ActionController>(c => c.Index(), "Master Tindakan")%>
    </div>
<% } %>

    <h3>
        <a href="#">Pasien</a></h3>
    <div class="child-menu-container">
        <%= Html.ActionLinkForAreas<CustomerController>(c => c.Registration(), "Registrasi Pasien Baru")%>
        <%= Html.ActionLinkForAreas<CustomerController>(c => c.Index(), "Daftar Pasien")%>
        <%=Html.ActionLinkForAreas<InventoryController>(c => c.Billing(), "Tindakan Pasien") %>
        <%=Html.ActionLinkForAreas<CustomerController>(c => c.Search(false), "Cari Pasien") %>
    </div>

<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
    <h3>
        <a href="#">Inventori</a></h3>
    <div class="child-menu-container">
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Index(), "Order Pembelian")%>
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Purchase(), "Pembelian")%>
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.ReturPurchase(), "Retur Pembelian")%>
        
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Using(), "Pemakaian Barang")%>

        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Sales(), "Penjualan")%>
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.ReturSales(), "Retur Penjualan")%>
        <%--
         <%= Html.ActionLinkForAreas<InventoryController>(c => c.Billing(), "Billing")%>--%>
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Mutation(), "Mutasi Stok")%>
        <%= Html.ActionLinkForAreas<InventoryController>(c => c.Adjusment(), "Penyesuaian Stok")%>
    </div>
<% } %>

<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
<h3>
    <a href="#">Pembukuan</a></h3>
<div class="child-menu-container">
    <%= Html.ActionLinkForAreas<AccountingController>(c => c.GeneralLedger(), "Jurnal Umum")%>
    <%= Html.ActionLinkForAreas<AccountingController>(c => c.CashIn(), "Kas Masuk")%>
    <%= Html.ActionLinkForAreas<AccountingController>(c => c.CashOut(), "Kas Keluar")%>
    <%-- Mutasi Kas</div>
                            Kasbon</div>
                            </div>
                            Pembayaran Hutang</div>
                            Pembayaran Gaji</div>--%>
</div>
<% } %>

<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
<h3>
    <a href="#">Absensi</a></h3>
<div class="child-menu-container">
    <%= Html.ActionLinkForAreas<HRController>(c => c.Absent(), "Absen Karyawan")%>
</div>
<% } %>

<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
<h3>
    <a href="#">Laporan</a></h3>
<div class="child-menu-container">
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptBrand,null,null,null), "Daftar Merek")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptCostCenter,null,null,null), "Daftar Cost Center")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptStockCard,null,null,null), "Kartu Stok")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptStockItem,null,null,null), "Laporan Stok Per Gudang")%>

<%-- <%= Membership.GetUser().UserName %>
<%= Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator") %> --%>


    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptServiceOmzet,null,null,null), "Laporan Omzet Penjualan")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptSalesByAction,null,null,null), "Lap. Penjualan Berdasar Jlh Tindakan")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptCommission,null,null,null), "Lap. Detail Komisi Karyawan")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptCommissionRecap,null,null,null), "Lap. Rekap Komisi Karyawan")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptServiceByCustomer,null,null,null), "Lap. Tindakan Per Pasien")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptJournal,null,null,null), "Lap. Jurnal")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptBukuBesar,null,null,null), "Lap. Buku Besar")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptNeraca,null,null,null), "Lap. Neraca")%>
    <%= Html.ActionLinkForAreas<ReportController>(c => c.Report(EnumReports.RptLR,null,null,null), "Lap. Laba / Rugi")%>
</div>
<% } %>

<h3>
    <a href="#">Utiliti</a></h3>
<div class="child-menu-container">
    <% if (Membership.GetUser().UserName.ToLower().Equals("admin"))
       { %>
    <%= Html.ActionLinkForAreas<UserAdministrationController>(c => c.ListUsers(), "Daftar Pengguna")%>
    <% } %>
    <%--
            <%= Html.ActionLinkForAreas<UserAdministrationController>(c => c.Index(null), "Daftar Pengguna")%>--%>
    <%-- 
            Ganti Password</div>
        
            Backup Database</div>--%>
    <%= Html.ActionLinkForAreas<InventoryController>(c => c.ListBilling("Print"), "Cetak Faktur Tindakan")%>
    
<% if (Roles.IsUserInRole(Membership.GetUser().UserName, "Administrator")) { %>
    <%= Html.ActionLinkForAreas<InventoryController>(c => c.ListBilling("Delete"), "Hapus Faktur Tindakan")%>    
    <%= Html.ActionLinkForAreas<AccountingController>(c => c.Closing(), "Tutup Buku")%>
<% } %>

    <%
       }
    %>
</div>
</div>
