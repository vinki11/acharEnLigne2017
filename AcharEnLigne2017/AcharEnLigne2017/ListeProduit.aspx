﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListeProduit.aspx.cs" Inherits="ListeProduit" %>

<%--
Description : Page de la liste des produits du site
Programmé par : François Légaré
Le : 3 février 2014
Historique des modifications
Par : François Légaré
Le : 28 février 2014
Modifications : Changement du gridView pour permettre la modification d'un produit
--%>

<asp:Content ID="ContentListe" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">        

        <asp:SqlDataSource ID="SqlDataSourceProduit" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>"
            SelectCommand="SELECT [idItem], [nomItem], [coutAchat], [prixVente], [quantite] FROM [item] INNER JOIN [accessoire] ON [idItem] = [idItem]">
            <%--<FilterParameters>
                <asp:ControlParameter Name="categorie_id" ControlID="dropDownListCategories" PropertyName="SelectedValue" Type="Int32" />
            </FilterParameters>--%>
        </asp:SqlDataSource>

       <%-- <asp:SqlDataSource ID="SqlDataSourceCategorie" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>"         
            SelectCommand="SELECT categorie_id, categorie_nom FROM categorie ORDER BY categorie_nom">            
        </asp:SqlDataSource>--%>

        <div id="listeproduits">
            <div class="grille">
                <%--<asp:Label ID="labelDropDownList" runat="server" Text="Filtrer par catégorie : " />
                <asp:DropDownList ID="dropDownListCategories" runat="server" DataSourceID="SqlDataSourceCategorie" DataValueField="categorie_id" DataTextField="categorie_nom" autoPostBack="true" AppendDataBoundItems="true" >
                    <asp:ListItem Selected="True" Value="-1">Toutes les catégories</asp:ListItem>
                </asp:DropDownList>--%>

                <asp:GridView ID="GridViewProduits" runat="server" DataSourceID="SqlDataSourceProduit" AutoGenerateEditButton="false" AutoGenerateDeleteButton="false" AutoGenerateColumns="False" HeaderStyle-CssClass="entetegrille" RowStyle-CssClass="lignesgrille" DataKeyNames="produit_id" OnRowCreated="GridViewProduits_RowCreated" OnRowUpdating="GridViewProduits_RowUpdating" OnRowUpdated="GridViewProduits_RowUpdated">
                    <Columns>
                        <%-- Colonne de la catégorie dans le GridView --%>
                        <%--<asp:TemplateField HeaderText="Catégorie" SortExpression="categorie_nom">
                            <ItemTemplate>
                                <asp:Label ID="labelCategorie" runat="server" Text='<%# Eval("categorie_nom") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="dropDownListCategoriesEdit" runat="server" DataSourceID="SqlDataSourceCategorie" DataTextField="categorie_nom" DataValueField="categorie_id" SelectedValue='<%# Bind("produit_idCategorie") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>--%>

                        <%-- Colonne du nom de produit dans le GridView --%>
                        <asp:TemplateField HeaderText="Nom" SortExpression="produit_nom">
                            <ItemTemplate>
                                <asp:Label ID="labelNom" runat="server" Text='<%# Eval("nomItem") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textBoxNom" runat="server" MaxLength="50" Text='<%# Bind("nomItem") %>'/>
                                <asp:RequiredFieldValidator ID="validationNomRequis" runat="server" ControlToValidate="textBoxNom"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" ForeColor="Red" ValidationGroup="modif" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%-- Colonne du prix du produit dans le GridView --%>
                        <asp:TemplateField HeaderText="Prix" SortExpression="produit_prix">
                            <ItemTemplate>
                                <asp:Label ID="labelPrix" runat="server" Text='<%# Eval("prixVente") %>' Width="100px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textBoxPrix" runat="server" MaxLength="10" Text='<%# Bind("prixVente", "{0:F2}") %>'/>
                                <asp:RequiredFieldValidator ID="validationPrixRequis" runat="server" ControlToValidate="textBoxPrix"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" ForeColor="Red" ValidationGroup="modif" />
                                <asp:CompareValidator ID="CompareValidatorPrix" runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="textBoxPrix" ErrorMessage="La valeur doit être numérique." ForeColor="Red" ValidationGroup="modif" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%-- Colonne de l'image du produit dans le GridView --%>
                        <asp:TemplateField HeaderText="Image" SortExpression="prixVente">
                            <ItemTemplate>
                                <asp:Image ID="imageItem" ImageUrl='<%# Eval("imageItem", "~/medias/commun/produits/accessoires/{0}").ToString() %>' runat="server" CssClass="boiteimage" Width="120px"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textBoxImage" runat="server" MaxLength="50" Text='<%# Bind("imageItem") %>'/>
                                <asp:RequiredFieldValidator ID="validationImageRequis" runat="server" ControlToValidate="textBoxImage"
                                    ErrorMessage="requis" CssClass="erreurvalidateur" SetFocusOnError="True" ForeColor="Red" ValidationGroup="modif" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <%-- Colonne du nombre d'item a ajouter au panier dans le GridView --%>
                        <asp:TemplateField HeaderText="Ajout panier" SortExpression="prixVente">
                            <ItemTemplate>
                                <asp:TextBox ID="textBoxQte" TextMode="Number" runat="server" Text="0" class="textboxform" min="0" max="999" step="1" Width="50px"/>
                                <asp:Button ID="buttonAddPanier" runat="server" Text="Ajouter Panier" OnClick="buttonAddPanier_Click"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                     </Columns>
                     <EmptyDataTemplate>
                        <asp:Label ID="labelCategorieVide" runat="server" Text="Il n'y a aucun accesoire correspondant à la catégorie sélectionnée." CssClass="classeMessage" />
                     </EmptyDataTemplate>
                </asp:GridView>
                <asp:Label ID="labelMessage" runat="server" ForeColor="Red" CssClass="textemargin" />
            </div>
            <a href="AjoutProduit.aspx" class="buttonedition"><asp:Label ID="labelAjout" runat="server" Text="Ajout de produit" CssClass="buttoncommentaire"></asp:Label></a>
        </div>
    
</asp:Content>