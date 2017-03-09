<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edition.aspx.cs" Inherits="Edition" ValidateRequest="false" %>
<%--
Description : Page permettant d'éditer le contenu de la table page de certaines pages
Programmé par : François Légaré
Le : 21 février 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<asp:Content ID="ContentEdition" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <asp:SqlDataSource ID="SqlDataSourcePage" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT [page_id], [page_titre], [page_description], [page_keywords], [page_h1], [page_texte] FROM [page] WHERE [page_url]=@url_page_prec" 
        UpdateCommand="UPDATE [page] SET [page_titre] = @update_titre, [page_keywords] = @update_keywords, [page_description] = @update_description, [page_h1] = @update_h1, [page_texte] = @update_texte WHERE [page_url]=@url_page_prec">
            <Selectparameters>
                <asp:SessionParameter Name="url_page_prec" SessionField="url_page_prec" />
            </Selectparameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="textareaTitre" Name="update_titre" PropertyName="Value" />
                <asp:ControlParameter ControlID="textareaMots" Name="update_keywords" PropertyName="Value" />
                <asp:ControlParameter ControlID="textareaDesc" Name="update_description" PropertyName="Value" />
                <asp:ControlParameter ControlID="textareaH1" Name="update_h1" PropertyName="Value" />
                <asp:ControlParameter ControlID="textareaTexte" Name="update_texte" PropertyName="Value" />
                <asp:SessionParameter Name="url_page_prec" SessionField="url_page_prec" />
            </UpdateParameters>
    </asp:SqlDataSource>

    <div id="
        
        -wrapper">
		<div class="container">
            <div class="row">
				<div class="12u">
                    <asp:Label ID="labelMessage" runat="server" Text="La modification n'a pas fonctionnée.  Veuillez noter qu'il n'y a que la description, les mots-clés et le texte qui peuvent être vides." ForeColor="Red" />
					<div id="banner" class="box">
                        <h3>Titre :</h3>
                        <textarea id="textareaTitre" runat="server" class="tinymce"></textarea>
                        <h3>Mots-clés :</h3>
                        <textarea id="textareaMots" runat="server" class="tinymce"></textarea>
                        <h3>Description :</h3>
                        <textarea id="textareaDesc" runat="server" class="tinymce"></textarea>
                        <h3>Titre h1 :</h3>
                        <textarea id="textareaH1" runat="server" class="tinymce"></textarea>
                        <h3>Texte :</h3>
                        <textarea id="textareaTexte" runat="server" class="tinymce"></textarea>

                        <div id="buttonedition">
                            <asp:Button ID="buttonEnregistrer" runat="server" Text="Enregistrer" CssClass="buttonform" OnClick="buttonEnregistrer_Click"></asp:Button>
                            <asp:Button ID="buttonAnnuler" runat="server" Text="Annuler" CssClass="buttonform" OnClick="buttonAnnuler_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>

</asp:Content>

