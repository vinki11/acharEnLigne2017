<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GestionCommentaires.aspx.cs" Inherits="GestionCommentaires" %>
<%--
Description : Page permettant de voir et de supprimer les commentaires de toutes les pages
Programmé par : François Légaré
Le : 22 mars 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<asp:Content ID="ContentGestionComm" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">


    <asp:SqlDataSource ID="SqlDataSourcePage" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
            SelectCommand="SELECT [page_id], [page_titre], [page_url] FROM [page]">
    </asp:SqlDataSource>

    <div id="listeproduits">
            <div class="grille">

                <asp:GridView ID="GridViewPage" runat="server" DataSourceID="SqlDataSourcePage" AutoGenerateColumns="false" HeaderStyle-CssClass="entetegrille" RowStyle-CssClass="lignesgrille" DataKeyNames="page_id" OnRowDataBound="GridViewPage_RowDataBound">
                    <Columns>
                        <%-- Colonne de titre de page --%>
                        <asp:TemplateField HeaderText="Page" SortExpression="page_titre">
                            <ItemTemplate>
                                <asp:HyperLink NavigateUrl='<%# Eval("page_url") %>' Text='<%# Eval("page_titre") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Colonne de gridView de commentaire --%>
                        <asp:TemplateField HeaderText="Commentaires">
                           
                            <ItemTemplate>
                                <asp:SqlDataSource ID="SqlDataSourceCommentaire" runat="server"  
                                    ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
                                    SelectCommand="SELECT commentaire_id, commentaire_texte, usager_prenom+' '+usager_nomfamille AS usager_nomcomplet, commentaire_date FROM commentaire INNER JOIN usager ON usager_id = commentaire_usagerid WHERE commentaire_pageid = @pagecommentaire_id ORDER BY commentaire_date" 
                                    DeleteCommand="DELETE FROM commentaire WHERE [commentaire_id] = @commentaire_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="pagecommentaire_id" SessionField="pagecommentaire_id" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:GridView ID="GridViewCommentaires" runat="server" DataSourceID="SqlDataSourceCommentaire" DataKeyNames="commentaire_id" AutoGenerateColumns="False" HeaderStyle-CssClass="entetegrillecomm" RowStyle-CssClass="lignesgrille" OnRowDeleted="GridViewCommentaires_RowDeleted">
                                    <Columns>
                                        <asp:BoundField DataField="usager_nomcomplet" HeaderText="Nom" SortExpression="usager_nomcomplet" />
                                        <asp:BoundField DataField="commentaire_date" HeaderText="Date" SortExpression="commentaire_date" DataFormatString="{0:dd MMMM yyyy}"/>
                                        <asp:BoundField DataField="commentaire_texte" HeaderText="Commentaire" SortExpression="commentaire_texte" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" ID="buttonEffacer" ImageUrl="Medias/Commun/delete.png" CommandArgument='<%# Eval("commentaire_id") %>' OnClientClick="javascript:return deleteItem(this.name, this.alt);" AlternateText='<%# Eval("commentaire_id") %>' CommandName="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="labelCommentaireVide" runat="server" Text="Il n'y a aucun commentaire pour cette page." ForeColor="Red" />
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
    </div>

</asp:Content>