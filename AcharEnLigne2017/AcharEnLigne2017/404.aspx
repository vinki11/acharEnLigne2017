<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<%--
Description : Page d'erreur page introuvable
Programmé par : François Légaré
Le : 14 mars 2014
Historique des modifications
Par : 
Le : 
Modifications : 
--%>

<asp:Content ID="Content404" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="banner-wrapper">
		<div class="container">
            <div class="row">
				<div class="12u">
                    <div id="banner" class="box">
					    <p><a href="Default.aspx"><asp:Label ID="labelAccueil" runat="server" Text="Accueil"></asp:Label></a></p>
                        <p><a href="ListeProduit.aspx"><asp:Label ID="labelListe" runat="server" Text="Liste de produits"></asp:Label></a></p>
                        <p><a href="Coordonnees.aspx"><asp:Label ID="labelCoor" runat="server" Text="Coordonnées"></asp:Label></a></p>
                        <p><a href="English.aspx"><asp:Label ID="labelEnglish" runat="server" Text="English"></asp:Label></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>