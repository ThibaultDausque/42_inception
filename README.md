🐋 Inception - System & Infrastructure

🚀 Introduction
Ce projet consiste en la mise en place d'une infrastructure web complète et virtualisée à l'aide de Docker. L'objectif est de concevoir une architecture multi-services robuste, isolée et sécurisée, répondant aux standards de l'administration système moderne.

Inspiré par la rigueur des processus industriels, ce dépôt démontre une maîtrise de la conteneurisation "from scratch" et de l'orchestration de services.


🛠️ Stack Technique

Orchestration : Docker Compose 

Serveur Web : Nginx (Configuré en tant que Reverse Proxy TLS/SSL) 

Base de données : MariaDB 

Application : WordPress (via PHP-FPM) 

OS de base : Alpine Linux / Debian (Images légères et sécurisées), j'ai préféré utiliser Debian car plus simple à manipuler.

Réseau : Bridge Network dédié avec isolation des conteneurs 


🏗️ Architecture du Projet

L'infrastructure est divisée en plusieurs unités logiques communiquant au sein d'un réseau interne privé :

Nginx : Point d'entrée unique. Seul conteneur exposé au monde extérieur via le port 443 (HTTPS).

WordPress + PHP-FPM : Gère la logique applicative. Isolé du réseau public.

MariaDB : Stockage des données. Isolé et accessible uniquement par le service WordPress.

Volumes : Persistance des données pour la base de données et les fichiers WordPress, garantissant qu'aucune donnée n'est perdue lors d'un redémarrage des conteneurs.


⚙️ Installation et Déploiement

Pré-requis: Docker & Docker Compose installés sur votre machine ainsi qu'un environnement Linux (recommandé).
