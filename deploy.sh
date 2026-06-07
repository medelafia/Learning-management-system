####################################################################################################
####    Copy Right 2026 (C) Mohamed EL AFIA                                                        #
####    script : setup_all.sh                                                                      #
####    description : This script is responsible for setup the entire application and their        #
####                  dependancies on kubernetes cluster (databases , microservies, ...)           #             
####################################################################################################


echo " --------------------------------------------------------------"
echo "|                Stage I: Cheking namespace                    |"
echo " --------------------------------------------------------------"

if kubectl get namespace faculty-app >/dev/null 2>&1; then
    echo "🎓✅ faculty-app namespace already exists"
else    
    echo "🎓 Creating faculty-app namespace..."
    kubectl create namespace faculty-app
    echo "🎓✅ faculty-app namespace created..."
fi

DATABASES=("auth" "exam" "subject" "faculty")
echo " --------------------------------------------------------------"
echo "|                Stage II: Deploying databases                 |"
echo " --------------------------------------------------------------"
for database_name in "${DATABASES[@]}"; do 
    if kubectl get secret "database-${database_name}-secret" >/dev/null 2>&1; then
        echo "🎓✅ database-${database_name}-secret secret already exists"
    else    
       echo "🦈🔐 Creating database-${database_name}-secret..."  
        kubectl create secret generic "database-${database_name}-secret" --from-env-file="./env-variables/.env.database_${database_name}" -n faculty-app
    fi
    echo "🦈💾 Creating volume for ${database_name} database..." 
    kubectl apply -f "./charts/database-${database_name}/Storage.yaml"
    echo "🦈⛏️⚒️ Creating deployment and exposing service for ${database} database..." 
    kubectl apply -f "./charts/database-${database_name}/DeploymentService.yaml"
done
echo "✅✅ All databases are ready now!"

microservices=("config-server" "discovery-server" "auth-service" "api-gateway" "exam-service" "subject-service" "faculty-service")
echo " --------------------------------------------------------------"
echo "|            Stage III: Deploying microservices                |"
echo " --------------------------------------------------------------"
for microservice in "${microservices[@]}"; do
    echo "###############################################################"
    echo "⚒️💿 Building ${microservice} image :"  
    docker build -t "${microservice}:latest" "./${microservice}"
    echo "🔗💿 Tagging image : ${microservice}" 
    docker tag "${microservice}:latest" "mohamedelafia/${microservice}:latest"
    echo "📌💿 Pushing ${microservice} image "
    docker push "mohamedelafia/${microservice}:latest"
    if kubectl get secret "${microservice}-secret" >/dev/null 2>&1; then
        echo "🎓✅ ${microservice}-secret already exists"
    else    
        echo "🔐💿 Creating ${microservice}-secret" 
        kubectl create secret generic "${microservice}-secret" --from-env-file="./env-variables/.env.${microservice}" -n faculty-app
    fi
    echo "☸️🚀 Deploying ${microservice} on the cluster"  
    helm upgrade --install "${microservice}" "./charts/${microservice}-chart" -n faculty-app
done
echo "✅✅ All microservices are ready now!"


## preparing frontend
echo " --------------------------------------------------------------"
echo "|             Stage IV: Deploying frontend                     |"
echo " --------------------------------------------------------------"
IP_ADDRESS=$(kubectl get svc api-gateway-service -n faculty-app -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "✅ Api gateway IP address resolved : $IP_ADDRESS"

echo "⚒️💿 Building frontend image..." 
docker build -t faculty-app-frontend:latest ./frontend
echo "🔗💿 Tagging frontend image..." 
docker tag faculty-app-frontend:latest mohamedelafia/faculty-app-frontend:latest
echo "📌💿 Pushing frontend image..." 
docker push mohamedelafia/faculty-app-frontend:latest
echo "⚙️💿 Creating configmap for frontend..."  
kubectl create configmap frontend-configmap --from-literal=API_ENDPOINT="${IP_ADDRESS}" -n faculty-app
echo "☸️🚀 Deploying frontend on the cluster"  
helm upgrade --install faculty-app-frontend "./charts/frontend-chart" -n faculty-app

echo "✅✅ Frontend is ready now!"
echo "✅✅ application is ready now!"
