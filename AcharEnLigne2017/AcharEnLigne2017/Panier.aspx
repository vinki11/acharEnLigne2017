<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Panier.aspx.cs" Inherits="Panier" %>

<asp:Content ID="ContentPanier" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="listeproduits">
        <div class="grille">
            <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
           
            <%--<input type="button" id="buttonSavePanier" runat="server" value="Sauvegarder Panier" onclick="getValue()" />--%>
            <asp:Button ID="buttonSavePanier" runat="server" Text="Sauvegarder Panier" onclientclick="getValue()"></asp:Button>
            <asp:Button ID="buttonBuy" runat="server" Text="Proceder aux achats" OnClick="buttonBuy_Click"></asp:Button>
            <input type='hidden' id='reload' value='0' runat="server"/>
            <input type='hidden' id='Hidden0' value='0' runat="server"/>
            <input type='hidden' id='Hidden1' value='0' runat="server"/>
            <input type='hidden' id='Hidden2' value='0' runat="server"/>
            <input type='hidden' id='Hidden3' value='0' runat="server"/>
            <input type='hidden' id='Hidden4' value='0' runat="server"/>
            <input type='hidden' id='Hidden5' value='0' runat="server"/>
            <input type='hidden' id='Hidden6' value='0' runat="server"/>
            <input type='hidden' id='Hidden7' value='0' runat="server"/>
            <input type='hidden' id='Hidden8' value='0' runat="server"/>
            <input type='hidden' id='Hidden9' value='0' runat="server"/>
            <input type='hidden' id='Hidden10' value='0' runat="server"/>
            <input type='hidden' id='Hidden11' value='0' runat="server"/>
            <input type='hidden' id='Hidden12' value='0' runat="server"/>
            <input type='hidden' id='Hidden13' value='0' runat="server"/>
            <input type='hidden' id='Hidden14' value='0' runat="server"/>
            <input type='hidden' id='Hidden16' value='0' runat="server"/>
            <input type='hidden' id='Hidden17' value='0' runat="server"/>
            <input type='hidden' id='Hidden19' value='0' runat="server"/>
            <input type='hidden' id='Hidden20' value='0' runat="server"/>
            <input type='hidden' id='Hidden21' value='0' runat="server"/>
            <input type='hidden' id='Hidden22' value='0' runat="server"/>
            <input type='hidden' id='Hidden23' value='0' runat="server"/>
            <input type='hidden' id='Hidden24' value='0' runat="server"/>
            <input type='hidden' id='Hidden25' value='0' runat="server"/>
            <input type='hidden' id='Hidden18' value='0' runat="server"/>
            <input type='hidden' id='Hidden15' value='0' runat="server"/>
        </div> 
    </div>

</asp:Content>