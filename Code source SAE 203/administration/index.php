<?php

session_start(); //l'ouverture de la session permet de savoir si une personne est autorisé à avoir accès à cette page et permet de reconnaitre quelqu'un même lorsqu'il page d'une page à l'autre[cite: 2, 3]

require_once("../ressources/includes/connexion-bdd.php");
//on récupére directement les données dans le fichier env.prod grâce aux variables UTILISATEUR_BDD et MDP_BDD en demandant à PHP d'aller directement regarder, plutôt que d'écrire en brut, ce qui peut manquer de sécurité[cite: 2, 3]
$admin_attendu = $_ENV['UTILISATEUR_BDD'] ?? "groupe-sae203"; //la notion entre parenthèses est au cas ou le navigateur ne prend pas en compte ce qu'il y a entre crochets, il aura toujours la solution entre guillemets[cite: 3]
$mdp_attendu = $_ENV['ADMIN_PASSWORD'] ?? "Sae2.03"; 

$erreur = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['login'] === $admin_attendu && $_POST['password'] === $mdp_attendu) { //on enregistre les saisies de l'utilisateur et les compare aux bonnes données (variables ..._attendu)[cite: 3]
        //si les données sont bonnes, on crée une session qui permet donc d'accéder aux autres pages et d'enregistrer "l'utilisateur"[cite: 2, 3]
        $_SESSION['admin_connecte'] = true;
        
        header("Location: articles/index.php");//à la suite de cela, on dirige donc l'utilisateur vers la page d'articles[cite: 3]
        exit();//on ferme l'espace de connexion étant donné que cette étape a été validée par l'utilisateur[cite: 2, 3]
    } else {
        $erreur = "Identifiants incorrects, l'accès est refusé.";//si l'étape de la connexion n'a pas été réussie, alors on affiche un message d'erreur[cite: 3]
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <?php include_once("./ressources/includes/head.php"); ?>
    <title>Connexion - Administration</title>
        <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/4299/4299956.png">

</head>

<body class="bg-gray-50">
    <header class="bg-white shadow">
        <div class="mx-auto max-w-[80rem] py-[1.5rem] px-[1rem]">
            <p class="text-[1.875rem] font-bold text-gray-900">Accès Administration</p>
        </div>
    </header>

    <main class="flex justify-center items-center" style="min-height: 60vh;">
        <div class="w-full max-w-[28rem] bg-white p-[2rem] rounded-[0.5rem] shadow border border-gray-200">
            
            <?php if($erreur): ?>
                <div class="bg-red-100 border border-red-400 text-red-700 px-[1rem] py-[0.75rem] rounded-[0.25rem] mb-[1rem]">
                    <?php echo $erreur; ?>
                </div>
            <?php endif; ?>

            <form method="POST" class="space-y-[1.5rem]">
                <div>
                    <label class="block text-[0.875rem] font-bold text-gray-700">Identifiant</label>
                    <input type="text" name="login" class="mt-[0.25rem] block w-full rounded-[0.375rem] border-gray-300 shadow-sm p-[0.5rem] border" required>
                </div>

                <div>
                    <label class="block text-[0.875rem] font-bold text-gray-700">Mot de passe</label>
                    <input type="password" name="password" class="mt-[0.25rem] block w-full rounded-[0.375rem] border-gray-300 shadow-sm p-[0.5rem] border" required>
                </div>

                <button type="submit" class="w-full bg-gray-900 text-white font-bold py-[0.75rem] px-[1rem] rounded-[0.5rem] hover:bg-gray-700 transition">
                    Se connecter
                </button>
            </form>
        </div>
    </main>

    <?php require_once("./ressources/includes/global-footer.php"); ?>
</body>
</html>