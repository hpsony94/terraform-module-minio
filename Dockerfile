FROM alpine/terragrunt:0.13.5

RUN mkdir -p "$HOME/.terraform.d/plugins/github.com/aminueza/minio/1.1.0/linux_amd64/"

RUN wget https://github.com/aminueza/terraform-provider-minio/releases/download/v1.1.0/terraform-provider-minio_v1.1.0_linux_amd64 && \
    chmod +x terraform-provider-minio_v1.1.0_linux_amd64 && \
    mv terraform-provider-minio_v1.1.0_linux_amd64 "$HOME/.terraform.d/plugins/github.com/aminueza/minio/1.1.0/linux_amd64/"
