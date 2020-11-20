# terraform-module-minio

## Description

- Create buckets
- Create iam_user name with name of bucket and bind full permission to its bucket

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| minio | 1.10.2 |

## Inputs

Ref: [variables.tf](variables.tf)


## Example

### Terragrunt

terragrunt.hcl

``` hcl
terraform {
  source = "github.com/hpsony94/terraform-module-minio"
}

inputs = merge(
  yamldecode(
    file("${get_terragrunt_dir()}/values.yml"),
  ),
)
```

values.yml
``` yaml
minio_server: minio:9000
minio_access_key: admin
minio_secret_key: secretsecret

buckets:
- name: test01
  acl: private
- name: test02
  acl: public
```