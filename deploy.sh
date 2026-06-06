




DATABASES=("auth" "exam" "subject" "faculty")
echo " --------------------------------------------------------------"
echo "|                Stage I: Deploying databases                  |"
echo " --------------------------------------------------------------"
for database_name in "${DATABASES[@]}"; do

    echo "🦈🔐 Creating database-${database_name}-secret..."  
    kubectl create secret generic "database-${database_name}-secret" --from-env-file="./env-variables/.env.database_${database_name}" -n faculty-app
    echo "🦈💾 Creating volume for ${database_name} database..." 
    kubectl apply -f "./charts/database-${database_name}/Storage.yaml"
    echo "🦈⛏️⚒️ Creating deployment and exposing service for ${database} database..." 
    kubectl apply -f "./charts/database-${database_name}/DeploymentService.yaml"
done


microservices=("config-server" "discovery-server" "auth-service" "api-gateway" "exam-service" "subject-service" "faculty-service")
echo " --------------------------------------------------------------"
echo "|              Stage I: Deploying microservices                |"
echo " --------------------------------------------------------------"
for microservice in "${microservices[@]}"; do
    echo "⚒️ Building image : ${microservice}"  
    docker build -t "${microservice}:latest" "./${microservice}"
    docker tag "${microservice}:latest" "mohamedelafia/${microservice}:latest"
    echo "Pushing image : ${microservice}"  
    docker push "mohamedelafia/${microservice}:latest"
    echo "Creating ${microservice}-secret"  
    kubectl create secret generic "${microservice}-secret" --from-env-file="./env-variables/.env.${microservice}" -n faculty-app

    helm upgrade --install "${microservice}" "./charts/${microservice}-chart" -n faculty-app
done


## preparing frontend

IP_ADDRESS=$(kubectl get svc api-gateway-service -n faculty-app -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "Building frontend image..." 
docker build -t faculty-app-frontend:latest ./frontend
echo "Tagging frontend image..." 
docker tag faculty-app-frontend:latest mohamedelafia/faculty-app-frontend:latest
echo "Pushing frontend image..." 
docker push mohamedelafia/faculty-app-frontend:latest
echo "Image ready!"

kubectl create configmap frontend-configmap --from-literal=API_ENDPOINT="${IP_ADDRESS}" -n faculty-app
helm upgrade --install faculty-app-frontend "./charts/frontend-chart" -n faculty-app
