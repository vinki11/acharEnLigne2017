<%--
Description : Contrôle utilisateur du menu principal
Programmé par : François Légaré
Le : 12 mars 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

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
		<%--<li id="inscriptionLi" runat="server"><a href="Inscription.aspx"><asp:Label ID="labelInscription" runat="server" Text="Inscription"></asp:Label></a></li>--%>
		<li id="listeLi" runat="server"><a href="ListeProduit.aspx">Produits</a></li>
        <li id="coordonneesLi" runat="server"><a href="Vehicules.aspx">Véhicules</a></li>
        <li id="panierLi" runat="server"><a href="Panier.aspx"><i class="fa fa-shopping-cart"></i></a></li>
	</ul>
</nav>