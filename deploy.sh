
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update 

helm install database-auth bitnami/mysql --namespace faculty -f ./charts/database-auth/values.yaml \
    --set-file auth.rootPassword=./env-variables/.env.database_auth:MYSQL_ROOT_PASSWORD \
    --set-file auth.database=./env-variables/.env.database_auth:MYSQL_DATABASE \
    --set-file auth.username=./env-variables/.env.database_auth:MYSQL_USER \
    --set-file auth.password=./env-variables/.env.database_auth:MYSQL_PASSWORD 

helm install database-exam bitnami/mysql --namespace faculty -f ./charts/database-exam/values.yaml\
    --set-file auth.rootPassword=./env-variables/.env.database_exam:MYSQL_ROOT_PASSWORD \
    --set-file auth.database=./env-variables/.env.database_exam:MYSQL_DATABASE \
    --set-file auth.username=./env-variables/.env.database_exam:MYSQL_USER \
    --set-file auth.password=./env-variables/.env.database_exam:MYSQL_PASSWORD 

helm install database-subject bitnami/mysql --namespace faculty -f ./charts/database-subject/values.yaml \
    --set-file auth.rootPassword=./env-variables/.env.database_subject:MYSQL_ROOT_PASSWORD \
    --set-file auth.database=./env-variables/.env.database_subject:MYSQL_DATABASE \
    --set-file auth.username=./env-variables/.env.database_subject:MYSQL_USER \
    --set-file auth.password=./env-variables/.env.database_subject:MYSQL_PASSWORD 

helm install database-faculty bitnami/mysql --namespace faculty -f ./charts/database-faculty/values.yaml\
    --set-file auth.rootPassword=./env-variables/.env.faculty:MYSQL_ROOT_PASSWORD \
    --set-file auth.database=./env-variables/.env.faculty:MYSQL_DATABASE \
    --set-file auth.username=./env-variables/.env.faculty:MYSQL_USER \
    --set-file auth.password=./env-variables/.env.faculty:MYSQL_PASSWORD 


#kubectl create secret geniric auth-service-secret --from-file=./env-variables/.env.auth_service -n faculty
#kubectl create secret geniric api-gateway-secret --from-file=./env-variables/.env.api_gateway -n faculty
#kubectl create secret geniric discovery-service-secret --from-file=./env-variables/.env.discovery_service -n faculty
#kubectl create secret geniric config-server-secret --from-file=./env-variables/.env.config_server -n faculty
#kubectl create secret geniric exam-service-secret --from-file=./env-variables/.env.exam_service -n faculty
#kubectl create secret geniric subject-service-secret --from-file=./env-variables/.env.subject_service -n faculty
#kubectl create secret geniric faculty-service-secret --from-file=./env-variables/.env.faculty_service -n faculty

