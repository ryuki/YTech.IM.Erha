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
        <a href="#">Pasien</a></h3>
    <div>
        <div>
            <%= Html.ActionLinkForAreas<CustomerController>(c => c.Registration(null,null), "Registrasi Pasien Baru")%></div>
        <div>
            <%= Html.ActionLinkForAreas<CustomerController>(c => c.Index(), "Daftar Pasien")%></div>
    </div>
    <%
        }
%>
</div>
