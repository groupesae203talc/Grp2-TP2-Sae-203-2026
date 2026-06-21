<?php
$couleur_bulle_classe = "rose";
$page_active = "redaction";

// on se sert de cette variable pour que si la connexion avec la bdd échoue, que la variable de la boucle qui est faite
// (ligne 56) ne soit pas inexistante, et que ça évide de nous afficher Warning: Undefined variable
$resultat_brut = null;

require_once('./ressources/includes/connexion-bdd.php');

// on vérifie si la connexion bdd s'est bien faite
if (isset($mysqli_link) && $mysqli_link !== false) {
    $requete_brute = "
        SELECT 
            auteur.*, 
            COUNT(article.id) AS nombre_articles    
        FROM auteur 
        LEFT JOIN article ON article.auteur_id = auteur.id 
        GROUP BY auteur.id
    ";
    // on a ici sélectionné toutes les informations nécéssaires pour la présentation des auteurs avec la ligne 16, qui compte le nombre d'articles qui a un id d'auteur commun
    // ce code a procédé de manière suivante : en comptant le nombre d'articles, on a "organisé" les articles par auteurs,
    // c'est-à-dire que tous les articles rédigés par l'auteur X, vont apparaitre en début de liste, celui de l'auteur y vont apparaitre à la suite... et ceci grâce à "Group by"
    // left join sert à inscrire l'ensemble des auteurs, peu importe le nombre d'articles écrits. à l'inverse, si ça aurait été inner join, ils n'auraient pas été pris en compte.
    // le on définit la condition de correspondance : relier la clé étrangère auteur_id (dans la table article) à la clé primaire id (dans la table auteur)
    $resultat_brut = mysqli_query($mysqli_link, $requete_brute);
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <base href="/<?php echo $_ENV['CHEMIN_BASE']; ?>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Equipe de rédaction - SAÉ 203</title>

    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/reset.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/fonts.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/global.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/header.css">
<link rel="stylesheet" href="./ressources/css/equipe-de-redaction.css?v=3"></head>

<body>
    <?php require_once('./ressources/includes/top-navigation.php'); ?>
    <?php
    // facultatif
    require_once('./ressources/includes/bulle.php');
    ?>

    <main class="conteneur-principal conteneur-1280">
        <h1 class="titre">Équipe de rédaction</h1>

        <section class="liste-auteur">
            
            <?php 
            // on vérifie qu'on a bien un résultat positif de la bdd avant de faire la boucle
            if ($resultat_brut) {
                while ($auteur = mysqli_fetch_array($resultat_brut, MYSQLI_ASSOC)) { 
                    $avatar = $auteur['lien_avatar'];                ?>
                <article class="carte-auteur">
                        <div class="photo-auteur">
                            <img src="<?php echo $avatar; ?>" alt="Photo de <?php echo $auteur['prenom'] . ' ' . $auteur['nom']; ?>" class="photo">
                        </div>
                        
                        <div class="informations-auteur">
                            <h2 class="prenom-auteur">
                                <?php echo $auteur['prenom']; ?> 
                                <span class="nom-famille"><?php echo $auteur['nom']; ?></span>
                            </h2>

                            <?php if (!empty($auteur['lien_twitter'])) { ?>
                                <p class="twitter-auteur">
                                    <a href="<?php echo $auteur['lien_twitter']; ?>"> 
                                    @<?php echo basename($auteur['lien_twitter']); ?>
                                    </a>
                                </p>
                            <?php } ?>
                            <p class="nombre-articles">
                                    <?php 
                                    $nb = $auteur['nombre_articles'];
                                    echo $nb . ' ' . ($nb > 1 ? 'articles écrits' : 'article écrit'); 
                                    ?>
                                </p>
                        </div>
                    </article>
                <?php 
                }
            } else { 
                // message de secours si la base de données est vide ou déconnectée
                echo "<p class='erreur-bdd'>Impossible de charger les membres de l'équipe. Vérifiez la connexion à la base de données.</p>";
            } 
            ?>

        </section>
        </main>
    <?php require_once('./ressources/includes/footer.php'); ?>
</body>

</html>