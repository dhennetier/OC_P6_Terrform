# --------------------------------------------------------------------------------
# Configuration du provider AWS
# Region :  "eu-west-3"  pour PARIS 
#
# Création vm de type t3.micro : 
#          ami-0808dd1ba12547041"  # Debian 13 sur eu-west-3
#
# Paires de clé ssh crée sur Console AWS : awsdeb13.ppk ( key_name )
#
# --------------------------------------------------------------------------------
# creation Terraform 
# * règle de sécurité pour autoriser ssh 
#         pour mon cas , seule ip public de ma box est autorisé en ssh vers VM
# * Création d une VM qui en sortie du apply donne IP publique
#         connexion ssh putty , 
#         pc sur mon ip publique , 
#         clé ssh ajoutée dans la config putty
# --------------------------------------------------------------------------------

provider "aws" {
  region = "eu-west-3"
}

# Création groupe de sécurité  AWS 
# qui autorise le SSH depuis une IP publique ( ex: routeur internet ,box perso ici )

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_terraform"
  description = "Allow SSH access from my current public IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["88.164.5.228/32"]  # IP BOX ou point entrée internet société
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Autorise la VM à sortir vers Internet
  }
}

# Création de la VM: tfvm1_deb13
resource "aws_instance" "tfvm1_deb13" {
  ami             = "ami-0808dd1ba12547041"  
  instance_type   = "t3.micro"
  key_name        = "awsdeb13"     
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "First-VM-Terraform"
  }
}

# Affichage de l'IP publique de la VM après création
output "instance_ip" {
  value = aws_instance.tfvm1_deb13.public_ip
}

