<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="accordion">
    <h3>
        <a href="#">Home</a></h3>
    <div>
        <div>
            <%=Html.ActionLinkForAreas<HomeController>(c => c.Index(), "Home") %></div>
    </div>
    <% if (Request.IsAuthenticated)
       {
%>
    <h3>
        <a href="#">Data Pokok</a></h3>
    <div>
        <div>
            <%=Html.ActionLinkForAreas<ActionCatController>(c => c.Index(), "Kategori Tindakan") %></div>
        <div>
            <%=Html.ActionLinkForAreas<ActionController>(c => c.Index(), "Tindakan") %></div>
    </div>

    <h3>
        <a href="#">Pasien</a></h3>
    <div>
        <div>
            <%= Html.ActionLinkForAreas<CustomerController>(c => c.Registration(), "Registrasi Pasien Baru")%></div>
        <div>
            <%= Html.ActionLinkForAreas<CustomerController>(c => c.Index(), "Daftar Pasien")%></div>
    </div>
    <%
        }
%>
</div>
