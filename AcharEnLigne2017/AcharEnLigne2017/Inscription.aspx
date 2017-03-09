<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inscription.aspx.cs" Inherits="Inscription" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<%--
Description : Page d'inscription sur le site
Programmé par : François Légaré
Le : 7 février 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<asp:Content ID="ContentInscription" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">

    <script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
    <script type="text/javascript">
        function showRecaptcha(element) {
            Recaptcha.create("6Le5Z_ASAAAAAJ1DERMSMX9cHAmsmO_HZAUdEMe_", element, {
                theme: "red",
                callback: Recaptcha.focus_response_field
            });
        }
      </script>

    <asp:SqlDataSource ID="SqlDataSourceUsager" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
            SelectCommand="SELECT usager_id FROM usager WHERE usager_UserID = @usager_UserID"
            InsertCommand="INSERT INTO usager (usager_nomfamille, usager_prenom, usager_photo, usager_description, usager_root, usager_UserID) VALUES (@usager_nomfamille, @usager_prenom, @usager_photo, @usager_description, @usager_root, @usager_UserID)" >
                <Insertparameters>
                    <asp:SessionParameter Name="usager_nomfamille" SessionField="usager_nomfamille" />
                    <asp:SessionParameter Name="usager_prenom" SessionField="usager_prenom" />
                    <asp:SessionParameter Name="usager_photo" SessionField="usager_photo" />
                    <asp:SessionParameter Name="usager_description" SessionField="usager_description" />
                    <asp:SessionParameter Name="usager_root" DefaultValue="false" SessionField="usager_root" />
                    <asp:Parameter name="usager_UserID" DefaultValue="" />
                </Insertparameters>
                <SelectParameters>
                    <asp:SessionParameter Name="usager_UserID" SessionField="usager_UserID" />
                </SelectParameters>
    </asp:SqlDataSource>
    
    <div id="formulaireinscription">
        <div id="formulairelabel">
            <asp:Label ID="labelCodeUsager" runat="server" Text="Usager : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelMotDePasse" runat="server" Text="Mot de passe : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelConfirmMdp" runat="server" Text="Confirmation passe : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelPrenom" runat="server" Text="Prénom : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelNomFamille" runat="server" Text="Nom de famille : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelCourriel" runat="server" Text="Courriel : " CssClass="texteformulaire"></asp:Label><br/>
            <asp:Label ID="labelDescription" runat="server" Text="Description : " CssClass="texteformulaire"></asp:Label><br/><br/>
            <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6Le5Z_ASAAAAAJ1DERMSMX9cHAmsmO_HZAUdEMe_" PrivateKey="6Le5Z_ASAAAAAAm-bjYaob0RgajYZRiebWEqnVuG" />
            <asp:CustomValidator ID="recaptchaValidator" runat="server" OnServerValidate="recaptchaValidator_ServerValidate" ErrorMessage="Incorrect" ForeColor="Red" ValidationGroup="inscription" EnableClientScript="false" />
        </div>

        <div id="formulairetextbox">
            <asp:TextBox ID="textBoxCodeUsager" runat="server" class="textboxform" MaxLength="50" />
            <asp:RequiredFieldValidator ID="requiredFieldValidatorUsager" runat="server" ControlToValidate="textBoxCodeUsager"
            ErrorMessage="Vous devez entrer un code d'usager." ForeColor="Red" ValidationGroup="inscription"></asp:RequiredFieldValidator>

            <asp:TextBox ID="textBoxMotDePasse" runat="server" class="textboxform"  TextMode="password" MaxLength="50" />
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPasse" runat="server" ControlToValidate="textBoxMotDePasse"
            ErrorMessage="Vous devez entrer un mot de passe." ForeColor="Red" ValidationGroup="inscription"></asp:RequiredFieldValidator>

            <asp:TextBox ID="textBoxConfirmMdp" runat="server" class="textboxform"  TextMode="password" MaxLength="50" />
            <asp:CompareValidator ID="CompareValidatorMotDePasse" runat="server" ControlToValidate="textBoxMotDePasse"
            ControlToCompare="textBoxConfirmMdp" ErrorMessage="Mots de passe différents." ForeColor="Red" ValidationGroup="inscription"/>

            <asp:TextBox ID="textBoxPrenom" runat="server" class="textboxform" MaxLength="50" />
            <asp:RequiredFieldValidator ID="requiredFieldValidatorPrenom" runat="server" ControlToValidate="textBoxPrenom"
            ErrorMessage="Vous devez entrer votre prenom." ForeColor="Red" ValidationGroup="inscription"></asp:RequiredFieldValidator>

            <asp:TextBox ID="textBoxNomFamille" runat="server" class="textboxform" MaxLength="50" />
            <asp:RequiredFieldValidator ID="requiredFieldValidatorNom" runat="server" ControlToValidate="textBoxNomFamille"
            ErrorMessage="Vous devez entrer votre nom." ForeColor="Red" ValidationGroup="inscription"></asp:RequiredFieldValidator>

            <asp:TextBox ID="textBoxCourriel" runat="server" class="textboxform" MaxLength="75" />
            <asp:RequiredFieldValidator ID="requiredFieldValidatorCourriel" runat="server" ControlToValidate="textBoxCourriel"
            ErrorMessage="Vous devez entrer votre courriel." ForeColor="Red" ValidationGroup="inscription"></asp:RequiredFieldValidator>

            <asp:TextBox ID="textBoxDescription" runat="server" class="textboxform" TextMode="MultiLine" Rows="3" /><br/><br/><br/><br/><br/><br/><br/>

            
        </div>
        <asp:Label ID="labelMessage" runat="server" Text="Message" CssClass="classeMessage"></asp:Label>
        <div id="formulairebutton">
            <asp:Button ID="buttonEnregistrer" runat="server" Text="Enregistrer" CssClass="buttonform" OnClick="buttonEnregistrer_Click" ValidationGroup="inscription"></asp:Button>
            <asp:Button ID="buttonAnnuler" runat="server" Text="Annuler" CssClass="buttonform" OnClick="buttonAnnuler_Click"></asp:Button>
        </div>
    </div>

</asp:Content>