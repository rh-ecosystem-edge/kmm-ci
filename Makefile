KMM_NAMESPACE ?= openshift-kmm

.PHONY: cluster-operators cluster-cleanup

cluster-operators:
	KMM_NAMESPACE="$(KMM_NAMESPACE)" ./ci/install-kmm

cluster-cleanup:
	KMM_NAMESPACE="$(KMM_NAMESPACE)" ./ci/cleanup-kmm
