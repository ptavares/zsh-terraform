![GitHub](https://img.shields.io/github/license/ptavares/zsh-terraform)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
![Release](https://img.shields.io/badge/Release_version-1.0.0-blue)

# zsh-terraform

zsh plugin for Terraform, a tool from Hashicorp for managing infrastructure safely and efficiently.

This plugins extends original oh-my-zsh plugin with aliases, functions and autocompletion.

It will also install and load some useful tools :
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfautomv](https://github.com/busser/tfautomv)

## Table of content

_This documentation section is generated automatically_

<!--TOC-->

- [zsh-terraform](#zsh-terraform)
  - [Table of content](#table-of-content)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Aliases](#aliases)
  - [Function](#function)
  - [Prompt function](#prompt-function)
  - [Updating Terraform tools](#updating-terraform-tools)
  - [License](#license)

<!--TOC-->

## Requirements

- [Terraform](https://terraform.io/)

You can install, manage different terraform versions using terraform for example

- [zsh-tfswitch](https://github.com/ptavares/zsh-tfswitch)

## Usage

- Using [Antigen](https://github.com/zsh-users/antigen)

Bundle `zsh-terraform` in your `.zshrc`

```shell script
antigen bundle ptavares/zsh-terraform
```

- Using [zplug](https://github.com/b4b4r07/zplug)

Load `zsh-terraform` as a plugin in your `.zshrc`

```shell script
zplug "ptavares/zsh-terraform"
```

- Using [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell script
zget load ptavares/zsh-terraform
```

- As an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone `zsh-terraform` into your custom plugins repo and load as a plugin in your `.zshrc`

```shell script
git clone https://github.com/ptavares/zsh-terraform.git ~/.oh-my-zsh/custom/plugins/zsh-terraform
```

```shell script
plugins+=(zsh-terraform)
```

Keep in mind that plugins need to be added before `oh-my-zsh.sh` is sourced.

- Manually

Clone this repository somewhere (`~/.zsh-terraform` for example) and source it in your `.zshrc`

```shell script
git clone https://github.com/ptavares/zsh-terraform ~/.zsh-terraform
```

```shell script
source ~/.zsh-terraform/zsh-terraform.plugin.zsh
```


## Aliases

| Alias       | Command              |
| ----------- | -------------------- |
| `tf`        | `terraform`          |
| `tff`       | `tf fmt`             |
| `tfv`       | `tf validate`        |
| `tfi`       | `tf init`            |
| `tfp`       | `tf plan`            |
| `tfa`       | `tf apply`           |
| `tfd`       | `tf destroy`         |
| `tfo`       | `tf output`          |
| `tfr`       | `tf refresh`         |
| `tfs`       | `tf show`            |
| `tfw`       | `tf workspace`       |
| `tffr`      | `tff -recursive`     |
| `tfip`      | `tfi & tfp`          |
| `tfia`      | `tfi & tfa`          |
| `tfid`      | `tfi & tfd`          |
| `tfa!`      | `tfa -auto-approve`  |
| `tfia!`     | `tfi && tfa!`        |
| `tfd!`      | `tfd -auto-approve`  |
| `tfid!`     | `tfi && tfd!`        |
| `tfversion` | `tf version`         |

## Function

`tfws [workspace_name]`

Will execute command :

`tfw select [workspace_name] || tfw new [workspace_name]`

## Prompt function

You can add the current Terraform workspace in your prompt by adding `$(tf_prompt_info)`
to your `PROMPT` or `RPROMPT` variable.

```sh
RPROMPT` | `$(tf_prompt_info)'
```

You can also specify the PREFIX and SUFFIX for the workspace with the following variables:

```sh
ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"
```

## Updating Terraform tools

The plugin comes with a zsh function to update all Terraform tools manually

```shell script
# From zsh shell
update_zsh_terraform
```

## License

[MIT](LICENCE)
