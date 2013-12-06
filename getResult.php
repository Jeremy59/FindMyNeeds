<?php

// Recuperation id utilisateur
include('config.php');


$bdd = new PDO( $dns, $utilisateur, $motDePasse);

	// Gère les méthodes du web-service
	if(isset($_GET['method'])){
		
		// get list of product (with filtre)
		if($_GET['method']=="getproduct"){
			
		
			if(!isset($_GET['search']) || $_GET['search']=="") $search='%%';
			else $search='%'.$_GET['search'].'%';
			
			$sth = $bdd->prepare("SELECT a.id as id_article, a.nom as nom_article, a.description as description_article, cat.nom as categorie_nom FROM articles a INNER JOIN categoriearticle cat ON cat.id=a.idcatarticle WHERE a.nom LIKE :nom OR a.description LIKE :desc");
			$sth->bindParam(':nom', $search);
			$sth->bindParam(':desc', $search);
			$sth->execute();

		// Récupération de toutes les lignes d'un jeu de résultats
		$result = $sth->fetchAll();

		echo json_encode($result);
		}
		
		// get list of categories
		else if($_GET['method']=="getcategories"){

		$sth = $bdd->prepare("SELECT cat.nom as categorie_nom FROM categoriearticle cat");
		$sth->execute();

		// Récupération de toutes les lignes d'un jeu de résultats
		$result = $sth->fetchAll();

		echo json_encode($result);
		
		
		}
		// A implémenter dans un framework....
	}
	else echo "No method."


?>
