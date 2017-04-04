using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Panier : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        List<String> listHidden = new List<String>();
        listHidden = listHiddenInitialazer(listHidden);
        if (reload.Value == "0")
        {
            //
        }
        else
        {
            updateListePanier(listHidden);
        }

        afficherPanier();
    }

    protected void afficherPanier()
    {
        //Building an HTML string.
        StringBuilder html = new StringBuilder();

        //Table start.
        html.Append("<table id='tableTest' border = '1'>");

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
                html.Append("<tr>");
                for (int i = 0; i <= 2; i++)
                {
                    html.Append("<td>");
                    if (i == 1)
                    {
                        html.Append("<input runat='server' id=qte" + rowId + " type='Number' value='" + item.Split('&')[i] + "'> ");
                        html.Append("<input type='hidden' id=listePanier" + rowId + " value='" + item.Split('&')[i] + "'>");
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
            html.Append("<input type='hidden' id='produitsCount' value='" + listePanier.Count + "'>");
            //html.Append("<input type='hidden' id='listePanier' value='" + listePanier.ToString() + "'>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

        }
        
    }

    protected void updateListePanier(List<String> listHidden)
    {

        List<String> listePanier = (List<String>)Session["liste_panier"];
        List<String> newListePanier = new List<String>();

        var rowId = 0;
        foreach (var item in listePanier)
        {
            string newName = "";
            string newQte = "";
            string newPrix = "";

            for (int i = 0; i <= 2; i++)
            {
                if (i == 0)
                {
                    newName = item.Split('&')[i];
                }
                if (i == 1)
                {
                    newQte = listHidden[rowId];
                    //Control ctrl = FindControl("Hidden" + i);
                    //newQte = ctrl.ToString();
                }
                if (i == 2)
                {
                    float prixIndividuel = float.Parse(item.Split('&')[i]) / float.Parse(listePanier[rowId].Split('&')[1]);
                    //Calculer eventuellement le nouveau prix comme y faut
                    newPrix = (int.Parse(newQte) * prixIndividuel).ToString();
                }
            }
            newListePanier.Add(newName + "&" + newQte + "&" + newPrix);

            rowId++;

        }

        Session["liste_panier"] = newListePanier;


        //string nom = ((Label)row.Cells[0].FindControl("labelNom")).Text;
        //int qte = Int32.Parse(((TextBox)row.Cells[3].FindControl("textBoxQte")).Text);
        ////Si la quantitée > 0 on fait le traitement
        //if (qte > 0)
        //{
        //    float prix = Single.Parse(((Label)row.Cells[1].FindControl("labelPrix")).Text);
        //    float totalPrix = prix * qte;
        //    List<String> listePanier = new List<string>();
        //    //Response.Write("<script type='text/javascript'>alert('" + ((Label)row.Cells[4].FindControl("labelPrix")).Text.Substring(1) + "');</script>");

        //    //Trouver session si elle existe pui ajouter item dans panier
        //    if (Session["liste_panier"] != null)
        //    {
        //        listePanier = (List<String>)Session["liste_panier"];
        //    }

        //    //Trouver index dans le panier, si il existe update la qte, sinon ajouter produit
        //    int index = indexPanier(listePanier, nom);
        //    if (index != -1)
        //    {
        //        int ancienneQte = Int32.Parse(listePanier[index].Split('&')[1]);
        //        qte += ancienneQte;
        //        totalPrix = prix * qte;
        //        listePanier[index] = nom + "&" + qte + "&" + totalPrix;
        //    }
        //    else
        //    {
        //        listePanier.Add(nom + "&" + qte + "&" + totalPrix);
        //    }

        //    //Remettre la textBox de qte à 0 après l'ajout
        //    ((TextBox)row.Cells[3].FindControl("textBoxQte")).Text = "0";

        //    Session["liste_panier"] = listePanier;
        //}

    }

    protected void buttonSavePanier_Click(object sender, EventArgs e)
    {
       /* List<String> listePanier = new List<string>();
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
            //Control ctrl = FindControlRecursive(PlaceHolder1, "qte0");
            TextBox txtAmount = (TextBox)PlaceHolder1.FindControl("qte" + 0);
            string nom = item.Split('&')[0];
            //Control ctrl = FindControl("qte0");
            //string quant = ctrl.ToString();
            string prixTotal = item.Split('&')[2];
            int ind = indexPanier(listePanier, nom);
            //listePanierNew[ind] = nom + "&" + quant + "&" + prixTotal;
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

    protected List<String> listHiddenInitialazer(List<String> listHidden)
    {
        listHidden.Add(Hidden0.Value);
        listHidden.Add(Hidden1.Value);
        listHidden.Add(Hidden2.Value);
        listHidden.Add(Hidden3.Value);
        listHidden.Add(Hidden4.Value);
        listHidden.Add(Hidden5.Value);
        listHidden.Add(Hidden6.Value);
        listHidden.Add(Hidden7.Value);
        listHidden.Add(Hidden8.Value);
        listHidden.Add(Hidden9.Value);
        listHidden.Add(Hidden10.Value);
        listHidden.Add(Hidden11.Value);
        listHidden.Add(Hidden12.Value);
        listHidden.Add(Hidden13.Value);
        listHidden.Add(Hidden14.Value);
        listHidden.Add(Hidden15.Value);
        listHidden.Add(Hidden16.Value);
        listHidden.Add(Hidden17.Value);
        listHidden.Add(Hidden18.Value);
        listHidden.Add(Hidden19.Value);
        listHidden.Add(Hidden20.Value);
        listHidden.Add(Hidden21.Value);
        listHidden.Add(Hidden22.Value);
        listHidden.Add(Hidden23.Value);
        listHidden.Add(Hidden24.Value);
        listHidden.Add(Hidden25.Value);

        return listHidden;
    }


}
