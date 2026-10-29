# kmm-ci

CI orchestration and QE test matrix for Kernel Module Management on OpenShift.

This repository owns the independent KMM QA workflows that run on OpenShift
CI. The reusable test implementation remains in
[`eco-gotests`](https://github.com/rh-ecosystem-edge/eco-gotests); this project
provides the QA-specific orchestration, version matrix, and Prow entry points.

## Scope

- Keep KMM pull-request presubmits focused and fast.
- Run independent KMM QA presubmits, postsubmits, and periodics.
- Use the KMM cluster pool through OpenShift CI cluster claims.
- Pin the KMM and eco-gotests revisions used by scheduled QA.
- Keep credentials in OpenShift CI Secret Manager; never store them here.

Hub/Spoke coverage and hardware-specific matrices will be added after the
regular single-cluster KMM baseline is stable.

## Local operator lifecycle

The same lifecycle commands used by the Prow steps can be run against a
configured cluster:

```bash
make cluster-operators
make cluster-cleanup
```

The installer creates a version-specific `kmm-konflux` CatalogSource from the
OCP-specific image in the matching `releases-*.json` manifest in
[`cvultur/kmm-konflux`](https://gitlab.cee.redhat.com/cvultur/kmm-konflux),
then installs KMM through an OLM Subscription. The namespace, package,
channel, release manifest, catalog image, and subscription can be overridden
with the corresponding `KMM_*` environment variables.
