Bash scripts
---

# Introduction

A collection of bash scripts. The idea is to keep track of the kind of commands one can use. Those scripts are not to use as given.

# Scripts breakdown

| script | description |
| --- | --- |
| [clean.sh](https://github.com/OctaveLauby/BashScripts/blob/master/clean.sh) | clean repository from the category you want |
| [copy_rename.sh](https://github.com/OctaveLauby/BashScripts/blob/master/copy_rename.sh) | copy and rename files from directory |
| [countlines.sh](https://github.com/OctaveLauby/BashScripts/blob/master/countlines.sh) | countlines in repository |
| [logs.sh](https://github.com/OctaveLauby/BashScripts/blob/master/logs.sh)| colored logs functions |


# Use case

## Logs

```
$ source ./logs.sh

$ debug "debug msg"
$ info "info msg "
$ warning "warning msg "
$ error "error msg "
$ fatal "fatal msg "
```