-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql-groupe-sae203.alwaysdata.net
-- Generation Time: Jun 22, 2026 at 01:02 AM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groupe-sae203_talc`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `auteur_id` int(11) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `chapo` longtext NOT NULL,
  `contenu` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `lien_yt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `auteur_id`, `titre`, `chapo`, `contenu`, `image`, `date_creation`, `lien_yt`) VALUES
(7, 1, 'Les Projets Tutorés : Un ancrage local fort', 'Les étudiants mettent leurs compétences au service des associations et entreprises de Sarcelles et du Val-d\'Oise.', 'Le Projet Tutoré est une composante essentielle de la formation en BUT MMI à Sarcelles. Durant plusieurs mois, les étudiants travaillent en agence de communication fictive pour répondre aux besoins d\'un véritable client. Il s\'agit souvent d\'associations locales, de mairies ou de petites entreprises du secteur qui ont besoin de refondre leur identité visuelle ou de créer un site internet moderne. \r\n\r\nCe travail demande une grande polyvalence : il faut d\'abord réaliser un audit de la communication existante, puis proposer une nouvelle charte graphique (logo, couleurs, typographies). Ensuite, les étudiants passent à la phase de développement web en utilisant HTML, CSS et parfois des CMS comme WordPress. Le projet se termine par une soutenance orale devant un jury composé d\'enseignants et du client. C\'est une expérience marquante qui permet aux étudiants de se constituer un portfolio professionnel solide avant même d\'entrer en stage. \r\n\r\nCela renforce également le lien entre l\'université et la ville de Sarcelles, montrant que les jeunes talents du territoire sont capables de porter des projets technologiques complexes et utiles.', 'https://cyiut.cyu.fr/medias/photo/img-9234-f_1758615535467-JPG', '2026-05-06 13:35:00', 'https://www.youtube.com/embed/iVNlVXkuQJY?si=Bqcc7iv6neWOBNXT'),
(8, 5, 'Le Workshop UX Design : Penser l\'utilisateur', 'Une semaine intensive dédiée à l\'expérience utilisateur pour apprendre à concevoir des interfaces intuitives et centrées sur l\'humain.', 'Le workshop UX Design est un moment fort du semestre pour les étudiants de deuxième année. Durant cinq jours, ils oublient le code pour se concentrer sur la psychologie de l\'utilisateur. \r\n\r\nL\'objectif est de résoudre un problème concret : comment rendre une application de transport ou un site de mairie plus simple à utiliser ? Les étudiants commencent par créer des \"personae\", des personnages fictifs représentant les futurs usagers. Ils dessinent ensuite des \"wireframes\", des squelettes de pages en noir et blanc, pour tester l\'organisation des informations sans être distraits par les couleurs. Ce travail demande beaucoup d\'empathie et d\'observation. \r\n\r\nÀ la fin de la semaine, les prototypes sont testés par d\'autres étudiants pour identifier les blocages. C\'est une étape cruciale car, comme on le dit souvent à l\'IUT, \"un beau design qui ne fonctionne pas est un mauvais design\". Cette compétence est aujourd\'hui l\'une des plus recherchées en agence web.', 'https://www.adimeo.com/hubfs/ADIMEO/Visuels_illustration/cartographie-de-l-ux-user-journey-experience-map-ou-blueprint%20(1).webp', '2026-05-06 13:41:00', 'https://www.youtube.com/embed/bKTEgPaxxRY?si=8MOghK5c0Nu_bsSk'),
(9, 3, 'Maîtriser le SEO : Être visible sur Google', 'Apprendre les techniques de référencement naturel pour propulser un site web en haut des résultats de recherche.', 'Dans le module de marketing numérique, le SEO (Search Engine Optimization) occupe une place centrale. Les étudiants apprennent que créer un site ne suffit pas : il faut qu\'il soit trouvable. \r\n\r\nLe cours détaille les trois piliers du référencement : la technique (vitesse du site, balises HTML), le contenu (choix des mots-clés) et la popularité (liens externes). Les élèves utilisent des outils professionnels pour analyser la concurrence et optimiser leurs articles. Ils découvrent comment les algorithmes de Google lisent une page et pourquoi une structure de titres h1, h2, h3 est vitale pour l\'accessibilité et le classement. \r\n\r\nC\'est un travail de précision qui mêle rédaction rédactionnelle et rigueur informatique. Un bon référenceur doit savoir anticiper les questions des internautes pour y répondre avec pertinence. À Sarcelles, cet apprentissage est mis en pratique lors des projets tutorés pour aider les partenaires locaux à gagner en visibilité.', 'https://arobaseprime.fr/wp-content/uploads/2025/05/etre-visible-sur-google-seo-reussi.png', '2026-05-06 13:44:50', 'https://www.youtube.com/embed/4nu18uTOnKY?si=dAntYCPp4PLJ3Q2I'),
(12, 3, 'La Nuit de l\'Info : Le défi annuel des MMI Sarcelles', 'Une nuit entière pour coder, designer et intégrer un site web : retour sur l\'événement phare qui mobilise les étudiants de l\'IUT.', 'La Nuit de l\'Info est un événement national que le département MMI de Sarcelles suit avec ferveur chaque année au mois de décembre. De 16h38 au lever du soleil le lendemain à 8h08, les étudiants se regroupent par équipes pour répondre à une problématique posée par une association ou une entreprise. L\'objectif est de produire un site web ou une application tout en relevant des \"défis\" techniques et créatifs (accessibilité, design, animation). \r\n\r\nÀ Sarcelles, l\'ambiance est unique : les salles de cours se transforment en véritables \"war rooms\" remplies de café, de pizzas et de lignes de code. C\'est un moment crucial pour la cohésion d\'équipe, où les étudiants de deuxième année encadrent souvent les premières années pour leur transmettre leurs compétences en développement et en gestion de projet. Malgré la fatigue, l\'adrénaline de la compétition pousse les élèves à se dépasser pour rendre un projet fonctionnel au petit matin. Cet événement est une excellente préparation aux réalités du monde professionnel, où les délais de production sont parfois extrêmement courts.', 'https://www.semaine-nsi.fr/app/uploads/2024/10/Nuit-de-linfo-2024-1.png', '2026-05-06 13:50:54', 'https://www.youtube.com/embed/EjZ4afKBkDM?si=-DeOqduj4dsYhxvW'),
(13, 1, 'Partenariat stratégique signé avec les Philippines', 'Conclu par Laurent Gatineau, président de CY Cergy Paris Université, et Edgardo Carlo Vistan II, chancelier de l’University of the Philippines, ce partenariat bénéficie à la fois aux étudiants et aux communautés de recherche des deux établissements.', 'CY Cergy Paris Université et l’Université des Philippines Diliman (UPD), université nationale des Philippines, signent un protocole d’accord (Memorandum of Understanding) destiné à structurer leur coopération académique et scientifique, basé sur un principe de réciprocité prévoyant la mise en place de mobilités étudiantes, notamment dans le cadre du Mid-year Educational Program organisé par l’UPD. \r\n\r\nLes deux universités travaillent également au développement de formations conjointes, dont un double master en tourisme culturel, entièrement dispensé en anglais.\r\n\r\nSur le volet scientifique, CY Cergy Paris Université et l‘UPD engagent des travaux conjoints, en particulier dans les domaines du tourisme culturel et du tourisme autochtone. Les deux institutions contribuent au réseau international de recherche sur le patrimoine culturel matériel/immatériel et le tourisme \"INHERIT\", réseau de l\'école universitaire de recherche (EUR) Humanités, Création, Patrimoine, qui propose des diplômes universitaires, masters et doctorats par le projet en arts, architecture, paysage, création littéraire, conversation-restauration et études patrimoniales. Ce réseau, lancé en septembre 2025, fédère chercheurs et professionnels de tous les continents autour des enjeux liés au patrimoine culturel et au tourisme durable, à travers le regard des sciences humaines et sociales.\r\n\r\nLes échanges d’informations et de ressources académiques entre les établissements incluent l’élaboration conjointe d’une proposition dans le cadre du programme UNITWIN (University Twinning and Networking Programme) de l’Unesco avec un troisième partenaire international. La coopération se traduit par ailleurs par l’organisation de conférences, séminaires et colloques scientifiques, parmi lesquels la Philippine Research Conference on Tourisme and Hospitality (PRCTH), ainsi que par des coopérations éditoriales telles que l’évaluation de manuscrits pour la revue scientifique de l’EUR gérée par CY Cergy Paris Université.\r\n\r\nAvec cet accord, CY Cergy Paris Université et l’Université des Philippines Diliman réaffirment leur engagement commun en faveur de l’internationalisation de l’enseignement supérieur, du développement de la recherche et du renforcement des coopérations académiques entre l’Europe et l’Asie du Sud-Est. S’inscrivant dans la logique impulsée avec le lancement d’INHERIT par son EUR, CY Cergy Paris Université vient consolider son positionnement comme acteur scientifique engagé dans la coopération internationale.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/cy-upd.jpeg.webp?itok=suVBF4yE', '2026-05-09 16:43:01', 'https://youtube.com/embed/tegyPuLQgeE?si=cgZt6GX6cXPZ85sr'),
(14, 2, 'Lutte contre les violences sexistes et sexuelles', 'L\'université et l\'IUT de Sarcelles réaffirment leur tolérance zéro face aux violences et au harcèlement en milieu universitaire.', 'A l\'occasion de la journée internationale pour l\'élimination de la violence à l\'égard des femmes, une sensibilisation est proposée par le Crous de Versailles en partenariat avec CY Cergy Paris Université à l\'ensemble de la communauté étudiante.\r\n\r\nDepuis plusieurs années, et dans le cadre de l’usage de la CVEC, le Crous de Versailles s’engage pour la lutte contre les violences sexistes et sexuelles (VSS). Chaque année, une programmation académique est mise en place par le Crous de Versailles afin de sensibiliser un maximum d’étudiants sur l’académie.\r\n\r\nEn 2024, le Crous de Versailles fait intervenir Charline Vermont et l’association En avant toute(s) pour une tournée à destination de tous les étudiants.\r\nCharline Vermont est formatrice en santé sexuelle, enseignante à la Sorbonne et sexothérapeute. A travers son compte Instagram Orgasme_et_moi (près de 800k followers), elle permet au grand public de bénéficier d\'une éducation positive à la sexualité et au consentement. Ses livres Corps, Amour, Sexualité : les 120 questions que vos enfants vont vous poser et Corps, Amour, Sexualité : Y\'a pas d\'âge pour se poser des questions, parus aux éditions Albin Michel, sont des best-sellers. Elle est présente à la fois pour dédicacer son livre offert par le Crous de Versailles, et surtout pour échanger avec les étudiants et répondre à leurs questions.\r\nL’association En avant toute(s) est présente pour animer un stand de sensibilisation et installe son camion de sensibilisation au plus près des séances de dédicaces pour toucher un maximum d’étudiants et promouvoir les dispositifs existants et à disposition des étudiants et étudiantes victimes de VSS. Créée en 2013, l’association se développe autour d’actions concrètes visant à promouvoir l’égalité des genres, prévenir les violences de genre, s’adresser aux jeunes.\r\n\r\nRendez-vous le 29 novembre 2024 dans le hall des Chênes 1 de 11h30 à 14h30\r\n\r\nSéance de dédicaces et d\'échanges avec Charline Vermont, auteure de Corps, Amour, Sexualité : Y’a pas d’âge pour se poser des questions, dans le hall des Chênes 1.\r\nLe camion de l\'association En avant toute(s) est présent devant la MDE pour promouvoir les dispositifs d’aide disponibles pour les étudiants victimes de VSS.\r\nExposition \"Violences elles disent non\".\r\nTenue d\'un stand par le service santé étudiante (infirmiers, psychologue) qui propose différentes actions en lien avec les enjeux VSS : violentomètre géant, quiz consentement...\r\n\r\nUn stand organisé par l\'association He for She, où des étudiantes sage-femmes sensibilisent à la précarité menstruelle avec distribution de culottes menstruelles.', 'https://agenda.cyu.fr/medias/photo/pexels-polina-kovaleva-6185461_1729843472429-jpg', '2026-05-10 12:12:42', 'https://www.youtube.com/embed/JIREfaCQq04?si=9Qy5cuStjEGljVR-'),
(16, 2, 'Lancement du laboratoire commun SmartGaitLab', 'Aboutissement d\'une collaboration \"public-privé\" de longue date autour des enjeux de la détection des chutes, le laboratoire commun SmartGaitLab a été inauguré à l\'ENSEA le 27 janvier 2026.', 'Le laboratoire commun SmartGaitLab est un nouveau dispositif de recherche partenariale associant équipes académiques et acteurs socio-économiques autour d’objectifs scientifiques partagés. Il réunit le laboratoire ETIS (CY Cergy Paris Université/ENSEA/CNRS) et l’entreprise Bluelinea, spécialisée dans les solutions numériques pour l’accompagnement des personnes fragiles.\r\n\r\nSmartGaitLab est le premier laboratoire commun mis en place à CY Cergy Paris Université. Il s’inscrit dans le cadre des laboratoires communs, un programme de l\'Agence nationale de la recherche visant à renforcer les collaborations structurées entre la recherche publique et le monde économique. Un laboratoire commun repose sur un engagement de 54 mois, une gouvernance conjointe et un programme de recherche partagé, permettant de dépasser le cadre de projets ponctuels pour construire une coopération durable. Ce format favorise la co-production de connaissances, le transfert de technologies et l’émergence de solutions applicables dans des contextes réels.\r\n\r\nLes travaux de SmartGaitLab portent sur le dépistage précoce de la fragilité et la prévention des chutes, à partir de l’analyse de la démarche et des activités physiques. Le laboratoire s’appuie notamment sur des technologies d’imagerie radar, permettant une observation non intrusive des mouvements dans des environnements réels, tels que les établissements de santé ou les lieux de vie. Ces recherches visent à développer des outils d’aide à l’évaluation et au suivi, à destination des professionnels de santé et de l’accompagnement médico-social. Parmi les partenaires du laboratoire, l’EHPAD \"Le Château\" de Neuville-sur-Oise accueillera notamment des dispositifs expérimentaux.\r\n\r\nAu-delà de la recherche, le laboratoire commun constitue également un cadre de formation pour les doctorants, ingénieurs et étudiants impliqués dans les travaux. Il favorise l’exposition à des problématiques appliquées, le développement de compétences en recherche partenariale et une meilleure compréhension des enjeux du transfert technologique. \r\n\r\nLes enjeux sociétaux associés à ces travaux sont importants. Le vieillissement de la population et l’augmentation des situations de perte d’autonomie posent des défis majeurs en matière de prévention, de qualité de vie et de coûts pour les systèmes de santé. En combinant expertise scientifique et connaissance des usages de terrain, SmartGaitLab vise à produire des résultats directement exploitables, tout en contribuant à l’avancée des connaissances dans les domaines du traitement du signal, de l’analyse du mouvement et de la santé numérique.\r\n\r\nLe déploiement de ce nouveau laboratoire commun s\'inscrit dans la continuité des actions de CY Transfer, la structure dédiée à la valorisation de la recherche et au soutien aux partenariats avec les acteurs socio-économiques, et dans la dynamique du pôle universitaire d’innovation (PUI), dont CY Cergy Paris Université est l’un des acteurs. Le PUI vise à renforcer la lisibilité et l’efficacité des dispositifs d’innovation, en coordonnant les actions de soutien à la maturation de projets, au transfert de résultats de recherche et à la collaboration avec les entreprises.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/smartgaitlab.jpeg.webp?itok=tAPNrWKj', '2026-05-10 12:51:59', 'https://www.youtube.com/embed/MIT-L4uirCU?si=wltdJ6xpV0XLUfQA'),
(17, 5, 'L\'intelligence artificielle générative, amie ou ennemie des étudiants ?', 'Comment préparer les étudiants à composer avec les nouvelles technologies sans compromettre leur apprentissage ? Inès Chouk, enseignante-chercheuse en marketing, s’est lancée dans l’intégration des intelligences artificielles (IA) dans son cursus.', 'Maître de conférences HDR et chercheuse au laboratoire ThEMA, Inès Chouk scrute depuis plusieurs années ce moment fragile où une technologie rencontre (ou échoue à rencontrer) son public. Car contrairement à une idée encore tenace, une innovation ne s’impose jamais par sa seule sophistication technique. Elle s’installe, ou non, dans les usages et c’est précisément cette zone d’incertitude qu’elle cherche à éclairer pour la réduire.\r\n\r\nSes travaux portent sur l’acceptabilité des innovations technologiques par les consommateurs. Elle y distingue les freins fonctionnels (complexité d’utilisation, risque technique, utilité perçue) des freins psychologiques, plus discrets mais souvent décisifs : crainte pour la vie privée, peur de dépendance, sentiment d’être dépassé. \"Le rapport du consommateur à la technologie est multiple et ambivalent\", résume-t-elle. Dans cette ambivalence se jouent bien des échecs industriels.\r\n\r\nL’exemple de StopCovid, devenue TousAntiCovid, illustre la pertinence de cette analyse. L’application, d’abord boudée malgré son efficacité, n’a gagné en adoption qu’après une redéfinition centrée sur les usages réels, notamment avec l’intégration du passe sanitaire. Une bascule révélatrice : \"il faut passer d’une logique de performance technique à une logique d’usage\", insiste Inès Chouk. Pour les entreprises comme pour les pouvoirs publics, l’enjeu est d’intégrer l’utilisateur en amont, dans une véritable démarche de co-création, afin d’anticiper les freins et éviter ce \"biais d’optimisme\" qui consiste à croire qu’une technologie sera adoptée par évidence.\r\n\r\nFormer une génération qui pense avec (et non à travers) l’IA\r\n\r\nCette expertise sur l’adoption des technologies nourrit directement sa façon d’enseigner. Très tôt, dès l’essor des IA génératives, Inès Chouk a fait le choix de les intégrer à ses cours de marketing (mercatique) digital. Non par fascination technologique, mais par lucidité. La vitesse à laquelle ces outils ont été massivement adoptés constitue, selon elle, une rupture historique à laquelle il faut préparer les étudiants : les métiers du digital, du rédactionnel à la création visuelle, sont déjà transformés.\r\n\r\nAvec son collègue Bruno Gérard, elle a donc conçu des dispositifs pédagogiques où les étudiants utilisent l’IA pour rédiger des contenus, concevoir un site web, produire des visuels ou des logos. Mais l’objectif va bien au-delà de la maîtrise technique. Il s’agit de cultiver une intelligence critique : savoir interroger l’outil, formuler des requêtes pertinentes, comprendre ses biais et ses limites.\r\n\r\nUne approche pratique et critique\r\n\r\nPour ancrer cette dimension réflexive, les étudiants rédigent également chaque année un livre blanc destiné aux promotions suivantes. Ils y analysent les usages responsables de l’IA : fiabilité encore imparfaite, reproduction des biais humains, enjeux éthiques et environnementaux. Un exercice qui rappelle que ces technologies, aussi puissantes soient-elles, nécessitent vigilance et discernement.\r\n\r\nCar pour Inès Chouk, le cœur du sujet est là : une technologie n’est jamais bonne ou mauvaise en soi ; tout dépend de l’usage qu’on en fait. Le danger n’est pas l’IA elle-même, mais la tentation d’une délégation totale de la pensée. Les IA génératives doivent rester des outils, des soutiens à la créativité et à la réflexion, jamais un substitut.\r\n\r\nÀ mesure que ces technologies deviendront omniprésentes, la chercheuse plaide pour une formation qui, de l’école primaire à l’université, développe le réflexe critique indispensable à un usage éclairé. Apprivoiser sans s’aveugler : telle est, pour elle, la seule voie pour entrer sereinement dans cette nouvelle ère numérique.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/image_vupar_chouk.jpeg.webp?itok=MUutVWtW', '2026-05-10 12:53:59', 'https://www.youtube.com/embed/V7IF6ajaNhs?si=tPkYW1SCa76xYA-2'),
(18, 5, 'Projet européen Mobiccon-Proé', 'Le 13 novembre 2025, notre Université a accueilli la réunion plénière finale du projet Mobiccon-Pro, voué au développement de solutions concrètes pour réutiliser et recycler les matériaux de construction. Une réussite du programme Horizon Europe.', 'Un projet européen au service de l’économie circulaire\r\n\r\nLe secteur de la construction est responsable d’une part importante des déchets produits en Europe. Bétons, briques, mortiers, isolants : ces déchets de construction et de démolition (CDW, Construction and Demolition Waste) représentent un enjeu majeur pour la transition écologique. C’est dans ce contexte qu’a été lancé le projet Mobiccon-Pro (Mobile and Innovative Circularity for Construction Products). Financé par la Commission européenne dans le cadre du programme Horizon Europe, le projet réunit dix partenaires. Lancé en décembre 2022 pour une durée de cinq ans, il est coordonné par l’université d’architecture, de génie civil et de géodésie de Sofia (Bulgarie). Elhem Ghorbel, chercheuse au laboratoire L2MGC, fait partie des initiateurs du projet. Celui-ci bénéficie d’un budget total de près de 13 millions d’euros, dont plus de 9,5 millions financés par l’Union européenne.\r\n\r\nL’objectif est de concevoir un système mobile et innovant de traitement des déchets de construction, capable de transformer ces matériaux en nouvelles ressources locales. Une usine pilote mobile, baptisée \"Mobile Processing Plant\", permettra de trier, recycler et valoriser jusqu’à 55 000 tonnes de déchets par an. Les matériaux produits (granulats recyclés, mortiers, bétons ou briques) seront testés et certifiés pour être réutilisés dans de nouveaux chantiers.\r\n\r\nMobiccon-Pro vise ainsi à prouver qu’il est possible de mettre en place des \"hubs territoriaux de circularité\", où la démolition, le recyclage et la reconstruction s’articulent dans une même chaîne locale. L’objectif final est de démontrer la faisabilité technique et économique de ce modèle dans plusieurs pays européens et d’en assurer la reproductibilité.\r\n\r\nEn repensant le cycle de vie des matériaux de construction, Mobiccon-Pro explore une voie concrète pour réduire l’empreinte environnementale du secteur. Le projet vise à démontrer que les déchets de construction peuvent devenir des ressources, et que la circularité des matériaux est compatible avec la performance et la qualité exigées par le bâtiment moderne.\r\n\r\nLa contribution des experts en génie civil du L2MGC\r\n\r\nCY Cergy Paris Université est partenaire du projet à travers son laboratoire L2MGC (laboratoire de mécanique et matériaux du génie civil). L’équipe de recherche contribue au développement et à l’optimisation des nouveaux matériaux issus du recyclage, en s’appuyant sur son expertise reconnue dans le domaine des bétons et matériaux cimentaires.\r\n\r\nConcrètement, les chercheuses et chercheurs du L2MGC travaillent sur la formulation de bétons et mortiers intégrant des granulats ou liants recyclés. Ils étudient les propriétés mécaniques et la durabilité de ces matériaux, afin d’assurer leur conformité aux normes européennes et leur performance à long terme. Le laboratoire participe également à l’évaluation environnementale des produits obtenus, pour mesurer leur empreinte carbone et leur potentiel de réutilisation.\r\n\r\nCette participation prolonge une série de projets menés par le laboratoire autour du béton recyclé et de la valorisation des déchets minéraux, comme Recybeton, Ecoreb, Micro ou Minrescue. Elle illustre la continuité des travaux engagés depuis plusieurs années par les équipes de CY Cergy Paris Université dans le domaine de la construction durable et de l’économie circulaire.\r\n\r\nHorizon Europe, moteur de la recherche collaborative\r\n\r\nLe projet Mobiccon-Pro s’inscrit dans le cadre du programme Horizon Europe, principal outil de financement de la recherche et de l’innovation de l’Union européenne pour la période 2021-2027. Ce programme soutient des projets collaboratifs entre universités, instituts de recherche et entreprises autour de grands défis sociétaux : transition écologique, innovation industrielle, santé, numérique, énergie…', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/photo_mobiccon-pro_01.jpg.webp?itok=KP6DST_2', '2026-05-10 12:56:53', 'https://www.youtube.com/embed/0oAn9lBSUX8?si=wIJo1aa7w5tGIp9Y'),
(19, 1, 'Prix Des Femmes et des sciences CY Alliance 2025', 'CY Alliance honore chaque année des chercheuses dont les travaux allient excellence académique, innovation et engagement sociétal.', 'À travers ces prix, CY Alliance réaffirme son engagement en faveur de l’égalité, de la visibilité des femmes scientifiques et de la promotion d’une science inclusive. Le prix Des Femmes et des sciences 2025 met en lumière des chercheuses qui allient excellence académique, innovation et responsabilité sociale, ouvrant la voie à une nouvelle génération de femmes scientifiques. Comme chaque année, les prix ont été remis lors de la soirée d’ouverture de la Fête de la science de CY Alliance, le jeudi 2 octobre 2025, par Iryna Andriyanova, vice-présidente à la recherche, et Pascale Leturmy, chargée de mission science et société et science ouverte.\r\n\r\nPrix des \"doctorantes\"\r\nClaire Béranger (Laboratoire ETIS)\r\nDoctorante en sciences et technologies de l’information et de la communication, Claire Béranger concentre ses recherches sur la prévention des chutes chez les personnes âgées grâce à des technologies innovantes de détection par radar. Son approche repose sur l’analyse des signatures micro-Doppler et l’apprentissage profond afin de reconnaître les activités quotidiennes et d’anticiper les risques de chute. Elle travaille en étroite collaboration avec son public cible en menant des enquêtes de terrain dans un EHPAD, aux côtés du personnel soignant.\r\n\r\nAu-delà de ses contributions scientifiques, elle s’investit dans la diffusion des connaissances en participant à des conférences, des publications et des actions de médiation autour du vieillissement en bonne santé. Claire est particulièrement active lors de la Fête de la science de CY Alliance, aux côtés de son co-directeur de thèse, Petr Dobias. Ses travaux illustrent une recherche engagée, centrée sur l’autonomie et la dignité des personnes âgées.\r\n\r\nPrix des \"Jeunes chercheurs\"\r\nSara Berri (Laboratoire ETIS)\r\nSpécialiste des réseaux de communication nouvelle génération, Sara Berri est maîtresse de conférences et consacre ses recherches aux systèmes de transport intelligents, aux réseaux 5G/6G et à la sécurité des communications. Impliquée dans plusieurs projets européens, dont les projets EU SCALE et ROBUST 6G, elle contribue à optimiser les architectures de communication tout en garantissant la protection de la vie privée des utilisateurs et l’allocation intelligente des ressources réseau. Ses travaux ouvrent la voie au fonctionnement efficace des véhicules autonomes de demain. \r\n\r\nParallèlement à ses activités de recherche, elle enseigne et dirige le master Smart Communicating Systems à CY Tech. Elle s’investit également activement dans la promotion de la culture scientifique, en participant à des séminaires, des conférences et des journées portes ouvertes à CY Cergy Paris Université, où elle partage sa passion pour les sciences du numérique avec un large public.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/femmes-et-sciences-2025.jpeg.webp?itok=WkjvH25g', '2026-05-10 12:58:36', 'https://www.youtube.com/embed/D0ujJM1SvYI?si=-dFtxdgm8E8SWOsF'),
(20, 2, 'Une nouvelle piste pour améliorer la cicatrisation osseuse', 'Mathilde Hindié est lauréate de l\'appel 2025 du programme CY Initiative pour son projet biomédical visant à améliorer l’adhérence cellulaire, favoriser la cicatrisation osseuse et limiter le risque d’infections en chirurgie orthopédique.', 'Soutenu par CY Initiative dans le cadre de son appel à projets 2025, le projet E-BIOMIMOS explore de nouvelles pistes pour améliorer les biomatériaux utilisés en chirurgie orthopédique. Porté par Mathilde Hindié, ingénieure de recherche au laboratoire ERRMECe de CY Cergy Paris Université, il vise à développer des tissus en fibre de carbone dont la surface est modifiée par électrodéposition de phosphates de calcium enrichis en ions comme le strontium et le zinc. L’objectif : favoriser l’adhérence cellulaire, soutenir la cicatrisation osseuse et réduire les risques d’infection.\r\n\r\nÀ la croisée de la biologie, de la chimie et de l’ingénierie des matériaux, ce projet repose sur une collaboration entre plusieurs laboratoires et plateformes scientifiques de l’université. En apportant un financement pour les premières expérimentations et le développement de résultats préliminaires, CY Initiative permet d’amorcer cette recherche interdisciplinaire et d’envisager, à terme, des applications concrètes pour la réparation osseuse. Dans un entretien publié sur le site de CY Initiative, Mathilde Hindié revient sur son parcours et sur les ambitions scientifiques du projet.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/illustration-biomateriaux.jpeg.webp?itok=bPozafvO', '2026-05-10 13:00:03', 'https://www.youtube.com/embed/3pzuHQVHFoE?si=pEdsSMunDW1DR4nG'),
(21, 3, 'Station numixs, nouveau tiers-lieu au service du numérique', 'Implantée non loin du site de Sarcelles de l’IUT de Cergy-Pontoise, la Station numixs a été inaugurée le 29 avril 2025 pour répondre au besoin croissant de formation et d’accompagnement face aux mutations technologiques.', 'Porté par la communauté d’agglomération de Roissy Pays de France, le département du Val-d’Oise, la ville de Sarcelles en partenariat avec CY Cergy Paris Université et l’IUT de Cergy-Pontoise, ce nouvel espace d’expérimentation, de formation et d’entrepreneuriat dédié à l’innovation numérique a été pensé dans le but de favoriser l’entrepreneuriat dans le secteur et de simplifier la digitalisation des entreprises du territoire. Un accompagnement adapté à chaque profil est proposé dans ce tiers lieu ouvert à tous. Étudiants, habitants, porteurs de projet, startups, entreprises de la communauté d’agglomération peuvent ainsi accéder librement à ses locaux au mobilier inspiré du mouvement artistique et architectural centenaire du Bauhaus et bénéficier de différents services.\r\n\r\nCe lieu à l’esthétisme futuriste abrite le FacLab numixs de Sarcelles, bureaux et espaces de coworking, salles de formation, auditorium, incubateur et salle immersive dédiée aux expériences de réalité augmentée. Étendue sur 2500 m2, la Station numixs entend favoriser les synergies entre les acteurs du territoire et donner un nouveau souffle à l’innovation locale.', 'https://www.cyu.fr/sites/default/files/styles/actualite_detail/public/content/actualites/images/Station_Numixs.jpg.webp?itok=TrhhaueO', '2026-05-10 13:03:30', 'https://www.youtube.com/embed/xU0qA_tN8xQ?si=E00vEQdAzz9NUAFL');

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `lien_twitter` varchar(255) NOT NULL,
  `lien_avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`, `lien_twitter`, `lien_avatar`) VALUES
(1, 'DIB', 'Chaïma', 'https://twitter.com/universitecergy', 'https://i.pinimg.com/originals/50/6e/9b/506e9b48b067d33ba3e6c949e6e94ef6.gif'),
(2, 'DROIT', 'Lucas', 'https://twitter.com/universitecergy', 'https://media.discordapp.net/attachments/1487019428523671602/1518297022841487512/image0.gif?ex=6a3967ca&is=6a38164a&hm=adfbe312b1683046d650f72df20cbbd23e940c108aa30da1b5dbabaa66b85fcc&=&width=578&height=623'),
(3, 'HAMICHE', 'Tasnim', 'https://twitter.com/universitecergy', 'https://giffiles.alphacoders.com/147/147120.gif'),
(5, 'EL OUARAGUI ', 'Aymen', 'https://twitter.com/universitecergy', 'https://media.tenor.com/BpgliCzJXsgAAAAM/the-kairi78-voiture.gif');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `contenu` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `theme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `nom`, `prenom`, `email`, `telephone`, `contenu`, `type`, `date_creation`, `theme`) VALUES
(1, 'Martin', 'Thomas', 'm.thomas43@yopmail.com', NULL, 'Je suis intéressé par la formation.', 'etudiant', '2022-04-13 08:28:01', NULL),
(2, 'Despoux', 'Helena', 'h.despoux@foo.fr', NULL, 'Je suis intéressé par la formation.', 'etudiant', '2022-04-13 08:28:01', NULL),
(14, 'DIB', 'Chaima', 'chadib.2006@gmail.com', NULL, 'je souhaite m&#039;inscrire &agrave; la formation', 'etudiant', '2026-04-27 16:20:42', NULL),
(15, 'DIB', 'Chaima', 'chadib.2006@gmail.com', NULL, 'je souhaite m&#039;inscrire &agrave; la formation', 'etudiant', '2026-04-27 16:20:47', NULL),
(16, 'bhjb;j', ' bhbl', 'hjblnm@gmail.com', NULL, '                                    hjnlk', 'parent', '2026-04-27 17:44:46', NULL),
(17, 'dib', 'chaima', 'chadib.2006@gmail.com', NULL, 'je souhaite m&#039;inscrire', 'etudiant', '2026-04-27 18:10:29', NULL),
(18, 'dib', 'chaima', 'chadib.2006@gmail.com', NULL, 'je souhaite m&#039;inscrire', 'etudiant', '2026-04-27 18:15:08', NULL),
(19, 'dib', 'chaima', 'chadib.2006@gmail.com', NULL, 'je souhaite m&#039;inscrire', 'etudiant', '2026-04-27 18:15:14', NULL),
(20, 'Dib', 'Cha&iuml;ma', 'chadib.2006@gmail.com', NULL, ',ckz,kp&ecirc;', 'etudiant', '2026-04-27 19:55:04', NULL),
(21, 'crecre', 'vrdscdser', 'cdercre@gmail.com', NULL, 'nfioezp', 'etudiant', '2026-04-27 20:39:14', NULL),
(22, 'njjzad', 'ncklezmofe', 'cnjkend@gmail.com', NULL, 'vbervef', 'etudiant', '2026-04-27 20:42:51', NULL),
(23, 'cdzczd', 'vezcdz', 'bfiuj@gmail.com', NULL, 'niorjemfkmerz', 'parent', '2026-04-27 20:44:16', NULL),
(24, 'iozajpofkaz', 'bfiaehoif', 'jcizapo@gmail.com', '0532478639', 'bcuoahjcpoa', 'etudiant', '2026-04-27 20:54:01', NULL),
(25, ' jlnkbujm', 'bkjln:n kl', 'bhjvtftuy@gmail.com', '046515189', ' hjblkn hjbgiljm', 'etudiant', '2026-04-27 21:07:12', NULL),
(26, 'ncklezmoce', 'nbjfkjezop', 'ncjej@gmail.com', '01651684', 'nciezjmofez', 'etudiant', '2026-04-27 21:10:11', NULL),
(27, ',v klz;,v&ugrave;m', 'n klds&ugrave;mv;ez', 'ndsjnvmkdsl@gmail.com', '054165135486', ' vjldznmov,ezl', 'etudiant', '2026-04-27 21:12:49', NULL),
(28, 'cdscdscd', 'cdzcdec', 'jvioujrzpfr@gmail.com', '045131648646', 'nciozejmcez', 'etudiant', '2026-04-27 21:28:22', NULL),
(29, 'hciojpofrj', 'nflezjofzpo', 'bfiueh@gmail.com', '045165618', 'ncijezmf&#039;', 'etudiant', '2026-04-27 21:34:05', NULL),
(30, 'chioezajmfknlz', 'bfuaejif', 'bcezhe@gmail.com', '10514864', 'ncesjmez', 'etudiant', '2026-04-27 21:42:34', NULL),
(31, ' kjdsnlezl', 'fhuezjo', 'hjzeilfjezo@gmail.com', '054834658', 'vnsljvpomr', 'etudiant', '2026-04-27 21:47:10', NULL),
(32, 'ncilejmfoez', 'nvjksfeoz', 'cnljezom@gmail.com', '0347683', 'ncleijnc:kez', 'etudiant', '2026-04-27 21:48:39', NULL),
(33, 'bvkdefpieozef', 'biuhoihiohinv', 'nciojezp@gmail.com', '04186135468', 'bvuoezmvrjzp&ccedil;rz', 'etudiant', '2026-04-27 21:53:47', NULL),
(34, ',oek&ugrave;fmez,efz', 'ncioejopfiejofe', 'buezjief@gmail.com', '02584358', 'v qdjhmvknqebopfv&ugrave;es,q', 'etudiant', '2026-04-27 21:57:52', NULL),
(35, ' ckdjn:cjdsnl', 'hdaziljdne', 'bcuhdsld@gmail.com', '0168548965', 'buiaehfklnzuo', 'etudiant', '2026-04-27 21:59:40', NULL),
(36, 'nbvkqdjnvbjdsk', 'bvoeiojlfhoeij', 'nudzjefil@gmail.com', '0468578587458', 'bvc,lskbvhipsfjvs', 'etudiant', '2026-04-27 22:01:21', NULL),
(37, 'vftdyfugikhctyfugi', 'bvyigvyiho', 'vfyugikjbvhgj@gmail.com', '01546876532', 'vyfdtrfyguihkjbhvgfyiuop', 'etudiant', '2026-04-27 22:04:12', NULL),
(38, 'bvidsuhoifknlbui', 'bcgusqkhlnkkdsl', 'nbuegbfze@gmail.com', '0146236598632', 'nbcguezhoiflvrezihodjklnjc', 'etudiant', '2026-04-27 22:05:47', NULL),
(39, 'bhrfegiucdsjbdfhuoij', 'ncbuezholfnez', 'vrzhefiojnfzjr@gmail.com', '01489565849', 'bgcrezihonbhs', 'etudiant', '2026-04-27 22:08:43', NULL),
(40, 'ncioqejmnfeaiol', 'nfiuajeoefio', 'jfioejpoe@gmail.com', '046587453', 'nipazjomaeijpo', 'etudiant', '2026-04-29 19:54:21', NULL),
(41, 'nfioaefme', 'niezjpf,mlz', 'fnklaefoeian@gmail.com', '047868534', ',nkldzajm,fleo', 'etudiant', '2026-04-29 19:56:47', NULL),
(42, 'nfeoizhnfiezio', 'nilez,mgmk', 'bfiuoeznfezlm@gmail.com', '0585254', 'fnioeznmof!lzekl', 'etudiant', '2026-04-29 19:57:25', NULL),
(43, 'hfoezilhfboezi', 'bguoezihlngfpezojr', 'bfoezinlkfez@gmail.com', '02874531', 'nfioezpkfejzip', 'etudiant', '2026-04-29 20:00:50', NULL),
(44, 'bfuoaeoinfkleakj', 'nioronmgpmrz', 'cuzbleijfk@gmail.com', '02854164853', ',fopezjkf,linprzmo', 'etudiant', '2026-04-29 20:01:41', NULL),
(45, 'kbjkh ;j,', 'nipk', 'bjhbygiuk@gmail.com', '0687456322', ' bjhvybiukj', 'etudiant', '2026-04-29 20:17:26', NULL),
(46, 'Dib', 'Chaima', 'chadib.2006@gmail.com', '0601020304', 'je veux en savoir plus', 'etudiant', '2026-04-29 20:36:21', NULL),
(47, 'nbuorihlfknr', 'nfiejpomfk,poer', 'ugveihojklf@gmail', '0526356322', 'nbvuigerholknver', 'etudiant', '2026-05-01 16:06:54', NULL),
(48, 'ezhhoizre', 'hixjjoie', 'hiozihrzc@gmail.com', '0485124852', 'nvreomfjerpiet', 'etudiant', '2026-05-04 12:35:05', NULL),
(49, 'rzfrzfrz', 'rzrz', 'bueezfzf@gmail.com', '0546131615', 'vrefrsqf', 'etudiant', '2026-06-17 16:38:01', NULL),
(50, 'Dib', 'Cha&iuml;ma', 'chadib.2006@gmail.com', '0102030405', 'je veux en savoir plus', 'pas_precise', '2026-06-18 17:16:16', 'programme'),
(51, 'ccdsdcd', 'ccdd', 'cdcdsddc@eeffc.com', '0102030405', 'cecsec', 'etudiant', '2026-06-22 01:00:32', 'programme');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E6660BB6FE6` (`auteur_id`);

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6660BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
