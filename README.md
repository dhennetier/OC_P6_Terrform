# OC_P6_Terrform
  Premier déploiement Terraform  sur AWS

# Prérequis : Compte AWS 

# Création compte AWS  pour ne pas utiliser le Root User 
  ## Prérequis : Compte AWS 🔑
- Compte IAM **ocp6-terraform** (sans accès console)
- Politique : `AmazonEC2FullAccess`
- Clé d'accès : `*******************` (à ne **jamais** partager !)
- clé d'accès secrète ***********************************  (à ne **jamais** partager !)  
   
# Variables environnement à positionner TERRAFOM 
 ```bash
# 
  AWS_DEFAULT_REGION=eu-west-3
  
  AWS_ACCESS_KEY_ID=AKIAVX56TA3LHZJB3UGK
  
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

:warning: # Suppression des ressources 
  terraform destroy 
