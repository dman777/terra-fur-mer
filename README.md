# terra-fur-mer
Docker container with Terraform tools

![plink-cat-blink](https://github.com/user-attachments/assets/3928f4d6-29e2-4b39-b770-9557c0ffa547)

Includes the TF tools:

* [terraform-switcher](https://github.com/warrensbox/terraform-switcher)
* [terraform-docs](https://github.com/warrensbox/terraform-switcher)
* [terraform](https://github.com/hashicorp/terraform)

Other includes:
* zsh shell
* neovim

Run with `docker compose run -it --rm terra-fur-mer`.

Note: To utilizie cli history for convience, create a `.docker_zsh_history` in your user's home directory. ie: `/home/user/.docker_zsh_history`.

Customize your mount points: 

```yaml
services:
  terra-fur-mer:
    build:
      context: .
      no_cache: true
    container_name: terra-fur-mer
    working_dir: /app
    volumes:
      # mount hist file to keep cli history
      # - /home/user/.docker_zsh_history:/app/.docker_zsh_history
      #
      # mount your proj to /app
      # - /home/user/project:/app
      #
      # mount your ssh key if needed
      # - /home/user/.ssh/id_rsa:/root/.ssh/id_rsa
      #
      # mount your terraform dir
      # - /home/two/.terraform.d:/root/.terraform.d
    environment:
      # key cli history for convience
      HISTFILE: /app/.docker_zsh_history
    entrypoint: [ "/usr/bin/zsh", "-l" ]
```
