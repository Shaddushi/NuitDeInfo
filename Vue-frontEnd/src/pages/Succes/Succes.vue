<script setup>
	import axios from "axios";
	import {ref} from "vue";
	const pseudo = ref('')
	let liste =
	[
    {
        "id": 0,
        "nom" : "os",
        "description": "Sans os, notre corps manquerait de structure et de soutien, nous rendant incapables de tenir debout ou de bouger. Les muscles, qui s'attachent aux os, ne pourraient plus fonctionner correctement. Les organes internes seraient vulnérables aux blessures sans la protection de la cage thoracique et du bassin. En outre, la production de cellules sanguines, qui se fait dans la moelle osseuse, cesserait. Bref, les os sont indispensables pour la mobilité, la protection des organes et la production de sang.",
        "Type" : "Humain",
        "image" : "../../src/assets/corps/no_bones.webp" ,
        "id_related" : 26,
        "key" : "no_bones"  
    },
    {
        "id": 1,
        "nom" : "rein",
        "description": "Si les reins cessent de fonctionner, le corps ne peut plus filtrer les déchets et les excès de liquide du sang, entraînant une accumulation toxique. Les niveaux d'électrolytes deviennent déséquilibrés, affectant la fonction cardiaque et musculaire. Sans intervention, cette situation provoque des œdèmes, de l'hypertension et peut conduire à une insuffisance rénale terminale, nécessitant une dialyse ou une transplantation. Les reins sont donc vitaux pour maintenir l'équilibre et la purification du sang.",
        "image" : "../../src/assets/corps/no_kidney.webp" ,
        "Type" : "Humain",
        "id_related" : 27,
        "key" : "no_kidney"  
    },
    {
        "id": 2,
        "nom" : "rein",
        "description": "Si les reins ne fonctionnent qu'à moitié, ils ne filtrent plus efficacement les déchets et l'excès de liquide du sang, ce qui peut entraîner une accumulation de toxines dans le corps. Les déséquilibres électrolytiques deviennent plus fréquents, affectant le cœur et les muscles. Cette inefficacité peut provoquer de la fatigue, un gonflement (œdème) et une hypertension artérielle. À long terme, la santé globale est compromise, nécessitant souvent une surveillance médicale et des ajustements de mode de vie. Les reins à moitié fonctionnels peinent à maintenir l'équilibre interne du corps.",
        "image" : "../../src/assets/corps/reduct_kidney.webp" ,
        "Type" : "Humain",
        "id_related" : 28,
        "key" : "reduct_kidney"  
    },
    {
        "id": 3,
        "nom" : "rein",
        "description": "Si les reins fonctionnent trop, appelons cela une hyperfiltration, ils peuvent filtrer plus de sang qu'ils ne devraient, entraînant une perte excessive de nutriments essentiels, comme le glucose et les électrolytes. Cette surcharge peut endommager progressivement les glomérules, les unités de filtration des reins, ce qui réduit leur efficacité au fil du temps. De plus, cette condition peut entraîner une augmentation de la pression artérielle et, à long terme, une insuffisance rénale chronique. Bref, des reins en suractivité peuvent causer des déséquilibres et des dommages importants.",
        "image" : "../../src/assets/corps/increase_kidney.webp" ,
        "Type" : "Humain",
        "id_related" : 29,
        "key" : "increase_kidney"  
    },
    {
        "id": 4,
        "nom" : "température_corporelle",
        "description": " Quand la température corporelle diminue, le métabolisme ralentit, provoquant des frissons pour générer de la chaleur. Les organes internes commencent à fonctionner moins efficacement. Une hypothermie sévère peut s'installer, entraînant une confusion mentale et une perte de coordination. Si elle n'est pas traitée, elle peut mener à une défaillance organique et être mortelle. En somme, une baisse de la température corporelle perturbe gravement les fonctions vitales.",
        "image" : "../../src/assets/corps/reduct_body_temperature.webp" ,
        "Type" : "Humain",
        "id_related" : 30,
        "key" : "reduct_body_temperature"  
    },
    {
        "id": 5,
        "nom" : "température_corporelle",
        "description": "Si la température corporelle descend à 0 degrés, cela provoque une hypothermie extrême. Les organes cessent de fonctionner correctement, et le sang commence à coaguler. Le métabolisme ralentit jusqu'à s'arrêter, entraînant la perte de conscience et, sans intervention rapide, la mort. En bref, une telle température corporelle est incompatible avec la survie.",
        "image" : "../../src/assets/corps/reduct_body_temperature.webp" ,
        "Type" : "Humain",
        "id_related" : 31,
        "key" : "too_low_body_temperature"  
    },
    {
        "id": 6,
        "nom" : "température_corporelle",
        "description": "Quand la température corporelle augmente, cela peut causer des troubles comme la fièvre. Les enzymes et les protéines du corps fonctionnent moins efficacement, ce qui perturbe les processus biologiques. Le risque de déshydratation et de coup de chaleur augmente, entraînant des nausées, une fatigue extrême et des étourdissements. Si la température continue à monter, cela peut entraîner des dommages aux organes vitaux et être potentiellement fatal. En somme, une température corporelle élevée peut gravement affecter la santé et le bien-être général.",
        "image" : "../../src/assets/corps/increase_body_temperature.webp" ,
        "Type" : "Humain",
        "id_related" : 32,
        "key" : "increase_body_temperature"  
    },
    {
        "id": 7,
        "nom" : "température_corporelle",
        "description": "Si la température corporelle triplait, ce serait catastrophique pour le corps humain. Les protéines et les enzymes cesseraient de fonctionner correctement, entraînant la destruction rapide des cellules. Les organes vitaux comme le cerveau et le cœur seraient gravement endommagés. Cette situation provoquerait une défaillance organique généralisée et serait rapidement fatale. Une telle élévation extrême de la température corporelle est incompatible avec la vie.",
        "image" : "../../src/assets/corps/too_high_body_temperature.webp" ,
        "Type" : "Humain",
        "id_related" : 33,
        "key" : "too_high_body_temperature"  
    },
    {
        "id": 8,
        "nom" : "globule rouge",
        "description": "Lorsque le taux de globules rouges diminue, le corps ne reçoit pas suffisamment d'oxygène, entraînant une fatigue intense et des essoufflements. Les globules blancs en baisse affaiblissent le système immunitaire, rendant le corps plus vulnérable aux infections. Si les plaquettes sont également affectées, la coagulation du sang devient moins efficace, augmentant le risque de saignements. Une anémie peut se développer, affectant la santé générale et l'énergie. En somme, un faible taux de globules affecte la capacité du corps à fonctionner efficacement.",
        "image" : "../../src/assets/corps/reduct_red_blood_cell.webp" ,
        "Type" : "Humain",
        "id_related" : 34,
        "key" : "reduct_red_blood_cell"  
    },
    {
        "id": 9,
        "nom" : "globule rouge",
        "description": "Si les globules rouges ne fonctionnent plus correctement, le corps ne reçoit plus suffisamment d'oxygène, ce qui entraîne une fatigue intense et des étourdissements. Les cellules et les tissus commencent à souffrir de cette privation d'oxygène, compromettant les fonctions organiques. L'organisme devient plus susceptible aux infections et aux maladies. Sans un transport efficace de l'oxygène, les organes vitaux peuvent commencer à défaillir, mettant la vie en danger. En somme, les globules rouges sont essentiels pour assurer une oxygénation adéquate de tout le corps.",
        "image" : "../../src/assets/corps/no_red_blood_cell.webp" ,
        "Type" : "Humain",
        "id_related" : 35,
        "key" : "no_red_blood_cell"  
    },
    {
        "id": 10,
        "nom" : "coeur",
        "description": "Si notre cœur cesse de fonctionner, le flux sanguin s'arrête instantanément, privant tous les organes, y compris le cerveau, de l'oxygène et des nutriments essentiels. Cela entraîne rapidement une perte de conscience et une défaillance organique généralisée. Sans intervention médicale immédiate, la situation devient rapidement fatale. Le cœur est donc indispensable pour maintenir la vie en assurant une circulation sanguine continue.",
        "image" : "../../src/assets/corps/no_heart.webp" ,
        "Type" : "Humain",
        "id_related" : 36,
        "key" : "no_heart"  
    },
    {
        "id": 11,
        "nom" : "coeur",
        "description": "Si le cœur bat trop lentement, appelé bradycardie, le flux sanguin vers les organes vitaux diminue, entraînant des symptômes comme la fatigue, les vertiges et les évanouissements. Le cerveau et les autres organes reçoivent moins d'oxygène, ce qui peut affecter leur fonctionnement. La bradycardie sévère peut conduire à des évanouissements ou des insuffisances cardiaques, nécessitant une intervention médicale pour rétablir un rythme cardiaque normal. En somme, un cœur trop lent compromet la circulation sanguine essentielle à notre santé.",
        "image" : "../../src/assets/corps/slow_heart.webp" ,
        "Type" : "Humain",
        "id_related" : 37,
        "key" : "slow_heart"  
    },
    {
        "id": 12,
        "nom" : "coeur",
        "description": "Si le cœur bat trop rapidement, appelé tachycardie, il pompe le sang de manière inefficace, réduisant l'apport en oxygène aux organes et provoquant des symptômes comme des palpitations, des vertiges et des essoufflements. Cela peut entraîner des complications graves telles que des crises cardiaques, des accidents vasculaires cérébraux et des défaillances cardiaques. Ainsi, un rythme cardiaque trop rapide compromet la distribution équilibrée du sang nécessaire au bon fonctionnement du corps.",
        "image" : "../../src/assets/corps/fast_heart.webp" ,
        "Type" : "Humain",
        "id_related" : 38,
        "key" : "fast_heart"  
    },
    {
        "id": 13,
        "nom" : "respiration",
        "description": "Si notre système respiratoire cesse de fonctionner, le corps ne peut plus obtenir l'oxygène nécessaire pour survivre, ce qui entraîne rapidement une asphyxie. Les cellules, privées d'oxygène, commencent à mourir, ce qui provoque des défaillances organiques. Sans apport en oxygène, le cœur et le cerveau cessent de fonctionner, entraînant une perte de conscience. Sans intervention médicale d'urgence, cela conduit inévitablement à la mort. Le système respiratoire est donc essentiel pour maintenir la vie en assurant une oxygénation constante du corps.",
        "image" : "../../src/assets/corps/no_breathing.webp",
        "Type" : "Humain",
        "id_related" : 39,
        "key" : "no_breathing"  
    },
    {
        "id": 14,
        "nom" : "respiration",
        "description": "Si notre système respiratoire fonctionne trop lentement, le corps ne reçoit pas assez d'oxygène, ce qui entraîne une sensation de fatigue constante et un manque d'énergie. Les niveaux d'oxygène dans le sang chutent, mettant le cœur et le cerveau sous pression. Cela peut causer des étourdissements, des troubles cognitifs et une détérioration générale de la santé. En somme, une respiration trop lente affecte négativement toutes les fonctions corporelles vitales.",
        "image" : "../../src/assets/corps/low_breathing.webp" ,
        "Type" : "Humain",
        "id_related" : 40,
        "key" : "slow_breathing"  
    },
    {
        "id": 15,
        "nom" : "respiration",
        "description": "Si notre système respiratoire fonctionne trop rapidement, le corps expulse trop de dioxyde de carbone, ce qui perturbe l'équilibre acide-base du sang. Cela peut provoquer des vertiges, des picotements dans les extrémités et une sensation de confusion. En respirant trop vite, nous pouvons également ressentir de l'anxiété accrue et une fatigue rapide. Ainsi, un rythme respiratoire trop élevé peut déséquilibrer notre métabolisme et affecter notre bien-être général.",
        "image" : "../../src/assets/corps/fast_breathing.webp" ,
        "Type" : "Humain",
        "id_related" : 41,
        "key" : "fast_breathing"  
    },
    {
        "id": 16,
        "nom" : "système immunitaire",
        "description": "Si notre système immunitaire cesse de fonctionner, le corps devient extrêmement vulnérable aux infections, car il ne peut plus combattre les bactéries, virus et autres pathogènes. Même les infections mineures pourraient devenir gravement dangereuses. Le corps perdrait sa capacité à se défendre, ce qui pourrait entraîner des maladies fréquentes et sévères. La moindre blessure ou infection pourrait devenir potentiellement mortelle sans une intervention médicale. Le système immunitaire est donc crucial pour notre survie en nous protégeant des menaces externes.",
        "image" : "../../src/assets/corps/immune_system.webp" ,
        "Type" : "Humain",
        "id_related" : 42,
        "key" : "no_immune_system"  
    },
    {
        "id": 17,
        "nom" : "système immunitaire",
        "description": "Lorsque le système immunitaire diminue, le corps devient plus vulnérable aux infections, car il ne peut plus combattre efficacement les virus et les bactéries. La guérison des maladies et des blessures est ralentie, et le risque de contracter des infections opportunistes augmente. Les maladies courantes peuvent devenir plus graves et plus fréquentes. La fatigue et une sensation générale de malaise sont aussi courantes. En somme, un système immunitaire affaibli réduit considérablement la capacité du corps à se défendre et à se rétablir.",
        "image" : "../../src/assets/corps/immune_system.webp" ,
        "Type" : "Humain",
        "id_related" : 43,
        "key" : "reduct_immune_system"  
    },
    {
        "id": 18,
        "nom" : "cerveau",
        "description": "Si notre cerveau cesse de fonctionner, le corps perdrait rapidement toutes ses fonctions vitales. Sans les signaux du cerveau, les organes ne pourraient plus fonctionner correctement, entraînant une défaillance organique. La respiration et le battement du cœur cesseraient, car ces fonctions sont régulées par le cerveau. Une perte de conscience immédiate suivrait, et sans intervention, la mort s'ensuivrait. Le cerveau est donc essentiel pour contrôler et coordonner tous les processus corporels vitaux.",
        "image" : "../../src/assets/corps/brain.webp" ,
        "Type" : "Humain",
        "id_related" : 44,
        "key" : "no_brain"  
    },
    {
        "id": 19,
        "nom" : "cerveau",
        "description": "Si notre cerveau ne fonctionne plus qu'à 50%, les capacités cognitives et motrices seraient gravement réduites. La mémoire, la pensée et la prise de décision deviendraient difficiles, affectant la vie quotidienne. Les fonctions physiques, comme le mouvement et la coordination, seraient également compromises. Des problèmes de communication et de comportement pourraient apparaître, et la qualité de vie serait fortement impactée. En somme, le cerveau est essentiel à notre fonctionnement global.",
        "image" : "../../src/assets/corps/brain.webp" ,
        "Type" : "Humain",
        "id_related" : 45,
        "key" : "reduct_brain"  
    },
    {
        "id": 20,
        "nom" : "peau",
        "description": "Sans peau, le corps perdrait sa barrière protectrice contre les infections, la température serait difficile à réguler, et nous serions vulnérables aux blessures. Les fluides corporels s'évaporeraient, conduisant à une déshydratation rapide. Les nerfs exposés rendraient chaque contact extrêmement douloureux. Bref, la peau est essentielle pour la protection et la régulation du corps.",
        "image" : "../../src/assets/corps/skin.webp" ,
        "Type" : "Humain",
        "id_related" : 46,
        "key" : "no_skin"  
    },
    {
        "id": 21,
        "nom" : "système circulatoire",
        "description": "Si le système circulatoire cesse de fonctionner, les organes ne reçoivent plus l'oxygène et les nutriments nécessaires, ce qui entraîne rapidement une défaillance des organes. Le cœur, incapable de pomper le sang, arrête de battre, et les cellules commencent à mourir par manque d'oxygène. Cela conduit à une perte de conscience et, sans intervention médicale immédiate, peut être fatal. En somme, le système circulatoire est essentiel pour maintenir la vie en apportant continuellement les éléments vitaux aux cellules du corps.",
        "image" : "../../src/assets/corps/circulatory_system.webp" ,
        "Type" : "Humain",
        "id_related" : 47,
        "key" : "no_circulatory_system"  
    },
    {
        "id": 22,
        "nom" : "système circulatoire",
        "description": "Lorsque le système circulatoire diminue, le corps ne reçoit plus suffisamment de sang pour transporter l'oxygène et les nutriments nécessaires aux organes. Cela peut entraîner une fatigue accrue, des étourdissements et une faiblesse générale. Les organes vitaux, comme le cœur et le cerveau, sont particulièrement affectés, ce qui peut entraîner des complications graves. La cicatrisation des plaies et la récupération des maladies ralentissent également. En somme, un système circulatoire affaibli compromet gravement la santé et le fonctionnement global du corps.",
        "image" : "../../src/assets/corps/circulatory_system.webp" ,
        "Type" : "Humain",
        "id_related" : 48,
        "key" : "reduct_circulatory_system"  
    },
    {
        "id": 23,
        "nom" : "système circulatoire",
        "description": "Si le système circulatoire augmente, le cœur pompe plus rapidement et avec plus de force, augmentant ainsi le flux sanguin. Cela peut causer une hypertension artérielle, mettant plus de pression sur les vaisseaux sanguins et les organes. Les organes peuvent se fatiguer à cause de l'excès de travail, ce qui peut entraîner des complications comme des crises cardiaques ou des accidents vasculaires cérébraux. Une circulation accrue peut également causer des dommages aux petits vaisseaux sanguins. En somme, un système circulatoire en suractivité peut entraîner des risques importants pour la santé cardiovasculaire.",
        "image" : "../../src/assets/corps/circulatory_system.webp" ,
        "Type" : "Humain",
        "id_related" : 49,
        "key" : "increase_circulatory_system"  
    },
    {
        "id": 24,
        "nom" : "cellule",
        "description": " Si les cellules ne fonctionnent plus correctement, les organes cessent de recevoir les nutriments et l'oxygène nécessaires, entraînant leur défaillance. La production d'énergie par le corps devient impossible, conduisant à une fatigue extrême et à l'incapacité de maintenir les fonctions vitales. Les tissus commencent à mourir, provoquant des dommages irréversibles. En fin de compte, l'ensemble du corps s'arrête de fonctionner, car les cellules sont les unités de base de la vie.",
        "image" : "../../src/assets/corps/cell.webp" ,
        "Type" : "Humain",
        "id_related" : 50,
        "key" : "no_cell"  
    },
    {
        "id": 25,
        "nom" : "cellule",
        "description": "Si le fonctionnement des cellules diminue, les processus vitaux, comme la production d'énergie et la réparation des tissus, ralentissent, entraînant une fatigue généralisée. Les organes deviennent moins efficaces, ce qui peut causer des troubles métaboliques et une défaillance organique progressive. La capacité du corps à combattre les infections et à guérir des blessures est également compromise. Les cellules étant essentielles à la vie, leur défaillance réduit la capacité globale du corps à maintenir la santé et le fonctionnement normal.",
        "image" : "../../src/assets/corps/cell.webp" ,
        "Type" : "Humain",
        "id_related" : 51,
        "key" : "reduct_cell"  
    },
	{ 
        "Id": 26, 
        "nom": "Disparition des coraux", 
        "description": "La disparition des coraux entraînerait une baisse massive de la biodiversité marine et perturberait les écosystèmes océaniques. Les côtes deviendraient plus vulnérables à l'érosion et aux tempêtes, mettant en danger les communautés côtières. Les pêcheries commerciales et le tourisme souffriraient économiquement. Enfin, cela pourrait affecter la chimie océanique et le cycle du carbone, avec des implications pour le climat mondial. Lutter contre le réchauffement climatique et la pollution est essentiel pour leur conservation.", 
        "image":"../../src/assets/poissons/disp_coraux.webp", 
        "Type": "Poisson", 
        "Id_related": 0, 
        "Key": "disp_coraux" 
    },
    { 
        "Id": 28, 
        "nom": "Réduction de la salinité", 
        "description": "Réduire la salinité des océans perturberait gravement la vie marine, notamment les espèces adaptées à des niveaux de salinité spécifiques. Les coraux et d'autres organismes pourraient souffrir, menant à une baisse de la biodiversité. Cela affecterait également les courants marins et le cycle océanique, perturbant les écosystèmes globaux. Les processus biologiques comme la photosynthèse du phytoplancton seraient aussi impactés, influençant la chaîne alimentaire marine. Enfin, cela pourrait altérer les interactions climatiques en perturbant l'équilibre thermique des océans.", 
        "image":"../../src/assets/poissons/reduc_salinite.webp", 
        "Type": "Poisson", 
        "Id_related": 2, 
        "Key": "reduc_salinite" 
    },
    { 
        "Id": 27, 
        "nom": "suppression de la salinité", 
        "description": "La suppression totale de la salinité des océans serait catastrophique. Les organismes marins, y compris les poissons, coraux, et planctons, ne pourraient pas survivre dans de l'eau douce, entraînant une extinction massive de la vie marine. Les courants océaniques seraient profondément perturbés, affectant le climat global. La chimie de l'eau serait altérée, rendant les océans incapables de soutenir la majorité des écosystèmes actuels. Cela aurait des conséquences désastreuses sur la chaîne alimentaire et les industries dépendant de l'océan.", 
        "image":"../../src/assets/poissons/supr_salinite.webp", 
        "Type": "Poisson", 
        "Id_related": 1, 
        "Key": "supr_salinite" 
    },
    { 
        "Id": 29, 
        "nom": "Augmentation de la salinité", 
        "description": "Une augmentation de la salinité des océans perturberait gravement les écosystèmes marins, rendant l'environnement hostile pour de nombreuses espèces adaptées à des niveaux de salinité spécifiques. Les coraux et d'autres organismes marins pourraient décliner, entraînant une perte de biodiversité. Les courants marins et le cycle océanique seraient également affectés, modifiant les flux de nutriments et les températures. Les processus biologiques comme la photosynthèse du phytoplancton pourraient être altérés, impactant la chaîne alimentaire marine. Enfin, cela pourrait influencer le climat global en perturbant les interactions thermiques des océans.", 
        "image":"../../src/assets/poissons/augment_salinite.webp", 
        "Type": "Poisson", 
        "Id_related": 3, 
        "Key": "augment_salinite" 
    },
    { 
        "Id": 30, 
        "nom": "Réduction de la température", 
        "description": "Baisser la température des océans ralentirait les processus métaboliques des organismes marins, impactant leur croissance et reproduction. Les récifs coralliens, déjà vulnérables, pourraient ne pas survivre, entraînant une perte de biodiversité. Les courants océaniques seraient modifiés, perturbant les cycles de nutriments et les migrations d'espèces. Le phytoplancton, base de la chaîne alimentaire marine, pourrait voir sa productivité diminuer. Enfin, cela influencerait le climat global en modifiant les échanges thermiques entre les océans et l'atmosphère.", 
        "image":"../../src/assets/poissons/reduc_temperature.webp", 
        "Type": "Poisson", 
        "Id_related": 4, 
        "Key": "reduc_temperature" 
    },
    { 
        "Id": 31, 
        "nom": "Réduction à 0° de la température", 
        "description": "Réduire la température des océans à 0°C serait dévastateur. La majorité de la vie marine, adaptée à des températures spécifiques, ne survivrait pas. Les coraux et la biodiversité marine disparaîtraient, entraînant un effondrement des écosystèmes océaniques. Les courants marins seraient gravement perturbés, affectant les cycles de nutriments et les climats mondiaux. La glace se formerait à la surface, modifiant radicalement les habitats marins et impactant les échanges thermiques avec l'atmosphère.", 
        "image":"../../src/assets/poissons/reduc_0_temperature.webp", 
        "Type": "Poisson", 
        "Id_related": 5, 
        "Key": "reduc_0_temperature" 
    },
    { 
        "Id": 32, 
        "nom": "Augmentation de la température", 
        "description": "Augmenter la température des océans affecterait gravement les écosystèmes marins, entraînant le blanchissement des coraux et la perte de biodiversité. Les espèces marines, en particulier celles sensibles à la température, verraient leurs habitats perturbés. Les courants marins et les cycles de nutriments seraient modifiés, influençant la répartition des espèces et la productivité des océans. Les phénomènes climatiques extrêmes, comme les ouragans, deviendraient plus fréquents et intenses. Cela pourrait également exacerber le réchauffement climatique en augmentant la libération de gaz à effet de serre des océans.", 
        "image":"../../src/assets/poissons/augment_temperature.webp", 
        "Type": "Poisson", 
        "Id_related": 6, 
        "Key": "augment_temperature" 
    },
    { 
        "Id": 33, 
        "nom": "Augmentation à 100° de la température", 
        "description": "Porter la température des océans à 100°C aurait des conséquences catastrophiques. Toute vie marine serait instantanément anéantie, détruisant entièrement les écosystèmes océaniques. Les courants marins et les cycles de nutriments cesseraient d'exister, entraînant une perturbation complète des systèmes climatiques mondiaux. L'évaporation massive de l'eau augmenterait les phénomènes météorologiques extrêmes. Cela créerait des conditions climatiques invivables pour la majorité des formes de vie terrestres.", 
        "image":"../../src/assets/poissons/augment_100_temperature.webp", 
        "Type": "Poisson", 
        "Id_related": 7, 
        "Key": "augment_100_temperature" 
    },
    { 
        "Id": 34, 
        "nom": "Réduction du phytoplancton", 
        "description": "Réduire le nombre de planctons dans les océans aurait des effets dévastateurs. Les planctons sont à la base de la chaîne alimentaire marine, et leur diminution affecterait toutes les espèces marines, des plus petits poissons aux grands mammifères comme les baleines. La diminution du phytoplancton réduirait également la production d'oxygène, impactant non seulement la vie marine mais aussi l'atmosphère terrestre. Les écosystèmes océaniques seraient gravement perturbés, avec des conséquences pour la pêche et les économies côtières. Enfin, cela pourrait altérer les cycles de nutriments et les courants marins, modifiant le climat global.", 
        "image":"../../src/assets/poissons/reduc_phyto.webp", 
        "Type": "Poisson", 
        "Id_related": 8, 
        "Key": "reduc_phyto" 
    },
    { 
        "Id": 35, 
        "nom": "Suppression du phytoplancton", 
        "description": "Éliminer les planctons des océans serait catastrophique. Les planctons, étant à la base de la chaîne alimentaire marine, leur absence entraînerait l'extinction des espèces marines dépendantes, des petits poissons aux baleines. La production d'oxygène, fortement dépendante du phytoplancton, chuterait, affectant l'atmosphère terrestre. Les écosystèmes océaniques s'effondreraient, perturbant la pêche et les économies côtières. De plus, les cycles de nutriments et les courants marins seraient gravement affectés, modifiant le climat global.", 
        "image":"../../src/assets/poissons/supr_phyto.webp", 
        "Type": "Poisson", 
        "Id_related": 9, 
        "Key": "supr_phyto" 
    },
    { 
        "Id": 36, 
        "nom": "Suppression des marées", 
        "description": "Supprimer les marées des océans bouleverserait les écosystèmes côtiers, affectant les habitats de nombreuses espèces. Les cycles de nutriments seraient perturbés, impactant la productivité marine. Les courants marins et les systèmes de circulation océanique seraient modifiés, influençant le climat mondial. Les activités humaines, comme la pêche et le transport maritime, en subiraient les conséquences. Enfin, cela altérerait les rythmes naturels de certaines espèces marines, perturbant leur comportement et leur reproduction.", 
        "image":"../../src/assets/poissons/supr_maree.webp", 
        "Type": "Poisson", 
        "Id_related": 10, 
        "Key": "supr_maree" 
    },
    { 
        "Id": 37, 
        "nom": "Réduction des marées", 
        "description": "Réduire le nombre de marées causerait une diminution des mouvements d'eau côtiers, impactant la vie marine qui dépend de ces cycles pour la reproduction et l'alimentation. Les nutriments se déplaceraient moins, réduisant la productivité des écosystèmes marins. Les courants océaniques seraient perturbés, influençant le climat global. Les activités humaines comme la pêche pourraient être affectées par ces changements. En résumé, les écosystèmes côtiers et marins seraient gravement perturbés.", 
        "image":"../../src/assets/poissons/reduc_maree.webp", 
        "Type": "Poisson", 
        "Id_related": 11, 
        "Key": "reduc_maree" 
    },
    { 
        "Id": 38, 
        "nom": "Augmentation des marées", 
        "description": "Augmenter le nombre de marées bouleverserait les écosystèmes côtiers en créant des fluctuations d'eau plus fréquentes et intenses. Les habitats marins, comme les zones de reproduction des poissons et les mangroves, seraient perturbés. Les cycles de nutriments deviendraient erratiques, affectant la productivité marine. Les activités humaines, comme la pêche et le transport maritime, pourraient devenir plus imprévisibles. Enfin, le niveau des eaux pourrait causer plus d'érosion côtière et d'inondations, menaçant les communautés côtières.", 
        "image":"../../src/assets/poissons/augm_maree.webp", 
        "Type": "Poisson", 
        "Id_related": 12, 
        "Key": "supr_maree" 
    },
    { 
        "Id": 39, 
        "nom": "Suppression du cycle océanique", 
        "description": "Supprimer le cycle océanique transformerait les océans en étendues stagnantes. Les nutriments et la chaleur cesseraient de se répartir, entraînant une baisse drastique de la productivité marine. Les écosystèmes marins seraient profondément perturbés, affectant la survie de nombreuses espèces. Les climats régionaux deviendraient imprévisibles et les phénomènes météorologiques seraient chaotiques. En résumé, les océans deviendraient des zones mortes, dépourvues de dynamisme et de vie", 
        "image":"../../src/assets/poissons/supr_cycle.webp", 
        "Type": "Poisson", 
        "Id_related": 13, 
        "Key": "supr_cycle" 
    },
    { 
        "Id": 40, 
        "nom": "Rétrécissement du cycle océanique", 
        "description": "Raccourcir le cycle océanique bouleverserait les courants marins, modifiant la distribution de chaleur et de nutriments dans les océans. Les écosystèmes marins seraient perturbés, impactant la répartition des espèces et la biodiversité. Les phénomènes météorologiques et climatiques deviendraient plus imprévisibles, affectant les régions côtières. Les cycles de reproduction et de migration des espèces marines pourraient être désynchronisés. Enfin, la productivité marine, essentielle pour la pêche, serait altérée.", 
        "image":"../../src/assets/poissons/reduc_cycle.webp", 
        "Type": "Poisson", 
        "Id_related": 14, 
        "Key": "reduc_cycle" 
    },
    { 
        "Id": 41, 
        "nom": "Rallongement du cycle océanique", 
        "description": "Allonger le cycle océanique ralentirait la circulation des courants marins, perturbant la distribution de chaleur et de nutriments. Les écosystèmes marins seraient affectés, modifiant la répartition des espèces et la biodiversité. Les phénomènes météorologiques pourraient devenir plus extrêmes et imprévisibles, impactant les régions côtières. Les cycles de reproduction et de migration des espèces marines pourraient être désynchronisés. Enfin, la productivité marine, essentielle pour la pêche, pourrait diminuer, affectant les économies côtières.", 
        "image":"../../src/assets/poissons/augment_cycle.webp", 
        "Type": "Poisson", 
        "Id_related": 15, 
        "Key": "augment_cycle" 
    },
    { 
        "Id": 42, 
        "nom": "Suppression de la biodiversité", 
        "description": "Supprimer toute la biodiversité océanique serait une catastrophe monumentale. Les écosystèmes marins s'effondreraient, éliminant toute forme de vie marine et déstabilisant les chaînes alimentaires. Les pêcheries disparaîtraient, mettant en péril la sécurité alimentaire et les économies côtières. Les cycles de nutriments et les courants marins seraient profondément perturbés, affectant le climat mondial. Finalement, les océans deviendraient des déserts aquatiques, dépourvus de vie et de dynamisme.", 
        "image":"../../src/assets/poissons/supr_biodiversity.webp", 
        "Type": "Poisson", 
        "Id_related": 16, 
        "Key": "supr_biodiversity" 
    },
    { 
        "Id": 43, 
        "nom": "Diminution de la biodiversité", 
        "description": "Diminuer la biodiversité océanique affaiblirait la résilience des écosystèmes marins face aux perturbations. Les chaînes alimentaires deviendraient instables, réduisant la productivité marine. Les espèces auraient moins de diversité génétique pour s'adapter aux changements climatiques. Les pêcheries seraient moins durables, impactant négativement les économies côtières et le tourisme. Enfin, la santé globale des océans en souffrirait, rendant les écosystèmes plus vulnérables aux crises environnementales.", 
        "image":"../../src/assets/poissons/reduc_biodiversity.webp", 
        "Type": "Poisson", 
        "Id_related": 17, 
        "Key": "reduc_biodiversity" 
    },
    { 
        "Id": 44, 
        "nom": "Destruction de l'écosystème", 
        "description": "Détruire les écosystèmes océaniques plongerait les océans dans un chaos total. Toutes les formes de vie marine disparaîtraient, entraînant l'effondrement des chaînes alimentaires. Les pêcheries seraient anéanties, menaçant la sécurité alimentaire mondiale et ruinant les économies côtières. Les courants marins et les cycles de nutriments seraient radicalement perturbés, impactant le climat de manière dramatique. Les océans deviendraient des étendues stériles, sans vie et sans dynamisme.", 
        "image":"../../src/assets/poissons/supr_ecosysteme.webp", 
        "Type": "Poisson", 
        "Id_related": 18, 
        "Key": "supr_ecosysteme" 
    },
    { 
        "Id": 45, 
        "nom": "Réduction de l'écosystème", 
        "description": "Affaiblir les écosystèmes océaniques rendrait les océans plus vulnérables aux perturbations environnementales. Les chaînes alimentaires seraient perturbées, réduisant la productivité marine et affectant la survie des espèces. Les pêcheries deviendraient moins durables, compromettant la sécurité alimentaire des communautés côtières. La résilience aux changements climatiques diminuerait, rendant les océans moins capables de s'adapter. En fin de compte, la santé globale des océans en pâtirait, mettant en péril l'équilibre écologique marin.", 
        "image":"../../src/assets/poissons/reduc_ecosysteme.webp", 
        "Type": "Poisson", 
        "Id_related": 19, 
        "Key": "reduc_ecosysteme" 
    },
    { 
        "Id": 46, 
        "nom": "Réduction niveau marin", 
        "description": "Abaisser la surface des océans exposerait de vastes étendues de fonds marins, transformant certaines zones côtières en terres sèches. Les écosystèmes marins seraient gravement perturbés, les habitats essentiels disparaîtraient et de nombreuses espèces seraient menacées. La circulation océanique et les courants seraient modifiés, influençant le climat global. Les activités humaines, comme la pêche et le commerce maritime, subiraient des impacts majeurs. Enfin, les phénomènes météorologiques locaux pourraient changer radicalement, affectant les régions côtières.", 
        "image":"../../src/assets/poissons/reduc_niveau.webp", 
        "Type": "Poisson", 
        "Id_related": 20, 
        "Key": "reduc_niveau" 
    },
    { 
        "Id": 47, 
        "nom": "Suppression du courant", 
        "description": "Sans courants marins, les océans deviendraient comme de grandes piscines stagnantes. Les nutriments cesseraient de circuler, entraînant une baisse drastique de la productivité marine. Les écosystèmes marins seraient gravement perturbés, affectant les migrations et la survie des espèces. Les conditions météorologiques globales deviendraient imprévisibles, perturbant les climats régionaux. En fin de compte, les océans se transformeraient en vastes étendues d'eau immobiles, dépourvues de dynamisme et de vie.", 
        "image":"../../src/assets/poissons/supr_courant.webp", 
        "Type": "Poisson", 
        "Id_related": 21, 
        "Key": "supr_courant" 
    },
    { 
        "Id": 48, 
        "nom": "Réduction du courant", 
        "description": "Ralentir les courants marins ralentirait la distribution des nutriments et de la chaleur, perturbant les écosystèmes marins. Les espèces marines dépendant des courants pour leurs migrations et leur alimentation seraient affectées. Les phénomènes météorologiques pourraient devenir moins prévisibles, avec des impacts sur le climat global. La productivité des zones de pêche diminuerait, affectant les économies côtières. Enfin, cela pourrait entraîner une stagnation de certaines masses d'eau, augmentant le risque de proliférations d'algues nuisibles.", 
        "image":"../../src/assets/poissons/reduc_courant.webp", 
        "Type": "Poisson", 
        "Id_related": 22, 
        "Key": "reduc_courant" 
    },
    { 
        "Id": 49, 
        "nom": "Augmentation du courant", 
        "description": "Augmenter la force des courants marins rendrait les océans beaucoup plus dynamiques. Les nutriments et la chaleur seraient redistribués plus rapidement, impactant les écosystèmes marins et la répartition des espèces. Les tempêtes pourraient devenir plus fréquentes et puissantes, affectant les côtes. Les courants plus rapides pourraient également perturber les routes maritimes et rendre la navigation plus difficile. Enfin, cela pourrait influencer les phénomènes climatiques, modifiant les cycles météorologiques globaux.", 
        "image":"../../src/assets/poissons/augment_courant.webp", 
        "Type": "Poisson", 
        "Id_related": 23, 
        "Key": "augment_courant" 
    },
    { 
        "Id": 50, 
        "nom": "Suppresion du plancton", 
        "description": "Éliminer les planctons des océans serait désastreux. Sans eux, la base de la chaîne alimentaire marine disparaîtrait, menaçant la survie de nombreuses espèces marines, des poissons aux baleines. La production d'oxygène, en grande partie due au phytoplancton, chuterait dramatiquement, impactant l'atmosphère terrestre. Les écosystèmes marins s'effondreraient, perturbant gravement la pêche et les économies côtières. En bref, les océans deviendraient des déserts aquatiques, dépourvus de vie et de vitalité.", 
        "image":"../../src/assets/poissons/supr_plancton.webp", 
        "Type": "Poisson", 
        "Id_related": 24, 
        "Key": "supr_plancton" 
    },
    { 
        "Id": 51, 
        "nom": "Réduction du plancton", 
        "description": "Réduire les planctons des océans aurait des conséquences graves. La base de la chaîne alimentaire marine s'affaiblirait, menaçant la survie de nombreuses espèces. La production d'oxygène, largement due au phytoplancton, diminuerait, impactant l'atmosphère terrestre. Les écosystèmes marins seraient perturbés, affectant la pêche et les économies côtières. Enfin, les océans deviendraient moins productifs et dynamiques, avec des répercussions écologiques majeures.", 
        "image":"../../src/assets/poissons/reduc_plancton.webp", 
        "Type": "Poisson", 
        "Id_related": 25, 
        "Key": "reduc_plancton" 
    }
]
</script>

<style>
	.success-row{
		width: 100%;
		flex-wrap: nowrap;
	}

	.success-column{
		width: 100%;

		background: linear-gradient(90deg, rgb(6, 243, 255), rgb(0, 0, 142));
	}

	.success-img{
		width: 10%;
		height: 100%;
	}


</style>

<template>
	<div>
		<template v-for="l in liste">
			<div class="row success-row">
				<img :src="l.image" class="success-img"/>
				<div class="column success-column">
					<p>{{ l.nom }}</p>
					<p>{{ l.description }}</p>
				</div>
			</div>
		</template>
	</div>
</template>