<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="default">
	<meta name="format-detection" content="telephone=no">
	<meta name="HandheldFriendly" content="true" />
	<meta name = "viewport" content = "width = 350,initial-scale = 1.0, user-scalable = no">
	<title>Find My Needs</title>
	<link rel="stylesheet" href="css/style.css">
	<link href="css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="stylesheet">
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery-ui-1.10.3.custom.js"></script>
</head>
<body>
	<header>
		<div id="menu">
                <div class="linkMenu"><a href="javascript:alert('A implémenter'); return false;">Aide aux personnes</a></div>
				<div class="linkMenu"><a href="javascript:alert('A implémenter'); return false;">Ajouter un article</a></div>
				<div class="linkMenu"><a href="javascript:alert('A implémenter'); return false;">Vendeur</a></div>
		</div>
		<div id="logoCompa">
			<img src="images/logo.png" title="Logo Comparateur" alt="Logo Comparateur" />
		</div>
	</header>
    <div class="conteneur">
		<div id="formCompa">
			<div id="titleCompa">Recherche</div>
                <div id="filterByCat" style="display: none;">
                        Filtre sur catégorie: <SELECT id="listeCat" name="filyerCategorie">
                            
												</SELECT>
                </div>
		<div id="contentFormCompa">
			<form id="theform" name="search" method="get" action="" onsubmit="SearchProduct(); return false;"> 
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td><input id ="textCompa" type="text" name="q" size="50" x-webkit-speech placeholder="Recherchez votre besoin..." /></td>
                                </tr>
                                <tr>
                                    <td><input id="submitCompa" type="button" value="Recherche" onclick="SearchProduct();"/></td>
                                </tr> 
                            </table>
			</form>
                    <div id="suggestions" style="display:none;">
                           
                    </div>
		</div>
               
        <div id="noresultform" style='display: none;'>
                    Désolé, nous n'avons pas trouvé de solution à votre besoin.<br />Cependant vous pouvez exprimer votre besoin à notre communauté. (Ou demandez de l'aide sur twitter ou facebook !)
                    <br />
					<!-- Twitter + Facebook !-->
					<a href="https://twitter.com/intent/tweet?button_hashtag=FindMyNeeds&text=Bonjour%20aidez%20moi%20%C3%A0%20r%C3%A9soudre%20mon%20probl%C3%A8me%20sur%20jrenard.fr%2Ffindmyneeds%2Fproblem563" class="twitter-hashtag-button" data-size="large">Tweet #FindMyNeeds</a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script><form id="theform" name="search" method="get" action=""> 
					<div class="fb-share-button" data-href="http://developers.facebook.com/docs/plugins/" data-type="button"></div>                       
							
							<table style="margin: 0 auto;">
                                <tr>
                                   <td>Votre Nom:</td><td><input id ="nom" type="text" name="q" size="50" x-webkit-speech /></td>
                                </tr>
                                <tr>
                                   <td>Votre adresse Email:</td><td><input id ="email" type="text" name="q" size="50" x-webkit-speech /></td>
                                </tr>
                                <tr><td colspan='2'>Votre Message:
                                <textarea></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan='2'><input id="submitCompa" type="button" value="Envoyer" onclick="alert('Non implémenté');"/></td>
                                </tr>
                            </table>
			</form>
        </div>       
                <div><a href="javascript: jQuery('#currentPosition').toggle(); return false;"><img src="images/findme.png" alt="Localisez moi" title="Localisation" />Voir ma localisation</a></div>
                <div id="currentPosition" style="display: none;">
                    Votre position geographique:<br />
                    Adresse: <span id="adress"></span><br />
                    Latitude: <span id="posx"></span><br />
                    Langitude: <span id="posy"></span>
                </div>
                
        </div>
    </div>
    <div id="zoom"><button class="btnzoom" onclick='javascript:unzoom();'>-</button><button class="btnzoom" onclick='javascript:mostzoom();'>+</button></div>
    <footer>By Team Kapadnom</footer>
    <script src="js/script.js"></script>
        <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/fr_FR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>