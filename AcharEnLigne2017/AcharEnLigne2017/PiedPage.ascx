<%--
Description : Contrôle d'utilisateur du pied de page
Programmé par : François Légaré
Le : 12 mars 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PiedPage.ascx.cs" Inherits="PiedPage" %>

<asp:SqlDataSource ID="SqlDataSourceUsager" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT usager_prenom+' '+usager_nomfamille AS usager_nomcomplet, usager_id, usager_root FROM usager WHERE usager_UserID = @usager_UserID" >
            <Selectparameters>
                <asp:SessionParameter Name="usager_UserID" SessionField="usager_UserID" />
            </Selectparameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSourceCommentaire" runat="server"  
        ConnectionString="<%$ ConnectionStrings:ConnectionStringAcharEnLigne2017 %>" 
        SelectCommand="SELECT commentaire_texte, usager_prenom+' '+usager_nomfamille AS usager_nomcomplet, commentaire_date FROM commentaire INNER JOIN usager ON usager_id = commentaire_usagerid WHERE commentaire_pageid = @commentaire_pageid ORDER BY commentaire_date" 
        InsertCommand="INSERT INTO commentaire (commentaire_texte, commentaire_usagerid, commentaire_pageid, commentaire_date) VALUES (@commentaire_texte, @commentaire_usagerid, @commentaire_pageid, GETDATE())">
            <Selectparameters>
                <asp:SessionParameter Name="commentaire_pageid" SessionField="commentaire_pageid" />
            </Selectparameters>
            <InsertParameters>
                <asp:SessionParameter Name="commentaire_texte" SessionField="commentaire_texte" />
                <asp:SessionParameter Name="commentaire_usagerid" SessionField="commentaire_usagerid" />
                <asp:SessionParameter Name="commentaire_pageid" SessionField="commentaire_pageid" />
            </InsertParameters>

    </asp:SqlDataSource>

<div id="listeproduits">

        <h3>Commentaires</h3>

        <div class="grille">
            <asp:GridView ID="GridViewCommentaires" runat="server" DataSourceID="SqlDataSourceCommentaire" AutoGenerateColumns="False" HeaderStyle-CssClass="entetegrille" RowStyle-CssClass="lignesgrille">
                <Columns>
                    <asp:BoundField DataField="usager_nomcomplet" HeaderText="Nom" SortExpression="usager_nomcomplet" />
                    <asp:BoundField DataField="commentaire_date" HeaderText="Date" SortExpression="commentaire_date" DataFormatString="{0:dd MMMM yyyy}"/>
                    <asp:BoundField DataField="commentaire_texte" HeaderText="Commentaire" SortExpression="commentaire_texte" />
                </Columns>
            </asp:GridView>

        </div>
        <div id="divconnecte">
            <asp:Label ID="labelCommentaire" runat="server" Text="Laissez votre commentaire." CssClass="textemargin" />
            <asp:TextBox ID="textBoxCommentaire" runat="server" Rows="5" TextMode="MultiLine" CssClass="boitcommentaire" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requiredFieldValidatorCommentaire" runat="server" ControlToValidate="textBoxCommentaire"
                ErrorMessage="Vous devez entrer un commentaire." ForeColor="Red" ValidationGroup="commentaire"></asp:RequiredFieldValidator>
            <asp:Button ID="buttonEnvoyerComm" runat="server" Text="Envoyer" CssClass="buttoncommentaire" OnClick="buttonEnvoyerComm_Click" ValidationGroup="commentaire"></asp:Button>
            <a href="GestionCommentaires.aspx" class="buttonedition"><asp:Label ID="labelGestion" runat="server" Text="Gestion des commentaires" CssClass="buttoncommentaire"></asp:Label></a>
        </div>
    </div>

    <!-- Footer Wrapper -->
			<div id="footer-wrapper">
				<footer id="footer" class="container">
					<div class="row">
							
						<div class="3u">
						
							<!-- Links -->
								<section class="widget-links">
									<h2>Mention légale</h2>
										<p>
											La maquette de ce site provient de html5up.net et a été utilisée selon les règles du "Creative Commons".
										</p>
								</section>
						
						</div>
						<div class="3u">
						
							<!-- Contact -->
								<%--<section class="widget-contact last">
									<h2>Informations supplémentaires</h2>
									<ul>
										<li>Programmeur : François Légaré</li>
										<li>Année de création : 2014</li>
										<li>Maquette : Provient de html5up.net</li>
									</ul>
								</section>--%>
						
						</div>
                        <div class="3u">
                            <!-- AddToAny BEGIN -->
                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                               <a class="a2a_dd" href="http://www.addtoany.com/share_save"></a>
                               <a class="a2a_button_facebook"></a>
                               <a class="a2a_button_twitter"></a>
                               <a class="a2a_button_google_plus"></a>
                               <a class="a2a_button_reddit"></a>
                               <a class="a2a_button_tumblr"></a>
                             <a class="a2a_button_blogger_post"></a>
                            </div>
                        <script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>
                        <!-- AddToAny END -->

                        </div>
                        <div class="3u">
                            <iframe marginheight="0" marginwidth="0" name="wxButtonFrame" id="wxButtonFrame" height="50" src="http://btn.meteomedia.ca/weatherbuttons/template8.php?placeCode=CAQC0779&category0=Cities&containerWidth=150&btnNo=&backgroundColor=blue&multipleCity=&citySearch=0&celsiusF=C" align="top" frameborder="0" width="150" scrolling="no" allowTransparency="true"></iframe>
                        </div>
					</div>
                    

					<div class="row">
                        <a href="#" class="scrollToTop">Retourner au début</a>
						<div class="12u">
							<div id="copyright">
								&copy; Untitled. Tous droits réservés. | Images: <a href="http://fotogrph.com/">fotogrph</a> | Maquette: <a href="http://html5up.net/">HTML5 UP</a>
							</div>
						</div>
					</div>
				</footer>
			</div>