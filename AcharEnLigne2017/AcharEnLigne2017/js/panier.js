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

    for (var i = 0; i < $('#produitsCount').val() ; i++) {
        alert($('#qte' + i).val());
    }
   /* $.post(document.URL + '?mode=ajax',
     {
         'liste_panier': $("#qte0").val(),
     });*/

    $.ajax({
        type: "Post",
        url: "Panier.aspx",
        data: "{'liste_panier':'0'}",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            alert(result.d);
        }
    });
}