# Devkit


## TL;DR

1. Install devkit
```
curl -sSL https://raw.githubusercontent.com/42dev-co/devkit/main/devkit-install.sh | bash
```

2. Methods to list all the Task
```
task
task --list
```

3. Install a module
```
task install_mod url=<https://....>
```

4. Update all modules
```
task update_mod
```

5. Update all modules including devkit Taskfile
```
task update
```

## Usage
The purpose of devkit is to setup a common task script for ur daily use.
One such usage is that repetitive task or scripts can be install as modules, published and maintain by both private and public repos. 

Example: 

```
task mod_install REPO_URL=https://github.com/42dev-co/otf-tasks.git
task mod:otf:init name=someproject description="A opentofu project" tier=2
```
1. the first command installs a module for opentofu scaffolding
2. the second commands uses the module task script to scaffold a new OpenTofu project name `someproject`


## What comes along with devkit

For following packages is what is install in a "*nix" base OS when you run the install devkit command.
```
curl -sSL https://raw.githubusercontent.com/42dev-co/devkit/main/devkit-install.sh | bash
```

1. [Devbox](https://www.jetify.com/devbox) - A nix wrapper, user friendly
2. [Nix](https://nixos.org/download/) - Next Generation Package Management
3. [go-tasks](https://taskfile.dev/) - Task is a task runner / build tool that aims to be simpler and easier to use than, for example, GNU Make.


## Modules

### How to make a module
Create a taskfile and put it into git repo. Your repo shall contain the `-tasks` suffix.
For example, https://github.com/42dev-co/otf-tasks.git will be install to `./modules/otf` folder. 

After a module is install, you can run `task mod:otf:<task> <param1>=<value1> <param1>=<value1>`.



