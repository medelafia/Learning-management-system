helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update 

kubectl create secret generic database-auth-secret --from-env-file=./env-variables/.env.database_auth -n faculty
kubectl create secret generic database-exam-secret --from-env-file=./env-variables/.env.database_exam -n faculty
kubectl create secret generic database-subject-secret --from-env-file=./env-variables/.env.database_subject -n faculty
kubectl create secret generic database-faculty-secret --from-env-file=./env-variables/.env.database_faculty -n faculty

helm upgrade --install database-auth bitnami/mysql -n faculty -f ./charts/database-auth/values.yaml \
    --set auth.existingSecret=database-auth-secret

helm upgrade --install database-exam bitnami/mysql -n faculty -f ./charts/database-exam/values.yaml\
    --set auth.existingSecret=database-exam-secret

helm upgrade --install database-subject bitnami/mysql -n faculty -f ./charts/database-subject/values.yaml \
    --set auth.existingSecret=database-subject-secret

helm upgrade --install database-faculty bitnami/mysql -n faculty -f ./charts/database-faculty/values.yaml\
    --set auth.existingSecret=database-faculty-secret


kubectl create secret generic auth-service-secret --from-env-file=./env-variables/.env.auth_service -n faculty
kubectl create secret generic api-gateway-secret --from-env-file=./env-variables/.env.api_gateway -n faculty
kubectl create secret generic discovery-service-secret --from-env-file=./env-variables/.env.discovery_service -n faculty
kubectl create secret generic config-server-secret --from-env-file=./env-variables/.env.config_server -n faculty
kubectl create secret generic exam-service-secret --from-env-file=./env-variables/.env.exam_service -n faculty
kubectl create secret generic subject-service-secret --from-env-file=./env-variables/.env.subject_service -n faculty
kubectl create secret generic faculty-service-secret --from-env-file=./env-variables/.env.faculty_service -n faculty

eval $(minikube docker-env)
docker build -t config-service-container:latest ./config-server
docker build -t api-gateway-container:latest ./api-gateway
docker build -t discovery-service-container:latest ./discovery-server
docker build -t auth-service-container:latest ./auth-service
docker build -t exam-service-container:latest ./exam-service
docker build -t faculty-service-container:latest ./faculty-service
docker build -t subject-service-container:latest ./subject-service

helm install api-gateway ./charts/api-gateway-chart -n faculty
helm install auth-service ./charts/auth-service-chart -n faculty
helm install config-service ./charts/config-service-chart -n faculty
helm install discovery-service ./charts/discovery-service-chart -n faculty
helm install exam-service ./charts/exam-service-chart -n faculty
helm install faculty-service ./charts/faculty-service-chart -n faculty
helm install subject-service ./charts/subject-service-chart -n faculty