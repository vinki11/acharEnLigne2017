<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%--
Description : Page d'accueil du site web
Programmé par : François Légaré
Le : 29 janvier 2014
Historique des modifications
Par :
Le :
Modifications :
--%>

<%-- La directive MasterType permettra d'utiliser les propriétés publiées sur la page maîtresse --%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="ContentAccueil" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">
		
        

		<!-- Features Wrapper -->
			<div id="features-wrapper">
				<div class="container">
					<div class="row">
						<div class="4u">
						
							<!-- Box -->
								<section class="box box-feature">
									<img src="Medias/Commun/produits/gtx780ti.png" alt="Gtx 780 Ti" class="image image-full" />
									<div class="inner">
										<header>
											<h2>Première vente éclair</h2>
											<span class="byline">ASUS GeForce GTX 780 Ti - 799,99$</span>
										</header>
										<p>Mémoire vidéo de 3gb GDDR5, horloge de la carte 876Mhz, horloge de la mémoire...</p>
									</div>
								</section>

						</div>
						<div class="4u">
						
							<!-- Box -->
								<section class="box box-feature">
									<img src="Medias/Commun/produits/i7-4770k.png" alt="Intel Core i7 4770K" class="image image-full" />
									<div class="inner">
										<header>
											<h2>Deuxième vente éclair</h2>
											<span class="byline">Intel Core i7 4770K - 349,99$</span>
										</header>
										<p>Processeur ultra performant pour les amateurs de puissance.</p>
									</div>
								</section>

						</div>
						<div class="4u">
						
							<!-- Box -->
								<section class="box box-feature last">
									<img src="Medias/Commun/temporaire.jpg" alt="Futur emplacement de publicité." title="Futur emplacement de publicité." class="image image-full"/>
								</section>

						</div>
					</div>
                    <a href="Edition.aspx" class="buttonedition"><asp:Label ID="labelEdition" runat="server" Text="Édition" CssClass="button"></asp:Label></a>
				</div>
			</div>
        

</asp:Content>