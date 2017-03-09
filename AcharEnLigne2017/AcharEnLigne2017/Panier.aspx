<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Panier.aspx.cs" Inherits="Panier" %>

<asp:Content ID="ContentPanier" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="listeproduits">
        <div class="grille">
            <%--<asp:GridView ID="GridPanier" runat="server">
                <Columns>
                    <asp:BoundField DataField="nomProduit" DataFormatString="string" HeaderText="Nom"/>
                    <asp:BoundField DataField="qteProduit" DataFormatString="string" HeaderText="Quantité"/>
                </Columns>
            </asp:GridView>--%>
            <asp:Table ID="TablePanier" runat="server" Width="400px">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell ColumnSpan="0" Text="Nom produit"></asp:TableHeaderCell>
                    <asp:TableHeaderCell ColumnSpan="1" Text="Quantité"></asp:TableHeaderCell>
                    <asp:TableHeaderCell ColumnSpan="2" Text="Prix total"></asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div> 
    </div>

</asp:Content>