docker build -t walkib/multi-client:latest -t walkib/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t walkib/multi-server:latest -t walkib/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t walkib/multi-worker:latest -t walkib/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push walkib/multi-client:latest 
docker push walkib/multi-server:latest
docker push walkib/multi-worker:latest

docker push walkib/multi-client:$SHA
docker push walkib/multi-server:$SHA
docker push walkib/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=walkib/multi-client:$SHA
kubectl set image deployments/server-deployment server=walkib/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=walkib/multi-worker:$SHA