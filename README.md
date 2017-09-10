Bash scripts
---


# Scripts breakdown

| script | description | has options |
| --- | --- | --- |
| [clean.sh](https://github.com/OctaveLauby/BashScripts/blob/master/clean.sh) | clean repository | true |
| [countlines.sh](https://github.com/OctaveLauby/BashScripts/blob/master/countlines.sh) | countlines in repository | false |
| [logs.sh](https://github.com/OctaveLauby/BashScripts/blob/master/logs.sh)| colored logs functions | false |


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