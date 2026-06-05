DATABASES=("auth" "exam" "subject" "faculty")


for database_name in "${DATABASES[@]}"; do
    echo "Creating database-${database}-secret"  
    kubectl create secret generic "database-${database_name}-secret" --from-env-file="./env-variables/.env.database_${database_name}" -n faculty-app
    echo "Creating volume for ${database_name} database" 
    kubectl apply -f "./charts/database-${database_name}/Storage.yaml"
    echo "Creating deployment and service for ${database} database" 
    kubectl apply -f "./charts/database-${database_name}/DeploymentService.yaml"
done


microservices=("config-server" "discovery-server" "auth-service" "api-gateway" "exam-service" "subject-service" "faculty-service")

for microservice in "${microservices[@]}"; do
    echo "Building image : ${microservice}-secret"  
    docker build -t "${microservice}:latest" "./${microservice}"
    docker tag "${microservice}:latest" "mohamedelafia/${microservice}:latest"
    echo "Pushing image : ${microservice}-secret"  
    docker push "mohamedelafia/${microservice}:latest"
    echo "Creating ${microservice}-secret"  
    kubectl create secret generic "${microservice}-secret" --from-env-file="./env-variables/.env.${microservice}" -n faculty-app

    helm upgrade --install "${microservice}" "./charts/${microservice}-chart" -n faculty-app
done