using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vehicules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ajouterPanier(GridViewRow row)
    {
        string nom = ((Label)row.Cells[0].FindControl("labelNom")).Text;
        int qte = 1;

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
            totalPrix = prix * qte;
            listePanier[index] = nom + "&" + qte + "&" + totalPrix;
        }
        else
        {
            listePanier.Add(nom + "&" + qte + "&" + totalPrix);
        }

        Session["liste_panier"] = listePanier;
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