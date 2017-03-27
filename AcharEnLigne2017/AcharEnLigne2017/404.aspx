<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<asp:Content ID="Content404" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="banner-wrapper">
		<div class="container">
            <div class="row">
				<div class="12u">
                    <div id="banner" class="box">
					    <p><a href="Default.aspx"><asp:Label ID="labelAccueil" runat="server" Text="Accueil"></asp:Label></a></p>
                        <p><a href="ListeProduit.aspx"><asp:Label ID="labelListe" runat="server" Text="Accessoires"></asp:Label></a></p>
                        <p><a href="Vehicules.aspx"><asp:Label ID="labelCoor" runat="server" Text="Vehicules"></asp:Label></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>