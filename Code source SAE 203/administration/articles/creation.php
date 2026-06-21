<?php
// connexion à la base de données
require_once('../../ressources/includes/connexion-bdd.php');

$page_courante = "articles";

// récupération de la liste des auteurs pour le menu déroulant
$requete_auteurs = "SELECT id, nom, prenom FROM auteur ORDER BY prenom ASC";
$resultat_auteurs = mysqli_query($mysqli_link, $requete_auteurs);

$formulaire_soumis = !empty($_POST);

if ($formulaire_soumis) {
    // vérification que les champs requis ne sont pas vides
    if (!empty($_POST["titre"]) && !empty($_POST["chapo"]) && !empty($_POST["contenu"]) && !empty($_POST["auteur_id"])) {
        
        // sécurisation des entrées pour éviter les injections sql
        $titre = mysqli_real_escape_string($mysqli_link, $_POST["titre"]);
        $chapo = mysqli_real_escape_string($mysqli_link, $_POST["chapo"]);
        $contenu = mysqli_real_escape_string($mysqli_link, $_POST["contenu"]);
        $image = mysqli_real_escape_string($mysqli_link, $_POST["image"]);
        $lien_yt = mysqli_real_escape_string($mysqli_link, $_POST["lien_yt"]);
        $auteur_id = intval($_POST["auteur_id"]); 
        
        // génération de la date automatique
        $date = new DateTimeImmutable();
        $date_formatte = $date->format('Y-m-d H:i:s');

        // requête d'insertion avec les colonnes exactes de ta bdd
        $requete_brute = "INSERT INTO article (titre, chapo, contenu, image, lien_yt, auteur_id, date_creation) 
                           VALUES ('$titre', '$chapo', '$contenu', '$image', '$lien_yt', $auteur_id, '$date_formatte')";

        $resultat_brut = mysqli_query($mysqli_link, $requete_brute);

        if ($resultat_brut) {
            // redirection vers la liste en cas de succès
            header("Location: index.php");
            exit();
        } else {
            // affichage de l'erreur sql si ça plante
            die("Erreur MySQL : " . mysqli_error($mysqli_link));
        }
    } else {
        echo "Attention : il manque des informations obligatoires dans le formulaire.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <?php include_once("../ressources/includes/head.php"); ?>
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/4299/4299956.png">
    <title>Création Article - Administration</title>
</head>

<body>
    <?php include_once '../ressources/includes/menu-principal.php'; ?>
    <header class="bg-white shadow">
        <div class="mx-auto max-w-7xl py-3 px-4">
            <p class="text-3xl font-bold text-gray-900">Créer un article</p>
        </div>
    </header>
    <main>
        <div class="mx-auto max-w-7xl py-6 px-4">
            <form method="POST" action="creation.php" class="rounded-lg bg-white p-4 shadow border-gray-300 border-1">
                <section class="grid gap-6">
                    <div class="col-span-12">
                        <label for="titre" class="block text-lg font-medium text-gray-700">Titre*</label>
                        <input type="text" name="titre" id="titre" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" required>
                    </div>
                    
                    <div class="col-span-12">
                        <label for="chapo" class="block text-lg font-medium text-gray-700">Chapô*</label>
                        <textarea name="chapo" id="chapo" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" required></textarea>
                    </div>
                    
                    <div class="col-span-12">
                        <label for="contenu" class="block text-lg font-medium text-gray-700">Contenu*</label>
                        <textarea name="contenu" id="contenu" rows="8" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" required></textarea>
                    </div>
                    
                    <div class="col-span-12">
                        <label for="image" class="block text-lg font-medium text-gray-700">Lien de l'image</label>
                        <input type="url" name="image" id="image" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    </div>
                    
                    <div class="col-span-12">
                        <label for="lien_yt" class="block text-lg font-medium text-gray-700">Lien de la vidéo YouTube</label>
                        <input type="url" name="lien_yt" id="lien_yt" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    </div>
                    
                    <div class="col-span-12 md:col-span-6">
                        <label for="auteur_id" class="block text-lg font-medium text-gray-700">Auteur de l'article*</label>
                        <select name="auteur_id" id="auteur_id" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500" required>
                            <option value="">-- Choisissez un auteur --</option>
                            <?php 
                            if ($resultat_auteurs) {
                                while ($auteur = mysqli_fetch_array($resultat_auteurs, MYSQLI_ASSOC)) { 
                                    echo '<option value="'.$auteur['id'].'">'.htmlentities($auteur['prenom'].' '.$auteur['nom']).'</option>';
                                } 
                            }
                            ?>
                        </select>
                    </div>

                    <div class="col-span-12 mt-4">
                        <button type="submit" class="rounded-md bg-indigo-600 py-2 px-4 text-lg font-medium text-white shadow-sm hover:bg-indigo-700">Créer</button>
                    </div>
                </section>
            </form>
        </div>
    </main>
    <?php require_once("../ressources/includes/global-footer.php"); ?>
</body>
</html>