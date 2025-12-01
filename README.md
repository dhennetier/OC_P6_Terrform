# OC_P6_Terrform
  Premier déploiement Terraform  sur AWS

# Prérequis : Compte AWS 

# Création compte AWS  pour ne pas utiliser le Root User 
  ocp6-terraform  sans accès console 
       1 seule politique affectée au compte : AmazonEC2FullAccess
   clé accès générée pour ce compte AKIAVX56TA3LHZJB3UGK avec sa secret accèes key 
   
# Variables environnement à positionner TERRAFOM 
 ```bash
# Commande en couleur (si votre terminal le supporte)
  AWS_DEFAULT_REGION=eu-west-3
  
  AWS_ACCESS_KEY_ID=AKIAVX56TA3LHZJB3UGK
  
  AWS_SECRET_ACCESS_KEY=Xxxxxxxx-secret-xxxxxxxxxxxxxxxxxxxxxxxx
``` 

# Fichier Terraform main.tf 
  Commandes : 
  terraform init 
  terraform plan 
  terraform apply
  teraform show 

:warning: # Suppression des ressources 
  terraform destroy 
