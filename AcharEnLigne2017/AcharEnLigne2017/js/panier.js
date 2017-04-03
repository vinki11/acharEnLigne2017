function getValue() {
    /*var x = document.getElementById("frm1");
    var text = "";
    var i;
    for (i = 0; i < x.length ;i++) {
        text += x.elements[i].value + "<br>";
    }*/
   /* var x = document.getElementById("qte0");
    var i;
    var text = "";
    for (i = 0; i < x.length ; i++) {
        text += x.elements[i].value + "<br>";
    }*/

    $('#ContentPlaceHolderContenu_reload').val("1");

    for (var i = 0; i < $('#produitsCount').val() ; i++) {
        //alert("Maintenant = " + $('#qte' + i).val());
        //alert("Avant = " + $('#listePanier' + i).val());
        $('#listePanier' + i).val($('#qte' + i).val());
        $('#ContentPlaceHolderContenu_Hidden' + i).val($('#qte' + i).val());
    }

    //for (var i = 0; i < $('#produitsCount').val() ; i++) {
    //    alert("New valeur listepanier donc maintenant qui etait avant  = " + $('#listePanier' + i).val());
    //}
    //$.post("Panier.aspx");
    //alert($('#listePanier').val());
   /* $.post(document.URL + '?mode=ajax',
     {
         'liste_panier': $("#qte0").val(),
     });*/

    /*$.ajax({
        type: "Post",
        url: "Panier.aspx",
        data: "{'liste_panier':'0'}",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            alert(result.d);
        }
    });*/
}