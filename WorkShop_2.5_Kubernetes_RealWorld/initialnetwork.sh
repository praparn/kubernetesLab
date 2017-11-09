gcloud compute networks create "kubernetes-lab" --description "KubernetesLab-Network" --subnet-mode "custom"

gcloud compute networks subnets create "kubernetes-lab" \
--network "kubernetes-lab" --range "192.168.99.0/24"

gcloud beta compute firewall-rules create "kubernetes-lab-rule-internal" --allow all \
--description "KubernetesLab-FW-AllowINTERNAL" --direction "INGRESS" \
--priority "1000" --network "kubernetes-lab" --source-ranges "192.168.99.0/24"

gcloud beta compute firewall-rules create "kubernetes-lab-rule-sshicmp" --allow tcp:22,icmp \
--description "KubernetesLab-FW-AllowSSHICMP" --direction "INGRESS" \
--priority "1000" --network "kubernetes-lab" --source-ranges "0.0.0.0/0"

gcloud beta compute firewall-rules create "kubernetes-lab-rule-http" --allow tcp:80,tcp:443 \
--description "KubernetesLab-FW-AllowHTTP" --direction "INGRESS" \
--priority "1000" --network "kubernetes-lab" --source-ranges "0.0.0.0/0"

gcloud beta compute firewall-rules create "kubernetes-lab-rule-cert" --allow tcp:6443 \
--description "KubernetesLab-FW-AllowHTTP" --direction "INGRESS" \
--priority "1000" --network "kubernetes-lab" --source-ranges "0.0.0.0/0"

gcloud beta compute firewall-rules create "kubernetes-lab-rule-kubernetes" --allow tcp:30000-32767 \
--description "KubernetesLab-FW-AllowKUBERNETES" --direction "INGRESS" \
--priority "1000" --network "kubernetes-lab" --source-ranges "0.0.0.0/0"
