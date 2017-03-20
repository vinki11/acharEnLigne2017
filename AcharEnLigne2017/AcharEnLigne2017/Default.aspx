<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="ContentAccueil" ContentPlaceHolderID="contentPlaceHolderContenu" runat="server">
		
        

		<!-- Features Wrapper -->
			<div id="features-wrapper">
				<div class="container">
					<div class="row">
						<div class="4u">
						
							<!-- Box -->
								<section class="box box-feature">
									<img src="Medias/Commun/produits/vehicules/nissanTitan2016.jpg" alt="NissanTitan2016" class="image image-full" />
									<div class="inner">
										<header>
											<h2>Produit vedette</h2>
											<span class="byline">Nissan Titan 2016</span>
										</header>
										<p>40 000$</p>
									</div>
								</section>

						</div>
						<div class="4u">
						
							<!-- Box -->
								<section class="box box-feature">
									<img src="Medias/Commun/produits/vehicules/chevroletCorvette2012.jpg" alt="ChevroletCorvette2012" class="image image-full" />
									<div class="inner">
										<header>
											<h2>Meilleure offre</h2>
											<span class="byline">Chevrolet Corvette 2012</span>
										</header>
										<p>34 000$</p>
									</div>
								</section>

						</div>
						<div class="4u">
                            <!-- Box -->
								<section class="box box-feature">
									<img src="Medias/Commun/produits/vehicules/toyotaCamry2012.jpg" alt="ChevroletCorvette2012" class="image image-full" />
									<div class="inner">
										<header>
											<h2>Aubaine</h2>
											<span class="byline">Toyota Camry 2012</span>
										</header>
										<p>19 000$</p>
									</div>
								</section>
						</div>
					</div>
                    <a href="Edition.aspx" class="buttonedition"><asp:Label ID="labelEdition" runat="server" Text="Édition" CssClass="button"></asp:Label></a>
				</div>
			</div>
        

</asp:Content>