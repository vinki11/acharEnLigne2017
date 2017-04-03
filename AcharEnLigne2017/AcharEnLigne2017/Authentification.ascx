<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Authentification.ascx.cs" Inherits="Authentification" %>

<asp:SqlDataSource ID="SqlDataSourceUsager" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT usager_prenom+' '+usager_nomfamille AS usager_nomcomplet, usager_id, usager_root FROM usager WHERE usager_UserID = @usager_UserID" >
            <Selectparameters>
                <asp:SessionParameter Name="usager_UserID" SessionField="usager_UserID" />
            </Selectparameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceUserID" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT UserId FROM aspnet_Users WHERE UserName = @UserName" >
            <Selectparameters>
                <asp:SessionParameter Name="UserName" SessionField="UserName" />
            </Selectparameters>
</asp:SqlDataSource>

<div id="conneclang">
	<asp:Label ID="labelUsager" runat="server" Text="Usager : "></asp:Label><asp:TextBox ID="textBoxUsager" runat="server" class="boitetexte" MaxLength="50"/><asp:Label ID="labelMdp" runat="server" Text="Mot de passe : "></asp:Label><asp:TextBox ID="textBoxMdp" TextMode="password" runat="server" class="boitetexte" MaxLength="50" /><asp:Button ID="buttonSoumettre" runat="server" Text="Soumettre" OnClick="buttonSoumettre_Click" autoPostBack="true" />
    <asp:Label ID="labelConnexion" runat="server"></asp:Label>
    <asp:Button ID="buttonDeco" runat="server" Text="Déconnexion" OnClick="buttonDeco_Click" />
</div>
<div class="row">
	<div class="12u">
	    <div id="deconnexion">
            <asp:Label ID="labelProbleme" runat="server"></asp:Label>
        </div>
