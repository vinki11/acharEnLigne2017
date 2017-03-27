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

            foreach (var item in listePanier)
            {
                html.Append("<tr>");
                for (int i = 0; i <= 2; i++)
                {
                    html.Append("<td>");
                    if (i == 1)
                    {
                        html.Append("<input type='Number' value='" + item.Split('&')[i] + "'>");
                    }
                    else
                    {
                        html.Append(item.Split('&')[i]);
                    }
                    html.Append("</td>");
                }
                html.Append("</tr>");

            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

        }
        /*if (Session["liste_panier"] != null)
        {
            List<String> listePanier = (List<String>)Session["liste_panier"];

            float grandTotal = 0.0f;

            foreach (var item in listePanier)
            {
                 TableRow tr = new TableRow();
                 tr.Cells.Add(new TableCell());
                 tr.Cells.Add(new TableCell());
                 tr.Cells.Add(new TableCell());
                 tr.Cells[0].Text = item.Split('&')[0];
                 tr.Cells[1].Text = item.Split('&')[1];
                 tr.Cells[1].
                 tr.Cells[2].Text = item.Split('&')[2];
                 grandTotal += Single.Parse(item.Split('&')[2]);
                 TablePanier.Rows.Add(tr);
            }

            TableRow trTotal = new TableRow();
            trTotal.Cells.Add(new TableCell());
            trTotal.Cells.Add(new TableCell());
            trTotal.Cells.Add(new TableCell());
            trTotal.Cells[0].Text = "Total";
            trTotal.Cells[1].Text = "";
            trTotal.Cells[2].Text = grandTotal.ToString();
            TablePanier.Rows.Add(trTotal);*
        }*/

    }

}
