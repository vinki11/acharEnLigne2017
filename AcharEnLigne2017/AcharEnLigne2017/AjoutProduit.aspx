<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AjoutProduit.aspx.cs" Inherits="AjoutProduit" %>

<%--
Description : Page d'ajout d'un produit dans la BD
Programmé par : François Légaré
Le : 28 février 2014
Historique des modifications
Par : 
Le : 
Modifications : 
--%>

<asp:Content ID="ContentAjoutProduit" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <asp:SqlDataSource ID="SqlDataSourceProduit" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
            InsertCommand="InsertItem" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceProduit_Inserted" >
        <InsertParameters>
            <asp:SessionParameter Name="produit_image" DefaultValue="temporaire.jpg" SessionField="produit_image" />
            <asp:Parameter Name="operation" Type="String" Direction="Output" Size="50"/>
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceCategorie" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>"
            SelectCommand="SELECT categorie_id, categorie_nom FROM categorie ORDER BY categorie_nom">            
    </asp:SqlDataSource>
    
    <div id="formulaireinscription">
        <asp:DetailsView ID="detailsViewAjout" runat="server" AutoGenerateRows="false" DefaultMode="Insert" AutoGenerateInsertButton="true" DataSourceID="SqlDataSourceProduit" DataKeyNames="produit_id" OnItemInserting="detailsViewAjout_ItemInserting" OnItemInserted="detailsViewAjout_ItemInserted" OnItemCommand="detailsViewAjout_ItemCommand">
            <Fields>
                <%-- Catégorie dans le DetailsView --%>
                <asp:TemplateField HeaderText="Catégorie : " SortExpression="produit_idCategorie">
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropDownListCategorie" runat="server" DataTextField="categorie_nom" DataSourceID="SqlDataSourceCategorie" DataValueField="categorie_id" SelectedValue='<%# Bind("produit_idCategorie") %>'></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <%-- Nom du produit dans le DetailsView --%>
                <asp:TemplateField HeaderText="Nom : " SortExpression ="produit_nom">
                    <InsertItemTemplate>
                        <asp:TextBox ID="textBoxNom" runat="server" MaxLength="50" Text='<%# Bind("produit_nom") %>' />
                        <asp:RequiredFieldValidator ID="validationNomRequis" runat="server" ControlToValidate="textBoxNom"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" />
                    </InsertItemTemplate>
                </asp:TemplateField>

                <%-- Prix du produit dans le DetailsView --%>
                <asp:TemplateField HeaderText="Prix : " SortExpression ="produit_prix">
                    <InsertItemTemplate>
                        <asp:TextBox ID="textBoxPrix" runat="server" MaxLength="10" Text='<%# Bind("produit_prix") %>' />
                        <asp:RequiredFieldValidator ID="validationPrixRequis" runat="server" ControlToValidate="textBoxPrix"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" />
                        <asp:CompareValidator ID="CompareValidatorPrix" runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="textBoxPrix" ErrorMessage="La valeur doit être numérique." />
                    </InsertItemTemplate>
                </asp:TemplateField>

                <%-- Nom de l'image du produit dans le DetailsView --%>
                <asp:TemplateField HeaderText="Image : " SortExpression ="produit_image">
                    <InsertItemTemplate>
                        <asp:FileUpload ID="fileUploadPhoto" runat="server" />
                        <%--<asp:TextBox ID="textBoxImage" runat="server" MaxLength="50" Text='<%# Bind("produit_image") %>' />
                        <asp:RequiredFieldValidator ID="validationImageRequise" runat="server" ControlToValidate="textBoxImage"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" />--%>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <%-- Description du produit dans le DetailsView --%>
                <asp:TemplateField HeaderText="Description : " SortExpression ="produit_description">
                    <InsertItemTemplate>
                        <asp:TextBox ID="textBoxDescription" runat="server" TextMode="MultiLine" Text='<%# Bind("produit_description") %>' />
                    </InsertItemTemplate>
                </asp:TemplateField>

            </Fields>
        </asp:DetailsView>
        <asp:Label ID="labelMessage" runat="server" ForeColor="Red" CssClass="textemargin" />
        
    </div>

</asp:Content>