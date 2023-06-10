eksctl create cluster --name=eksdemo1 \
                      --region=us-east-2 \
                      --zones=us-east-2a,us-east-2b \
                      --without-nodegroup

eksctl utils associate-iam-oidc-provider \
    --region us-east-2 \
    --cluster eksdemo1 \
    --approve

eksctl create nodegroup --cluster=eksdemo1 \
                       --region=us-east-2 \
                       --name=eksdemo1-ng-public1 \
                       --node-type=t3.medium \
                       --nodes=2 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=kube-demo \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access

eksctl get cluster

kubectl get nodes -o wide
