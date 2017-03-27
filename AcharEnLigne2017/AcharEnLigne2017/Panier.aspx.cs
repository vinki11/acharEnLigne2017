using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Panier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        afficherPanier();
    }

    protected void afficherPanier()
    {
        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<table border = '1'>");

        //Building the Header row.
        html.Append("<tr>");

        html.Append("<th>Nom Produit</th>");
        html.Append("<th>Quantité</th>");
        html.Append("<th>Prix Total</th>");

        html.Append("</tr>");

        //Building the Data rows.
        if (Session["liste_panier"] != null)
        {
            List<String> listePanier = (List<String>)Session["liste_panier"];

            float grandTotal = 0.0f;

            var rowId = 0;
            foreach (var item in listePanier)
            {
                html.Append("<tr>");;
                for (int i = 0; i <= 2; i++)
                {
                    html.Append("<td>");
                    if (i == 1)
                    {
                        html.Append("<input runat='server' id=qte" + rowId + " type='Number' value='" + item.Split('&')[i] + "'> ");
                    }
                    else
                    {
                        html.Append(item.Split('&')[i]);
                    }
                    html.Append("</td>");
                }
                rowId++;
                html.Append("</tr>");

            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

        }
        
    }

    protected void buttonSavePanier_Click(object sender, EventArgs e)
    {
        List<String> listePanier = new List<string>();
        List<String> listePanierNew = new List<string>();
        //Trouver session si elle existe pui ajouter item dans panier
        if (Session["liste_panier"] != null)
        {
            listePanier = (List<String>)Session["liste_panier"];
            listePanier.ForEach((item) =>
            {
                listePanierNew.Add(item.ToString());
            });
        }
        foreach (var item in listePanier)
        {
            string nom = item.Split('&')[0];
            Control ctrl = FindControl("qte1");
            string quant = ctrl.ToString();
            string prixTotal = item.Split('&')[2];
            int ind = indexPanier(listePanier, nom);
            listePanierNew[ind] = nom + "&" + quant + "&" + prixTotal;
        }

        Session["liste_panier"] = listePanierNew;

        /*
        string nom = ((Label)row.Cells[0].FindControl("labelNom")).Text;
        int qte = Int32.Parse(((TextBox)row.Cells[3].FindControl("textBoxQte")).Text);
        */


        //Trouver index dans le panier, si il existe update la qte, sinon ajouter produit

        /*if (index != -1)
        {
            int ancienneQte = Int32.Parse(listePanier[index].Split('&')[1]);
            qte += ancienneQte;
            totalPrix = prix * qte;
            listePanier[index] = nom + "&" + qte + "&" + totalPrix;
        }
        else
        {
            listePanier.Add(nom + "&" + qte + "&" + totalPrix);
        }*/
    }

    protected void buttonBuy_Click(object sender, EventArgs e)
    {

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
