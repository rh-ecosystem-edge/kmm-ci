KMM_NAMESPACE ?= openshift-kmm

.PHONY: cluster-operators cluster-cleanup validate-release-manifests

cluster-operators:
	KMM_NAMESPACE="$(KMM_NAMESPACE)" ./ci/install-kmm

cluster-cleanup:
	KMM_NAMESPACE="$(KMM_NAMESPACE)" ./ci/cleanup-kmm

validate-release-manifests:
	@set -e; for manifest in releases/releases-*.json; do \
		jq -e '.version and (.kmm | type == "object" and length > 0) and (.kmm | all(.[]; type == "string" and test("@sha256:")))' "$$manifest" >/dev/null; \
		done
