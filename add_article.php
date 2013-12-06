<?php

require_once("/controleur/produit/controleurProduit.php");

?>

<?php
	if(isset($_POST['validation'])) {
		if(isset($_POST['nom']) &&
			isset($_POST['description']) &&
			isset($_POST['categoriearticle']) &&
			isset($_POST['categorieutilisateur']) &&
			isset($_POST['restrictionage'])) {
		
			ajouterArticle($_POST['nom'], $_POST['description'], $_POST['restrictionage'], $_POST['categorieutilisateur'], $_POST['categoriearticle']);
		
			echo 'Article '.$_POST['nom'].' ajouté !';
		}else{
			echo 'Veuillez renseigner tous les champs !';
		}
	}
?>

<form method="POST" action="index.php">
	<label for="nom">Nom de l'article : </label>
	<input type="text" name="nom" /><br/>
	
	
	<label for="description">Description : </label>
	<textarea name="description" ></textarea><br/>
	
	<label for="categoriearticle">Catégorie de l'article : </label>
	<select name="categoriearticle">
		<?php
			$donnees = selectAllCatArticles();
			while($reponse = mysql_fetch_array($donnees)) {
		?>
				<option name="<?php echo $reponse['nom'];?>" value="<?php echo $reponse['id']; ?>"><?php echo $reponse['nom']; ?></option>
		<?php
			}
		?>
		
	</select><br/>
	
	<label for="categorieutilisateur">Catégorie Utilisateur</label>
	<select name="categorieutilisateur">
		<?php
			$donnees = selectAllCatUtilisateurs();
			while($reponse = mysql_fetch_array($donnees)) {
		?>
				<option name="<?php echo $reponse['nom'];?>" value="<?php echo $reponse['id']; ?>"><?php echo $reponse['nom']; ?></option>
		<?php
			}
		?>
	</select><br/>
	
	<label for="restrictionage">Restriction de l'age : </label>
	<input type="text" name="restrictionage" /><br/>
	<br/><br/>
	<input type="submit" name="validation" value="Ajouter le produit" />
</form>