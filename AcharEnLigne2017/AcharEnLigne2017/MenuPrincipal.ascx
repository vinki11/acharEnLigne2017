﻿
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuPrincipal.ascx.cs" Inherits="MenuPrincipal" %>

<asp:SqlDataSource ID="SqlDataSourcePage" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT [page_titre] FROM [page] WHERE page_url = @page_url" >
            <Selectparameters>
                <asp:SessionParameter Name="page_url" SessionField="page_url" />
            </Selectparameters>
</asp:SqlDataSource>

<nav id="nav">
    <ul>
		<li id="accueilLi" runat="server"><a href="Default.aspx">Accueil</a></li>
		<li id="inscriptionLi" runat="server"><a href="Inscription.aspx"><asp:Label ID="labelInscription" runat="server" Text="Inscription"></asp:Label></a></li>
		<li id="listeLi" runat="server"><a href="Accessoires.aspx"><asp:Label ID="labelAccessoire" runat="server" Text="Accessoires"></asp:Label></a></li>
        <li id="vehiculesLi" runat="server"><a href="Vehicules.aspx"><asp:Label ID="labelVehicule" runat="server" Text="Vehicules"></asp:Label></a></li>
        <li id="panierLi" runat="server"><a href="Panier.aspx"><i class="fa fa-shopping-cart"></i></a></li>
	</ul>
</nav>