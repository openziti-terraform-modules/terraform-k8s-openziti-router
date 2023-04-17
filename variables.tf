variable "name" {
    description = "unique name of this edge router"
}

variable "edge_advertised_host" {
    description = "optional DNS name advertised to edge clients that they use to reach this router's edge listener"
    default = ""
}

variable "transport_advertised_host" {
    description = "optional DNS name advertised to other routers that they use to reach this router's transport link listener"
    default = ""
}

variable "ctrl_endpoint" {
    description = "the host:port pair this router should use to contact the controller"
}

variable "namespace" {
    description = "Kubernetes namespace in which to place this router"
    default = "ziti"
}

variable "ziti_charts" {
    description = "alternative filesystem path to find OpenZiti Helm Charts"
}

variable "storage_class" {
    description = "storage class to fulfill this router's persistent volume claim"
    default = "-"
}

variable "router_properties" {
    description = "declared map of router properties overrides defaults except name"
}

variable "values" {
    description = "additional values to merge with the Helm chart overrides any that conflict"
    default = {}
}

variable "default_router_properties" {
    description = "default properties for the router created by this module"
    default = {
        isTunnelerEnabled = true
    }
}

variable "ingress_annotations" {
    description = "annotations on the router's ingress resource to trigger ingress-nginx controller"
    default = {
        "kubernetes.io/ingress.allow-http" = "false"
        "nginx.ingress.kubernetes.io/ssl-passthrough" = "true"
        "nginx.ingress.kubernetes.io/secure-backends" = "true"
    }
}

variable "image_repo" {
    description = "debug value for alternative container image repo"
    default = "openziti/ziti-router"
}

variable "image_tag" {
    description = "debug value for container image tag"
    default = ""
}

variable "image_pull_policy" {
    description = "debug value for container image pull policy"
    default = "IfNotPresent"
}