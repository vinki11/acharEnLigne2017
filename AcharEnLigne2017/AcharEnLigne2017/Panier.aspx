<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Panier.aspx.cs" Inherits="Panier" %>

<asp:Content ID="ContentPanier" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <div id="listeproduits">
        <div class="grille">
            <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
            <%--<asp:GridView ID="GridPanier" runat="server">
                <Columns>
                    <asp:BoundField DataField="nomProduit" DataFormatString="string" HeaderText="Nom"/>
                    <asp:BoundField DataField="qteProduit" DataFormatString="string" HeaderText="Quantité"/>
                </Columns>
            </asp:GridView>--%>
            <%--<style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
            .tg .tg-yw4l{vertical-align:top}
            </style>
            <table class="tg" runat="server id="tbPanier">
              <tr>
                <th class="tg-yw4l">Nom produit</th>
                <th class="tg-yw4l">Quantité</th>
                <th class="tg-yw4l">Prix total</th>
              </tr>
            </table>--%>
        </div> 
    </div>

</asp:Content>