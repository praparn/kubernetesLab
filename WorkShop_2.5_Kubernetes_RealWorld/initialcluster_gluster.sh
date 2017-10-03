gcloud compute instances create "kubernetes-ms" --machine-type "n1-standard-1" \
--subnet "kubernetes-lab" --maintenance-policy "MIGRATE" \
--image "ubuntu-1604-xenial-v20170619a" --image-project "ubuntu-os-cloud" \
--boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "kubernetes-ms" \
--private-network-ip 192.168.99.200

gcloud compute instances create "kubernetes-1" --machine-type "n1-standard-1" \
--subnet "kubernetes-lab" --maintenance-policy "MIGRATE" \
--image "ubuntu-1604-xenial-v20170619a" --image-project "ubuntu-os-cloud" \
--boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "kubernetes-1" \
--private-network-ip 192.168.99.201

gcloud compute instances create "kubernetes-2" --machine-type "n1-standard-1" \
--subnet "kubernetes-lab" --maintenance-policy "MIGRATE" \
--image "ubuntu-1604-xenial-v20170619a" --image-project "ubuntu-os-cloud" \
--boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "kubernetes-2" \
--private-network-ip 192.168.99.202

gcloud compute --project=kubernetesproject-170714 disks create glusterfa-ms \
--type=pd-standard --description=glusterfa-ms --image=ubuntu-1604-xenial-v20170721 \
--image-project=ubuntu-os-cloud --size=10GB

gcloud compute --project=kubernetesproject-170714 disks create glusterfa-1 \
--type=pd-standard --description=glusterfa-ms --image=ubuntu-1604-xenial-v20170721 \
--image-project=ubuntu-os-cloud --size=10GB

gcloud compute --project=kubernetesproject-170714 disks create glusterfa-2 \
--type=pd-standard --description=glusterfa-ms --image=ubuntu-1604-xenial-v20170721 \
--image-project=ubuntu-os-cloud --size=10GB

gcloud compute instances attach-disk kubernetes-ms --disk glusterfa-ms

gcloud compute instances attach-disk kubernetes-1 --disk glusterfa-1

gcloud compute instances attach-disk kubernetes-2 --disk glusterfa-2