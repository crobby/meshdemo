SECRETKEY=$(openssl rand -hex 32)
sed "s/<secretkey>/$SECRETKEY/g" sample-minio.yaml > minio.yaml

oc apply -f minio.yaml -n $1
oc apply -f triton.yaml -n $1

