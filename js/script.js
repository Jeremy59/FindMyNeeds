$(function() {
  $("#descriptionProduct").tabs();
   $("#rateProduct").accordion();
   
});


function getLocation(){
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else{alert("Geolocation is not supported by this browser.");}
}
  

function showPosition(position){
    jQuery("#posx").html(position.coords.latitude);
    jQuery("#posy").html(position.coords.longitude);
    
    $.ajax({
   type: "GET",
   url: "http://maps.googleapis.com/maps/api/geocode/json?latlng="+jQuery("#posx").html()+","+jQuery("#posy").html()+"&sensor=false",
   success: function(msg){
       $.each(msg, function(index, value ) {
           $.each(value, function(index2, value2 ) {
               if(value2.formatted_address!=""){
                   jQuery("#adress").html(value2.formatted_address);
                   return false;
                }
            });
        });
   }
 });
 return position;
}

var currentzoom=100;
function unzoom(){
    currentzoom-=20;
    document.body.style.zoom=currentzoom+"%";
    $("#imgarticle").elevateZoom();
}

function mostzoom(){
    currentzoom+=20;
    document.body.style.zoom=currentzoom+"%" 
    $("#imgarticle").elevateZoom();
}

function listCategories(){
    $.ajax({
   type: "GET",
   url: "getResult.php?method=getcategories",
   success: function(msg){
       var mesresult=$.parseJSON(msg);
       var isnull=true;
        $.each(mesresult, function(index, value ) {
           $("#listeCat").append("<OPTION>"+value.categorie_nom+"</OPTION>");
        });
    }
    });
}


function getProduct(idproduit){
    alert("Web Service non implémenté pour la description précise, mais le rendu serait le suivant:");
    window.location.href = "velo.html"; 
}

function SearchProduct(){
    
    var valachercher=jQuery("#textCompa").val();
    if(valachercher==='velo'){
       window.location.href = "velo.html"; 
    }
    else{
		$.ajax({
	   type: "GET",
	   url: "getResult.php?search="+valachercher+"&method=getproduct",
		   success: function(msg){
			   $("#filterByCat").fadeIn(500);
			   $("#noresultform").hide();
			   $("#suggestions").remove();
			   var contentSuggestions='<div id="suggestions" style="display: none;"></div>';
				$("#theform").after(contentSuggestions);
			   var mesresult=$.parseJSON(msg);
			   var isnull=true;
				$.each(mesresult, function(index, value ) {
					isnull=false;
						console.log(value.description);
						console.log(value.nom);
						if(value.nom!=='' && value.description!=='' && value.description!='null' && value.nom!='null'){
							$("#suggestions").append("<h3>"+value.nom_article+"</h3><div>"+value.description_article+"<br />Catégorie: <span style='color: blue;'>"+value.categorie_nom+"</span><br /><button onclick='javascript:getProduct("+value.id_article+");'>VOIR</button></div>");
						}
				});
				if(isnull===true) {
					jQuery("#noresultform").fadeIn(500);
				} 
				$("#suggestions").fadeIn(500);
				$("#suggestions").accordion();
			}
		});
    }
}

$( document ).ready(function() {
	getLocation();
	listCategories();
});
