# Prefix for the AKS cluster
rg_prefix         = "test-aks-cl1"
rg_prefix_short   = "test-cl1"
rg_cluster_prefix = "cl1"

# Tags
tags = {
  "CreatedBy"   = "terraform",
  "Environment" = "test",
  "Project"     = "AKS Cluster1 Test"
}

# User Assigned Idenity
mui_id = []