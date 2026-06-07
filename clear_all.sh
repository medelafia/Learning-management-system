echo "Stage I : Clearing all helm charts on faculty-app namespace..."
echo "##############################################################"
helm list -n faculty-app --short | xargs -L1 helm uninstall -n faculty-app

echo "Stage II : Deleting databases and volumes.."
echo "##############################################################" 
DATABASES=("auth" "exam" "subject" "faculty")
for database_name in "${DATABASES[@]}"; do
    echo "##############################################################"
    echo "❌🔐 Deleting database-${database_name}-secret"  
    kubectl delete secret "database-${database_name}-secret" -n faculty-app
    echo "❌💾 Deleting volumes for ${database_name} database" 
    kubectl delete -f "./charts/database-${database_name}/Storage.yaml"
    echo "❌☸️ Deleting deployment and service for ${database_name} database" 
    kubectl delete -f "./charts/database-${database_name}/DeploymentService.yaml"
done
echo "✅✅ All databases deleted!"

echo "Stage III : Deleting microservices secrets..."
echo "##############################################################"
microservices=("config-server" "discovery-server" "auth-service" "api-gateway" "exam-service" "subject-service" "faculty-service")
for microservice in "${microservices[@]}"; do
    kubectl delete secret "${microservice}-secret" -n faculty-app
done
echo "✅✅ All microservices secrets deleted!"


echo "Stage VI : Deleting frontend configmap..."
echo "##############################################################"
kubectl delete configmap frontend-configmap -n faculty-app
echo "✅✅ All frontend configmap deleted!"


echo "✅✅✅✅ Finish!"