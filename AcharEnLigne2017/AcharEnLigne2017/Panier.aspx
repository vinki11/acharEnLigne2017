<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Panier.aspx.cs" Inherits="Panier" %>

<asp:Content ID="ContentPanier" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="listeproduits">
        <div class="grille">
            <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
           
            <asp:Button ID="buttonSavePanier" runat="server" Text="Sauvegarder Panier" OnClick="buttonSavePanier_Click"></asp:Button>
            <asp:Button ID="buttonBuy" runat="server" Text="Proceder aux achats" OnClick="buttonBuy_Click"></asp:Button>
        </div> 
    </div>

</asp:Content>