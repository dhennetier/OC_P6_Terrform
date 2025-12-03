
# OC_P6_Terrform
:rocket: Premier déploiement Terraform  sur AWS

# Création compte AWS  pour ne pas utiliser le Root User 
  ## Prérequis : Compte AWS 🔑
- Compte IAM **ocp6-terraform** (sans accès console)
- Politique restreinte : `AmazonEC2FullAccess`
 ## Créé une clé d accès pour le compte  IAM ocp6-terraform
- Clé d'accès : `*******************` (à ne **jamais** partager !)  Var env : AWS_ACCESS_KEY_ID
- clé d'accès secrète ***********************************  (à ne **jamais** partager !)   Var env : AWS_SECRET_ACCESS_KEY


# Variables environnement à positionner pour TERRAFOM 
 ```bash
  AWS_DEFAULT_REGION=eu-west-3
  AWS_ACCESS_KEY_ID=*******************
  AWS_SECRET_ACCESS_KEY=Xxxxxxxx-secret-xxxxxxxxxxxxxxxxxxxxxxxx
``` 

:file_folder:
# Fichier Terraform main.tf 
## Commandes terraform à lancer dans l'ordre : 
 ```bash
  terraform validate #syntaxe fichier tf
  terraform init 
  terraform plan 
  terraform apply
  teraform show 
```
 ## En sortie de terraform apply : adresse IP publique de la VM 
 ```bash

    Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
    Outputs:

    instance_ip = "13.39.111.66"
```

# Connexion en ssh sur  Ip publique avec clé ssh awsdeb13.ppk (créée sur AWS ) , compte admin

### Récupération de l Ip publique une fois connecté

 ```bash    
        admin@ip-172-31-43-5:~$ curl http://169.254.169.254/latest/meta-data/public-ipv4
         13.39.111.66
```

  ### Récupération de l'Id de l'instance AWS

 ```bash    
        admin@ip-172-31-43-5:~$ curl http://169.254.169.254/latest/meta-data/instance-id
        i-0017a24562b853fb3
```
# Remarque : Obtenir une adresse IP fixe (ne change pas au reboot)
## Vocabulaire AWS : une adresse IP élastique (eip) 
### Dans le fichier main.tf 
 ```bash
resource "aws_eip" "my_eip" {
  instance = aws_instance.my_server.id
  tags = {
    Name = "OpenClassrooms-P6-EIP"
  }
}

output "public_ip" {
  value = aws_eip.my_eip.public_ip
}


 ```
:warning: 
# Suppression des ressources 
 ```bash
  terraform destroy 
```
