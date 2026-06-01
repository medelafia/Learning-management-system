helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update 

helm install database-auth bitnami/mysql --namespace faculty -f ./charts/database-auth/values.yaml \
    --set auth.rootPassword=./env-variables/.env.database_auth:MYSQL_ROOT_PASSWORD \
    --set auth.database=./env-variables/.env.database_auth:MYSQL_DATABASE \
    --set auth.username=./env-variables/.env.database_auth:MYSQL_USER \
    --set auth.password=./env-variables/.env.database_auth:MYSQL_PASSWORD 

helm install database-exam bitnami/mysql --namespace faculty -f ./charts/database-exam/values.yaml\
    --set auth.rootPassword=./env-variables/.env.database_exam:MYSQL_ROOT_PASSWORD \
    --set auth.database=./env-variables/.env.database_exam:MYSQL_DATABASE \
    --set auth.username=./env-variables/.env.database_exam:MYSQL_USER \
    --set auth.password=./env-variables/.env.database_exam:MYSQL_PASSWORD 

helm install database-subject bitnami/mysql --namespace faculty -f ./charts/database-subject/values.yaml \
    --set auth.rootPassword=./env-variables/.env.database_subject:MYSQL_ROOT_PASSWORD \
    --set auth.database=./env-variables/.env.database_subject:MYSQL_DATABASE \
    --set auth.username=./env-variables/.env.database_subject:MYSQL_USER \
    --set auth.password=./env-variables/.env.database_subject:MYSQL_PASSWORD 

helm install database-faculty bitnami/mysql --namespace faculty -f ./charts/database-faculty/values.yaml\
    --set auth.rootPassword=./env-variables/.env.faculty:MYSQL_ROOT_PASSWORD \
    --set auth.database=./env-variables/.env.faculty:MYSQL_DATABASE \
    --set auth.username=./env-variables/.env.faculty:MYSQL_USER \
    --set auth.password=./env-variables/.env.faculty:MYSQL_PASSWORD 


kubectl create secret generic auth-service-secret --from-file=./env-variables/.env.auth_service -n faculty
kubectl create secret generic api-gateway-secret --from-file=./env-variables/.env.api_gateway -n faculty
kubectl create secret generic discovery-service-secret --from-file=./env-variables/.env.discovery_service -n faculty
kubectl create secret generic config-server-secret --from-file=./env-variables/.env.config_server -n faculty
kubectl create secret generic exam-service-secret --from-file=./env-variables/.env.exam_service -n faculty
kubectl create secret generic subject-service-secret --from-file=./env-variables/.env.subject_service -n faculty
kubectl create secret generic faculty-service-secret --from-file=./env-variables/.env.faculty_service -n faculty

helm install api-gateway ./charts/api-gateway-chart -n faculty
helm install auth-service-chart ./charts/auth-service-chart -n faculty
helm install config-service-chart ./charts/config-service-chart -n faculty
helm install discovery-service-chart ./charts/discovery-service-chart -n faculty
helm install exam-service-chart ./charts/exam-service-chart -n faculty
helm install faculty-service-chart ./charts/faculty-service-chart -n faculty
helm install subject-service-chart ./charts/subject-service-chart -n faculty