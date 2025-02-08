sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo yum install -y conntrack-tools

sudo usermod -aG docker ec2-user
newgrp docker

minikube start --driver=docker