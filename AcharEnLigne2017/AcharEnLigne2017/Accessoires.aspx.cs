﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
    //CultureInfo ci = new CultureInfo("en-CA");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Si l'index sélectionné du dropdownlist est 0, afficher tous les produits.
        /*if (dropDownListCategories.SelectedIndex == 0)
        {*/
            //SqlDataSourceProduit.FilterExpression = "";
            
        //}
    }

    protected void ajouterPanier(GridViewRow row)
    {
        string nom = ((Label)row.Cells[0].FindControl("labelNom")).Text;
        int qte = Int32.Parse(((TextBox)row.Cells[4].FindControl("textBoxQte")).Text);
        int qteRest = Int32.Parse(((Label)row.Cells[2].FindControl("labelQteRest")).Text);
        //Si la quantitée > 0 on fait le traitement
        if (qte > 0 && qte <= qteRest)
        {
            float prix = Single.Parse(((Label)row.Cells[1].FindControl("labelPrix")).Text);
            float totalPrix = prix * qte;
            List<String> listePanier = new List<string>();
            //Response.Write("<script type='text/javascript'>alert('" + ((Label)row.Cells[4].FindControl("labelPrix")).Text.Substring(1) + "');</script>");

            //Trouver session si elle existe pui ajouter item dans panier
            if (Session["liste_panier"] != null)
            {
                listePanier = (List<String>)Session["liste_panier"];
            }

            //Trouver index dans le panier, si il existe update la qte, sinon ajouter produit
            int index = indexPanier(listePanier, nom);
            if (index != -1)
            {
                int ancienneQte = Int32.Parse(listePanier[index].Split('&')[1]);
                qte += ancienneQte;
                totalPrix = prix * qte;
                listePanier[index] = nom + "&" + qte + "&" + totalPrix;
            }
            else
            {
                listePanier.Add(nom + "&" + qte + "&" + totalPrix);
            }

            //Remettre la textBox de qte à 0 après l'ajout
            ((TextBox)row.Cells[3].FindControl("textBoxQte")).Text = "0";

            Session["liste_panier"] = listePanier;
        }
        else if (qte > qteRest)
        {
            // Faire validation avec variable de session
            Response.Write("<script type='text/javascript'>alert('La quantité demandée est trop grande.  Veuillez réessayer.');</script>");
            ((TextBox)row.Cells[3].FindControl("textBoxQte")).Text = "0";
        }

    }

    protected void buttonAddPanier_Click(object sender, EventArgs e)
    {
        // On trouve la row du gridview grâce au button
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        ajouterPanier(gvr);
    }

    protected int indexPanier(List<String> listePanier, string nom)
    {
        int index = -1;
        //Trouver si l'objet à ajouter est déjà dans le panier
        for (int i = 0; i < listePanier.Count; i++)
        {
            if (listePanier[i].Split('&')[0] == nom)
            {
                index = i;
                break;
            }
        }

        return index;
    }
}