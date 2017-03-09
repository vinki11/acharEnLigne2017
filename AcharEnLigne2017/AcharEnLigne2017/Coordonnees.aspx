<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Coordonnees.aspx.cs" Inherits="Coordonnees" %>

<%--
Description : Page des coordonnées
Programmé par : François Légaré
Le : 22 février 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<asp:Content ID="ContentCoordonnees" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">
		
        <asp:SqlDataSource ID="SqlDataSourceMessage" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
            InsertCommand="INSERT INTO message (message_idUsager, message_erreur, message_nom, message_courriel, message_sujet, message_texte) VALUES (@message_idUsager, @message_erreur, @message_nom, @message_courriel, @message_sujet, @message_texte)" >
            <InsertParameters>
                <asp:SessionParameter Name="message_idUsager" SessionField="message_idUsager" />
                <asp:SessionParameter Name="message_erreur" SessionField="message_erreur" />
                <asp:ControlParameter Name="message_nom" ControlID="textBoxNom" />
                <asp:ControlParameter Name="message_courriel" ControlID="textBoxCourriel" />
                <asp:ControlParameter Name="message_sujet" ControlID="textBoxSujet" />
                <asp:ControlParameter Name="message_texte" ControlID="textBoxTexte" />
            </InsertParameters>
        </asp:SqlDataSource>        

        <div id="formulaireinscription">

            <h3>Envoyez-nous un courriel</h3>

            <div id="formulairelabel">
                <asp:Label ID="labelNomMessage" runat="server" Text="Nom : "></asp:Label><br/>
                <asp:Label ID="labelCourriel" runat="server" Text="Courriel : "></asp:Label><br/>
                <asp:Label ID="labelSujet" runat="server" Text="Sujet : "></asp:Label><br/>
                <asp:Label ID="labelTexte" runat="server" Text="Message : "></asp:Label><br/>
            </div>

            <div id="formulairetextbox">
                <asp:TextBox ID="textBoxNom" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator ID="requiredFieldValidatorNom" runat="server" ControlToValidate="textBoxNom"
                ErrorMessage="Vous devez entrer votre nom." ForeColor="Red" ValidationGroup="message"></asp:RequiredFieldValidator><br/>

                <asp:TextBox ID="textBoxCourriel" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator ID="requiredFieldValidatorCourriel" runat="server" ControlToValidate="textBoxCourriel"
                ErrorMessage="Vous devez entrer votre courriel." ForeColor="Red" ValidationGroup="message"></asp:RequiredFieldValidator><br/>

                <asp:TextBox ID="textBoxSujet" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator ID="requiredFieldValidatorSujet" runat="server" ControlToValidate="textBoxSujet"
                ErrorMessage="Vous devez entrer un sujet." ForeColor="Red" ValidationGroup="message"></asp:RequiredFieldValidator><br/>

                <asp:TextBox ID="textBoxTexte" runat="server" TextMode="MultiLine" />
                <asp:RequiredFieldValidator ID="requiredFieldValidatorTexte" runat="server" ControlToValidate="textBoxTexte"
                ErrorMessage="Vous devez entrer votre message." ForeColor="Red" ValidationGroup="message"></asp:RequiredFieldValidator>
            
            </div>
        
        <asp:Label ID="labelMessage" runat="server" ForeColor="Red" CssClass="textemargin" />
        <div id="formulairebutton">
            <asp:Button ID="buttonEnvoyer" runat="server" Text="Envoyer" CssClass="buttonform" OnClick="buttonEnvoyer_Click" ValidationGroup="message"></asp:Button>
        </div>

    </div>

		<!-- Features Wrapper -->
			<div id="features-wrapper">
				<div class="container">
                    <a href="Edition.aspx" class="buttonedition"><asp:Label ID="labelEdition" runat="server" Text="Édition" CssClass="button"></asp:Label></a>
				</div>
			</div>

</asp:Content>
