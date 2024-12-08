FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y wget unzip curl zsh git-core fonts-powerline neovim chafa

ENV TERRAFORM_SWITCHER=v1.2.3
ENV TERRAFORM_DOCS_VERSION=0.19.0
ENV TERRAFORM_VERSION=1.5.7


# terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/terraform

# terraform-docs
RUN curl --fail -sSL -o /tmp/terraform-docs_linux-amd64.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
    tar -xvf/tmp/terraform-docs_linux-amd64.tar.gz -C /usr/local/bin

# terraform-switcher
RUN curl --fail -sSL -o /tmp/terraform-switcher_linux_amd64.tar.gz https://github.com/warrensbox/terraform-switcher/releases/download/${TERRAFORM_SWITCHER}/terraform-switcher_${TERRAFORM_SWITCHER}_linux_amd64.tar.gz && \
    tar -xvf /tmp/terraform-switcher_linux_amd64.tar.gz -C /usr/local/bin

# zsh shell
Run wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true


COPY ./shell-files/zshrc /root/.zshrc
COPY ./plink-cat-blink.gif /root/plink-cat-blink.gif
COPY ./shell-files/zprofile /root/.zprofile

RUN chsh -s /usr/bin/zsh


#ENTRYPOINT [ "/usr/bin/zsh", "-l" ]
