#!/bin/bash
if kubectl get configmap db-config &>/dev/null; then
    echo "ConfigMap 'db-config' already exists. Skipping creation."
else
    echo "Creating ConfigMap 'db-config' from .env file..."
    kubectl create configmap db-config --from-env-file=.env
fi

if kubectl get secret db-secret &>/dev/null; then
    echo "Secret 'db-secret' already exists. Skipping creation."
else
    echo "Creating Secret 'db-secret' from .env file..."
    kubectl create secret generic db-secret --from-env-file=.env
fi

