<?php
$couleur_bulle_classe = "rose";
$page_active = "index";

require_once('./ressources/includes/connexion-bdd.php');

// on récupère l'id dans l'url, sinon on met 1 
$id = isset($_GET['id']) ? intval($_GET['id']) : 1;

// on récupère depuis la table auteur le nom et prénom de l'auteur de l'article
// on a rajouté une jointure (left join) parce que sinon la page n'était pas capable d'afficher qui a écrit le texte
$requete_brute = "
    SELECT article.*, auteur.nom AS auteur_nom, auteur.prenom AS auteur_prenom 
    FROM article
    LEFT JOIN auteur ON article.auteur_id = auteur.id
    WHERE article.id = $id
";
$resultat_brut = mysqli_query($mysqli_link, $requete_brute);
$entite = mysqli_fetch_array($resultat_brut);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <base href="/<?php echo $_ENV['CHEMIN_BASE']; ?>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article - SAÉ 203</title>

    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/reset.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/fonts.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/global.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/header.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/accueil.css">

    <link rel="stylesheet" href="./ressources/css/accueil.css">
    <link rel="stylesheet" href="./ressources/css/article.css">
</head>

<body>
    <?php require_once('./ressources/includes/top-navigation.php'); ?>
    <?php require_once('./ressources/includes/bulle.php'); ?>
    <main class="conteneur-principal conteneur-1280 article-unique">
        <a href="index.php" class="lien-retour">
            <span class="fleche">&larr;</span> Retour à l'accueil
        </a>
        <?php 
        // on s'assure que l'article est bien dans la bdd
        if ($entite): 
            $date_creation = "Date inconnue";
            if (!empty($entite["date_creation"])) {
                // on met la date au propre avec un format d/m/y beaucoup plus lisible pour nous
                $date_obj = new DateTime($entite["date_creation"]);
                $date_creation = $date_obj->format('d/m/Y');
            }

            $auteur_prenom = $entite["auteur_prenom"] ?? '';
            $auteur_nom = $entite["auteur_nom"] ?? '';
            $auteur_complet = trim($auteur_prenom . ' ' . $auteur_nom);
            
            if (empty($auteur_complet)) {
                $auteur_complet = "Auteur anonyme";
            }
        ?>
            <h1 class="titre-article"><?php echo htmlentities($entite["titre"] ?? ''); ?></h1>
            
            <?php if (!empty($entite["chapo"])): ?>
                <p class="chapo-article texte-gras"><?php echo nl2br(htmlentities($entite["chapo"])); ?></p>
            <?php endif; ?>

            <?php 
            $texte_complet = $entite["contenu"] ?? ''; 
            // la grosse astuce php de la page : on coupe tout le bloc de texte à chaque saut de ligne pour le transformer en tableau de petits paragraphes, ça va nous permettre de glisser l'image en haut et la vidéo en bas
            $paragraphes = array_filter(explode("\n", $texte_complet), 'trim');
            $nombre_p = count($paragraphes);

            if ($nombre_p > 0): 
                // array_shift sert à mettre le tout premier paragraphe de côté pour l'afficher direct à côté de la photo
                $premier_p = array_shift($paragraphes);
                
                // s'il n'y a qu'un paragraphe, le dernier paragraphe est le même que le premier, parce qu'autrement, la vidéo ne s'affiche pas s'il n'y a qu'un paragraphe
                $dernier_p = ($nombre_p > 1) ? array_pop($paragraphes) : $premier_p;
            ?>

                <section class="bloc-article section-photo">
                    <div class="media-conteneur photo">
                        <img src="<?php echo $entite['image'] ?? ''; ?>" alt="Image de l'article">
                    </div>
                    <div class="texte">
                        <p><?php echo nl2br(htmlentities($premier_p)); ?></p>
                        
                        <?php if ($nombre_p > 2 && !empty($paragraphes)): 
                            $deuxieme_p = array_shift($paragraphes);
                        ?>
                            <p class="paragraphe-suite"><?php echo nl2br(htmlentities($deuxieme_p)); ?></p>
                        <?php endif; ?>
                    </div>
                </section>

                <?php if (!empty($paragraphes)): ?>
                    <section class="bloc-article section-intermediaire">
                        <?php foreach ($paragraphes as $p): ?>
                            <p><?php echo nl2br(htmlentities($p)); ?></p>
                        <?php endforeach; ?>
                    </section>
                <?php endif; ?>

                <section class="bloc-article section-video">
                    <div class="media-conteneur video">
                        <iframe src="<?php echo $entite['lien_yt'] ?? ''; ?>" title="Lecteur vidéo" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <div class="texte">
                        <p><?php echo nl2br(htmlentities($dernier_p)); ?></p>
                    </div>
                </section>

            <?php else: ?>
                <p>Cet article ne contient aucun texte pour le moment.</p>
            <?php endif; ?>

            <p class="metadonnees-article">
                Publié le <?php echo $date_creation; ?> par <span class="texte-gras"><?php echo htmlentities($auteur_complet); ?></span>
            </p>

        <?php else: ?>
            <h1 class="titre-article">Article introuvable</h1>
            <p>L'article demandé n'existe pas ou a été supprimé.</p>
        <?php endif; ?>
    </main>
    
    <?php require_once('./ressources/includes/footer.php'); ?>
</body>

</html>