
Job Manager - Helm Chart for Kubernetes
=======================================

About
-----

Provides a helm chart to deploy a fully working Job Manager software suite on the Kubernetes you want.

Related to Job Manager project : 

 - https://github.com/ronhanson/python-jobmanager-client
 - https://github.com/ronhanson/python-jobmanager-api
 - https://github.com/ronhanson/python-jobmanager-common


Usage
-----

First, check `helm/values.yml` file to change settings.

Use helm to install :

    > helm install --name my-jobmanager-release --debug ./helm
    
To update : 

    > helm upgrade my-jobmanager-release --debug ./helm

To uninstall : 

    > helm delete my-jobmanager-release --purge

A test docker-compose file is also provided.

The you should be able to access services:
 
 - Jobmanager API : `http://<node_ip>/api`
 - Jobmanager Builder : `http://<node_ip>/builder`


Warning
-------

This chart is in its first version.

Making the Jobmanager work on Kubernetes is a work in progress.

This work is early beta and NOT production ready.


Compatibility
-------------

Tested with : 

 - Helm : client version v2.11.0 - tiller v2.11.0
 - Kubernetes : v1.10.3

Works on GKE, but also well with k8s on Docker for Mac.


Author & Licence
----------------

Copyright (c) 2018 Ronan Delacroix

This program is released under MIT Licence. Feel free to use it or part of it anywhere you want.
 
