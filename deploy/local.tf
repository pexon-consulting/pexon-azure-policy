locals {
  mgName = "TODO MG Name einfuegen"
  allowed_docker_images_regexes = [
    "^core\\\\.azurecr\\\\.io/.+$",
    "^(docker\\\\.io/)?jboss/keycloak:.+$",
    "^(docker\\\\.io/)?hawkbit/hawkbit-update-server:.+$",
    "^mcr\\\\.microsoft\\\\.com/oss/azure/aad-pod-identity/mic:.+$",
    "^mcr\\\\.microsoft\\\\.com/oss/azure/aad-pod-identity/nmi:.+$",
    "^mcr\\\\.microsoft\\\\.com/azure-cli(:.*)?$",
    "^quay\\\\.io/jetstack/cert-manager.+$",
    "^gcr\\\\.io/datadoghq/agent:.+$",
    "^gcr\\\\.io/datadoghq/cluster-agent:.+$",
    "^(k8s\\\\.gcr\\\\.io|registry\\\\.k8s\\\\.io)/kube-state-metrics/kube-state-metrics:.+$",
    "^mcr\\\\.microsoft\\\\.com/dotnet/aspnet:.+$",
    "^(k8s\\\\.gcr\\\\.io|registry\\\\.k8s\\\\.io)/ingress-nginx/controller:.+$",
    "^(docker\\\\.io/)?fluent/fluent-bit:.+$",
    "^quay\\\\.io/oauth2-proxy/oauth2-proxy:.+$",
    "^(k8s\\\\.gcr\\\\.io|registry\\\\.k8s\\\\.io)/ingress-nginx/kube-webhook-certgen:.+$",
    "^(docker\\\\.io/)?snyk/kubernetes-monitor:.+$",
    "^(docker\\\\.io/library/)?busybox:.+$",
    "^(docker\\\\.io/)?bitnami/redis:.+$",
    "^gcr\\\\.io/kubecost1/.+$",
    "^(docker\\\\.io/)?prom/node-exporter:.+$",
    "^quay.io/prometheus/prometheus:.+$",
    "^(docker\\\\.io/)?jimmidyson/configmap-reload:.+$",
    "^(docker\\\\.io/)?kiwigrid/k8s-sidecar:.+$",
    "^(docker\\\\.io/)?grafana/grafana:.+$",
    "^registry\\\\.crowdstrike\\\\.com/.+$",
    "^(docker\\\\.io/)?weaveworks/kured:.+$",
    "^(docker\\\\.io/)?rapid7/kubernetes-monitor:.+$",
    "^(docker\\\\.io/)?minio/minio:.+$",
    "^(docker\\\\.io/)?gitlab/gitlab-runner:.+$"
  ]

  allowed_docker_images_regex_kubernetes = join("|", local.allowed_docker_images_regexes)

  auditeffect            = "Audit"            # Deny # Disabled
  auditIfNotExistsEffect = "AuditIfNotExists" # Disabled
}
