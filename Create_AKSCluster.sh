!/bin/bash
# update credentials 
rm -vf ${HOME}/.aws/credentials  ## deletes the existing credential file
vi ~/.aws/credentials ## paste the credentials here as shown in the above picture
vi notes.txt  ## Reminder to disable the AWS credentials

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f ./kubectl
# install jq
sudo yum -y install jq gettext bash-completion moreutils
# Update AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# Enable eksctl bash completion
eksctl completion bash >> ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
# Add kubectl alias
echo "alias k=kubectl" >> ~/.bashrc 
 . ~/.bashrc
# Optional: Set loadBalancer Controller version
echo 'export LBC_VERSION="v2.4.1"' >>  ~/.bash_profile
echo 'export LBC_CHART_VERSION="1.4.1"' >>  ~/.bash_profile
.  ~/.bash_profile
# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv -v /tmp/eksctl /usr/local/bin
# Install bash completion 
kubectl completion bash >>  ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion
# Create the cluster - this steps will take a few minutes
# https://eksctl.io/usage/creating-and-managing-clusters/
eksctl create cluster -f eks_config.yaml
#eksctl delete cluster --name clo835 --region us-east-1
