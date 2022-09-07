Prerequisites:  
* The ODH operator is already installed
* If you want to use the minio installation in these scripts, 
you'll need openssl installed which is used to generate the secret key

Steps to install modelmesh-serving on ODH
1. `oc new-project opendatahub` 
2. `oc create -f ./modelmesh.yaml`

Steps to serve a model
1. `oc new-project testmodel`
2. `./servetriton.sh testmodel`  # This will create a minio with a random key and
will also create a secret for use by the ServingRuntime to be able to access that
storage.  Next, it will create an InferenceService (see triton.yaml) for the model.

Test inference
1. `route=$(oc get routes example-onnx-mnist --template={{.spec.host}}{{.spec.path}})`
2. `curl -k https://$route/infer -d @input.json`  # will use the sample input for this model

You should see a result that looks like this...
`{"model_name":"example-onnx-mnist__isvc-82e2bf7ea4","model_version":"1","outputs":[{"name":"Plus214_Output_0","datatype":"FP32","shape":[1,10],"data":[-8.233052,-7.749704,-3.4236808,12.363028,-12.079106,17.26659,-10.570972,0.7130786,3.3217115,1.3621225]}]}`