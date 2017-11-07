gcloud compute instances stop kubernetes-1 kubernetes-2 kubernetes-ms -q
gcloud beta compute firewall-rules delete "kubernetes-lab-rule-internal" -q
gcloud beta compute firewall-rules delete "kubernetes-lab-rule-sshicmp" -q
gcloud beta compute firewall-rules delete "kubernetes-lab-rule-http" -q
gcloud beta compute firewall-rules delete "kubernetes-lab-rule-cert" -q
gcloud beta compute firewall-rules delete "kubernetes-lab-rule-kubernetes" -q
gcloud compute instances delete kubernetes-1 kubernetes-2 kubernetes-ms -q
gcloud compute networks subnets delete "kubernetes-lab" -q
gcloud compute networks delete "kubernetes-lab" -q