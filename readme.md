# Shell Utilities

Collection of utility shell scripts to automate often-used command combinations.

## Support ❤️

If you find the project useful, please consider supporting, or contributing.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/dubniczky)

## Install

Install the scripts with this one-liner command.

```bash
curl -fsSL https://raw.githubusercontent.com/dubniczky/Shell-Utilities/main/setup.sh | sh -
```

Or manually

1. Clone repository

```bash
git clone https://github.com/dubniczky/Shell-Utilities
```

2. Move to repository

```
cd Shell-Utilities
```

3. Run the installer

```
make install
or
chmod +x install.sh && ./install.sh
```

## Commands

|Command|Script|Tags|Description|
|---|---|---|---|
|`embark`|[source](./scripts/embark.sh)|`docker`|Build the local Dockerfile and quick run it with customizable parameters|
|`gitid`|[source](./scripts/gitid.sh)|`git`|Change the commit identity of the current git repository|
|`mop`|[source](./scripts/mop.sh)|`files`|Clean up common temporary files and folders in the current directory|
|`pubs`|[source](./scripts/pubs.sh)|`ssh`|An utility that prints the public ssh key of the current user or the specified user|
|`push`|[source](./scripts/push.sh)|`git`|Search for each git repository in current folder and push the commits|
|`bash16`|[source](./scripts/bash16.sh)|`random`|Generate cryptographically secure random base16 strings|
|`bash64`|[source](./scripts/bash64.sh)|`random`|Generate cryptographically secure random base64 strings|
|`sail`|[source](./scripts/sail.sh)|`docker`|Manage docker daemon|
|`sink`|[source](./scripts/sink.sh)|`docker`|Kill all currently running docker containers|
|`snek`|[source](./scripts/snek.sh)|`python`|Activate given python version as the python command|
|`venv`|[source](./scripts/venv.sh)|`python`|Initialize a python virtual environment and install packages|
