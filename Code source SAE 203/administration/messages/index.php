<?php
session_start();
//l'ouverture ou la création d'une session permet de se souvenir d'un utilisateur, afin de savoir s'il s'est connecté ou non
if (!isset($_SESSION['admin_connecte'])) {//ici on demande au navigateur si la session a passé l'étape de la connexion
    header("Location: ../index.php"); //auquel cas, on redirige l'utilisateur vers le formulaire de connexion
    exit();//on ferme la parenthèse de la connexion, pour pouvoir faire afficher la page 
}
require_once("../../ressources/includes/connexion-bdd.php");

$requete_brute = "SELECT * FROM message";
$resultat_brut = mysqli_query($mysqli_link, $requete_brute);

//on compte le nombre de lignes qui représente une soumission de formulaire par ligne dans la table message de la BDD
$nombre_messages = mysqli_num_rows($resultat_brut);

$page_courante = "messages";
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <?php include_once("../ressources/includes/head.php"); ?>
    <title>Liste messages - Administration</title>
</head>

<body>
<?php include_once "../ressources/includes/menu-principal.php"; ?>
    <header class="bg-white shadow">
        <div class="mx-auto max-w-7xl py-3 px-4">
            <p class="text-3xl font-bold text-gray-900">Liste messages reçus</p>
            <p class="text-gray-500 text-sm">Nombre de messages : <?php echo $nombre_messages; ?></p>
        </div>
    </header>
    <main>
        <div class="mx-auto max-w-7xl py-6 px-4">
            
            <div class="mt-4 overflow-auto max-h-[70vh] rounded-lg shadow bg-white">
                <table class="w-full bg-white border-collapse">
                    
                    <thead class="bg-gray-100 sticky top-0 z-10 shadow-sm">
                        <tr>
                            <th class="font-bold pl-8 py-5 text-left">Id</th>
                            <th class="font-bold pl-8 py-5 text-left">Nom</th>
                            <th class="font-bold pl-8 py-5 text-left">Prénom</th>
                            <th class="font-bold pl-8 py-5 text-left">Adresse e-mail</th>
                            <th class="font-bold pl-8 py-5 text-left">Numéro de téléphone</th>
                            <th class="font-bold pl-8 py-5 text-left">Thème</th>
                            <th class="font-bold pl-8 py-5 text-left">Message</th>
                            <th class="font-bold pl-8 py-5 text-left">Profil du contact</th>
                            <th class="font-bold pl-8 py-5 text-left">Date de création</th>
                        </tr>
                    </thead>
                    <tbody>
        <?php while ($element = mysqli_fetch_array($resultat_brut, MYSQLI_ASSOC)) { ?>
            <tr class="odd:bg-neutral-50 border-b-2 border-b-gray-100 last:border-b-0 first:border-t-2 first:border-t-gray-200">
                <td class="pl-8 p-4 font-bold" data-label="Id"><?php echo $element["id"]; ?></td>
                <td class="pl-8 p-4" data-label="Nom"><?php echo $element["nom"]; ?></td>
                <td class="pl-8 p-4" data-label="Prénom"><?php echo $element["prenom"]; ?></td>
                <td class="pl-8 p-4" data-label="Email"><?php echo $element["email"]; ?></td>
                <td class="pl-8 p-4" data-label="Téléphone"><?php echo $element["telephone"]; ?></td>
                <td class="pl-8 p-4" data-label="Thème"><?php echo $element["theme"]; ?></td>
                <td class="pl-8 p-4" data-label="Message"><?php echo $element["contenu"]; ?></td>
                <td class="pl-8 p-4" data-label="Type"><?php echo $element["type"]; ?></td>
                <td class="pl-8 p-4" data-label="Date de création"><?php echo $element["date_creation"]; ?></td> 
            </tr>
        <?php } ?>
    </tbody>
                </table>
            </div>
        </div>
    </main>
    <?php require_once("../ressources/includes/global-footer.php"); ?>
</body>
</html>