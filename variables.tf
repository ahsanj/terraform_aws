variable "aws_region" {}
variable "project_name" {}

variable "vpc_cidr" {}

variable  "public_cidrs" {}

variable "accessip" {}

variable "key_name" {}

variable "public_key_path" {}
variable "server_instance_type" {}

variable "instance_count" {
    default = 1
  
}




-------
Dns resloutuion within the cluster

Service dns

- Whenever the service is create kube dns create a record for the service. (maps the name to the service IP)

- Any pod can reach the service using the servive name for example

you can curl http://my-new-service (within the same namespace)

If different namespace

http://my-new-service.<namespace>.svc.cluster.local

Pod dns

- Records for the pods are not created by default
- We can enabled them kube chnage the dots with the dashes for example 10.72.128.39 -> 10-72-128-39

to access a pod

http://10-72-128-39.<namespace>.svc.cluster.local
-- INSERT --
Dns resloutuion within the cluster

Service dns

- Whenever the service is create kube dns create a record for the service. (maps the name to the service IP)

- Any pod can reach the service using the servive name for example

you can curl http://my-new-service (within the same namespace)

If different namespace

http://my-new-service.<namespace>.svc.cluster.local

Pod dns

- Records for the pods are not created by default
- We can enabled them kube chnage the dots with the dashes for example 10.72.128.39 -> 10-72-128-39

to access a pod

http://10-72-128-39.<namespace>.svc.cluster.local

--------
Core DNS
--------

- corefile is located at /etc/coredns/Corefile
   within this file plugins are configured
   if you see the kubernetes plugin you will see the top level domain(cluster.local)

- the file is passed as a configmap to the pod
  kubecetl describe configmap coredns -n kube-system

- kube-dns service allows coredns to avaiable to other componets of kube
  kubectl get service kube-system -n kube-system
-- INSERT --
Dns resloutuion within the cluster

Service dns

- Whenever the service is create kube dns create a record for the service. (maps the name to the service IP)

- Any pod can reach the service using the servive name for example

you can curl http://my-new-service (within the same namespace)

If different namespace

http://my-new-service.<namespace>.svc.cluster.local

Pod dns

- Records for the pods are not created by default
- We can enabled them kube chnage the dots with the dashes for example 10.72.128.39 -> 10-72-128-39

to access a pod

http://10-72-128-39.<namespace>.svc.cluster.local

--------
Core DNS
--------

- corefile is located at /etc/coredns/Corefile
   within this file plugins are configured
   if you see the kubernetes plugin you will see the top level domain(cluster.local)

- the file is passed as a configmap to the pod
  kubecetl describe configmap coredns -n kube-system

- kube-dns service allows coredns to avaiable to other componets of kube
  kubectl get service kube-system -n kube-system
  IP addgress of this service is configured as Nameserver on the pods (done by kubelet)

You can read more about coredns https://coredns.io/plugins/kubernetes/
