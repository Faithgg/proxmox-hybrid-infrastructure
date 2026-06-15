# 🌐 Inventaire Dynamique Proxmox Multi-Site avec Ansible Vault

Ce projet implémente une architecture d'inventaire dynamique Ansible multi-site pour interagir avec différents clusters Proxmox VE (`site1` et `site2`). Afin de respecter les exigences DevSecOps et d'éviter toute fuite d'identifiants sur GitHub, tous les secrets sont centralisés et chiffrés au repos via **Ansible Vault**.

---

## 📁 Structure des fichiers

```text
.
├── ansible.cfg                 # Configuration globale d'Ansible et des plugins
├── group_vars/
│   └── all/
│       └── vault.yml           # Variables chiffrées communes (clés d'accès)
└── inventories/                # Dossier centralisant les environnements
    ├── site1.proxmox.yml       # Configuration de l'inventaire pour le Site 1
    └── site2.proxmox.yml       # Configuration de l'inventaire pour le Site 2

```

---

## 🛠️ Prérequis

Avant d'exécuter les inventaires, assurez-vous que votre environnement local dispose des dépendances requises :

```bash
# Installation des modules Python requis pour Proxmoxer
pip install proxmoxer requests

# Vérification que la collection community.general est présente
ansible-galaxy collection install community.general

```

---

## 🔐 Informations pour l'Évaluation (Correcteurs)

Les identifiants d'accès pour les deux infrastructures Proxmox sont stockés de manière sécurisée dans le fichier global `group_vars/all/vault.yml`.

* **Mot de passe du Vault à donner pendant le rendu du projet**

Chaque fichier d'inventaire dans le dossier `inventories/` utilise un mécanisme de `lookup unvault` configuré sur le chemin relatif `group_vars/all/vault.yml` pour extraire et déchiffrer dynamiquement en mémoire les variables d'accès au moment de l'exécution, sans jamais écrire les secrets en clair sur le disque.

---

## 🚀 Exécution des inventaires

L'infrastructure étant segmentée, vous pouvez cibler et lister les ressources de chaque site indépendamment depuis la racine du projet. Le terminal vous invitera à saisir le mot de passe du Vault fourni ci-dessus.

### 📍 Options pour le Site 1

**Extraction de l'inventaire complet (Format YAML) :**

```bash
ansible-inventory -i inventories/site1.proxmox.yml --list --yaml --ask-vault-pass

```

**Visualisation sous forme de graphe (Arborescence des hôtes) :**

```bash
ansible-inventory -i inventories/site1.proxmox.yml --graph --ask-vault-pass

```

---

### 📍 Options pour le Site 2

**Extraction de l'inventaire complet (Format YAML) :**

```bash
ansible-inventory -i inventories/site2.proxmox.yml --list --yaml --ask-vault-pass

```

**Visualisation sous forme de graphe (Arborescence des hôtes) :**

```bash
ansible-inventory -i inventories/site2.proxmox.yml --graph --ask-vault-pass

```