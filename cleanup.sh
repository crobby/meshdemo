oc delete kfdef opendatahub &
oc patch kfdef opendatahub --type=merge -p '{"metadata": {"finalizers":null}}' -n opendatahub
oc delete crd servingruntimes.serving.kserve.io;oc delete crd inferenceservices.serving.kserve.io ;oc delete crd predictors.serving.kserve.io
oc delete project opendatahub
oc delete pod --all -n openshift-operators


