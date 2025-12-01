# OC_P6_Terrform
:rocket: Premier déploiement Terraform  sur AWS

# Création compte AWS  pour ne pas utiliser le Root User 
  ## Prérequis : Compte AWS 🔑
- Compte IAM **ocp6-terraform** (sans accès console)
- Politique : `AmazonEC2FullAccess`
 ## Créé une clé d accès pour le compte  IAM ocp6-terraform
- Clé d'accès : `*******************` (à ne **jamais** partager !)  Var env : AWS_ACCESS_KEY_ID
- clé d'accès secrète ***********************************  (à ne **jamais** partager !)   Var env : AWS_SECRET_ACCESS_KEY


# Variables environnement à positionner TERRAFOM 
 ```bash
  AWS_DEFAULT_REGION=eu-west-3
  
  AWS_ACCESS_KEY_ID=*******************
  
  AWS_SECRET_ACCESS_KEY=Xxxxxxxx-secret-xxxxxxxxxxxxxxxxxxxxxxxx
``` 

# Fichier Terraform main.tf 
  Commandes : 
 ```bash
  terraform init 
  terraform plan 
  terraform apply
  teraform show 
```

:warning: 
# Suppression des ressources 
 ```bash
  terraform destroy 
```
