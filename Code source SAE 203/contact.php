<?php
/* ici on ajoute la fonction session start pour corriger le probème des doublons de soumission de furmulaire. ceci permet de démarrer une session à chaque rafraichissement de la page et donc d'éviter de stocker plusieurs mêmes soumission de formulaire dans la bdd*/
session_start();

$couleur_bulle_classe = "jaune";
$page_active = "contact";

$formulaire_a_erreurs = false;
$formulaire_soumis = !empty($_POST);

require_once('./ressources/includes/connexion-bdd.php');

$affichage_succes = false; // ici on part du principe que le message n'est pas envoyé pour montrer le formulaire vide
// méthode post-redirect-get : on regarde si l'url confirme le succès de l'envoi et si on a gardé la preuve en session
if (isset($_GET['envoi']) && $_GET['envoi'] == 'succes' && isset($_SESSION['message_envoye'])) {
    // si l'url affiche un succès (?envoi=succes dans l'url) et qu'on a une preuve (qui représente dans ce code ($_SESSION['message_envoye'])) que le formulaire a bien été envoyé
    $affichage_succes = true;
    // dans ce cas là, on permet au message de confirmation de s'afficher
    unset($_SESSION['message_envoye']);
}// ici on supprime la preuve donc le message de confirmation pour éviter qu'il apparaisse à nouveau quand on rafraichit la page
// on a utilisé la méthode "post-redirect-get" qui règle le problème de la double soumission du formulaire. cette méthode consiste à soumettre dans un premier temps le formulaire via la méthode post, 
// redirect sert à recherger la page proprement et le get permet de revenir à la page initial avec "envoi=succes" dans la barre de recherche pour confirmer l'envoi des données.

if ($formulaire_soumis) {
    /* etant donné que nous avons ajouté la catégorie du n° de téléphone, il devient obligatoire à la soumission du formulaire*/
    // on a rajouté les champs téléphone et thème dans la vérification pour que tout soit bien obligatoire avant l'envoi
    if (!empty($_POST["prenom"]) && !empty($_POST["nom"]) && !empty($_POST["message"]) && !empty($_POST["email"]) && !empty($_POST["telephone"]) && !empty($_POST["je_suis"]) && !empty($_POST["theme"])) {        
        $nom = htmlentities($_POST["nom"]);
        $prenom = htmlentities($_POST["prenom"]);
        $message = htmlentities($_POST["message"]);
        $email = htmlentities($_POST["email"]);
        $telephone = htmlentities($_POST["telephone"]);
        $type = htmlentities($_POST["je_suis"]);
        $theme = htmlentities($_POST["theme"]);

        $date = new DateTimeImmutable();
        $date_formatte = $date->format('Y-m-d H:i:s');

        // on a adapté la requête sql pour bien intégrer les nouvelles colonnes qu'on a ajoutées dans la bdd (téléphone et thème)
        $requete_brute = "
            INSERT INTO message(nom, prenom, contenu, email, telephone, type, theme, date_creation)
            VALUES ('$nom', '$prenom', '$message', '$email', '$telephone','$type', '$theme', '$date_formatte') 
        ";// on a également modifié la requête étant donné que c'est la source même du problème qui nous empêchait de stocker l'ensemble des données

        $resultat_brut = mysqli_query($mysqli_link, $requete_brute);

        if ($resultat_brut !== false) {
        // on vérifie que les données ont bien été transmises dans la bdd
        $_SESSION['message_envoye'] = true;
        // c'est ici qu'on a créer la "preuve" et qui permet d'enregistrer l'envoi pour s'en souvenir pour la redirection
            // c'est reparti pour un tour, on recharge proprement la page avec le petit mot-clé dans l'url
            header("Location: contact.php?envoi=succes");

            exit(); // cela explique au navigateur que c'est fini, parce que sinon la page qui se rechargera sera celle de la confirmation du message envoyé
        } else {
            $formulaire_a_erreurs = true;
            // si les données n'ont pas été transférées vers la bdd, alors l'alerte d'erreur s'active
        }
    } else {
        $formulaire_a_erreurs = true;
    }
}
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <base href="/<?php echo $_ENV['CHEMIN_BASE']; ?>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - SAÉ 203</title>
    <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/4299/4299956.png">

    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/reset.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/fonts.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/global.css">
    <link rel="stylesheet" href="./ressources/css/ne-pas-modifier/header.css">
    <link rel="stylesheet" href="./ressources/css/contact.css">
</head>

<body>
    <?php require_once('./ressources/includes/top-navigation.php'); ?>

    <?php
    /* affichage de l'alerte d'erreur, on a gardé que le message d'erreur étant donné que le message de confirmation est plus bas dans la page  */
    if ($formulaire_soumis && $formulaire_a_erreurs) {
        echo "
            <section class='banniere-alerte erreur' role='alert' style='margin-bottom: 1rem;'>
                <p>Votre message n'a pas pu être envoyé. Vérifiez que tous les champs soient bien remplis avant de soumettre vos réponses.</p>
            </section>
        ";
    }
    ?>

    <?php require_once('./ressources/includes/bulle.php'); ?>

    <main class="conteneur-principal conteneur-1280">
                    <?php if ($affichage_succes): ?> 
            <section id="message-confirmation">
                <h1 id="titre-confirmation">VOTRE MESSAGE A BIEN ÉTÉ TRANSMIS !</h1>
                <p id="paragraphe-confirmation">NOUS VOUS FOURNIRONS UNE RÉPONSE DÈS QUE POSSIBLE</p>
                <a href="index.php" id="bouton-retour-accueil">RETOUR À L'ACCUEIL</a>
                        </section>
        <?php else: ?>
            <h1 class="titre">Plus d'infos sur la formation ? <br> Contactez-nous !</h1>
            <p class="paragraphe">
                <span class="texte-gras">La formation s'ouvre à tous les bacheliers,</span> pour rappel. Avoir des connaissances en programmation, design ou encore audiovisuel n'est pas obligatoire mais reste un bon atout, car il faut aimer la curiosité dans cette formation pluridisciplinaire. <span class="texte-gras">Il est également possible de faire la formation après une reprise d'études ou une réorientation.
            </p>

            <section class="formulaire-contact">
                <form action="" method="POST">
                    <article class="champ-conteneur">
                        <label for="prenom" class="label-champ texte-gras">Prénom*</label>
                        <input type="text" name="prenom" id="prenom" class="champ" placeholder="Exemple : Magalie"required>
                    </article>
                    <article class="champ-conteneur">
                        <label for="nom" class="label-champ texte-gras">Nom*</label>
                        <input type="text" name="nom" id="nom" class="champ" placeholder="Exemple : Dupont"required>
                    </article>
                    <article class="champ-conteneur">
                        <label for="email" class="label-champ texte-gras">Adresse e-mail*</label>
                        <input type="email" name="email" id="email" class="champ" placeholder="Exemple : dupont.magalie@gmail.com"required>
                    </article>
                                <article class="champ-conteneur">
                        <label for="telephone" class="label-champ texte-gras">Numéro de téléphone*</label>
                        <input type="tel" name="telephone" id="telephone" class="champ" placeholder ="Exemple : 0601040304" maxlength="10" pattern="[0-9]{10}" required>
                        </article>
                    <article class="champ-conteneur">
                        <label for="theme" class="label-champ texte-gras">Thème*</label>
                        <select id="theme" name="theme" class="champ" required>
                            <option value="">-- Choisissez un thème --</option>
                            <option value="programme">Le Programme National MMI</option>
                            <option value="vie-etudiante">La Vie Étudiante & Campus</option>
                            <option value="inscriptions">Inscriptions </option>
                            <option value="technique">Problème technique ou Autre</option>
                        </select>
                    </article>
                    <article class="champ-conteneur">
                        <label for="message" class="label-champ texte-gras">Message*</label>
                        <textarea name="message" id="message" cols="30" rows="10" class="champ" placeholder="Exemple : Je veux en savoir plus" required></textarea>
                    </article>
                    <article class="champ-conteneur">
                        <p class="label-champ texte-gras">Je suis*</p>
                        <ul class="liste-choix">
                            <li class="choix">
                                <input type="radio" name="je_suis" id="pas_precise" value="pas_precise">
                                <label for="pas_precise">Je ne souhaite pas le préciser</label>
                            </li>
                            <li class="choix">
                                <input type="radio" name="je_suis" id="etudiant" value="etudiant">
                                <label for="etudiant">Étudiant / Étudiante</label>
                            </li>
                            <li class="choix">
                                <input type="radio" name="je_suis" id="parent" value="parent">
                                <label for="parent">Parent</label>
                            </li>
                            <li class="choix">
                                <input type="radio" name="je_suis" id="autre" value="autre">
                                <label for="autre">Autre</label>
                            </li>
                        </ul>
                    </article>
                    <article class="champ-conteneur">
                        <button type="submit" class="btn-envoi texte-gras">ENVOYER</button>
                    </article>
                </form>
            </section>
        <?php endif; ?>

        <p class="titre">Nous contacter par courrier</p>
        <p class="paragraphe">
            IUT de Cergy-Pontoise,<br>
            Département Métiers du Multimédia et de l’Internet (MMI) <br>
            34 Bis Boulevard Henri Bergson <br>
            95200 Sarcelles
        </p>
    </main>

    <?php require_once('./ressources/includes/footer.php'); ?>
</body>
</html>