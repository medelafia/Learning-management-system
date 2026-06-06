helm list -n faculty-app --short | xargs -L1 helm uninstall -n faculty-app
DATABASES=("auth" "exam" "subject" "faculty")
for database_name in "${DATABASES[@]}"; do
    echo "Deleting database-${database_name}-secret"  
    kubectl delete secret "database-${database_name}-secret" -n faculty-app
    echo "Deleting volume for ${database_name} database" 
    kubectl delete -f "./charts/database-${database_name}/Storage.yaml"
    echo "Deleting deployment and service for ${database_name} database" 
    kubectl delete -f "./charts/database-${database_name}/DeploymentService.yaml"
done


microservices=("config-server" "discovery-server" "auth-service" "api-gateway" "exam-service" "subject-service" "faculty-service")
for microservice in "${microservices[@]}"; do
    kubectl delete secret "${microservice}-secret" -n faculty-app
done

kubectl delete configmap frontend-configmap -n faculty-app