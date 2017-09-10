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
| [logs.sh](https://github.com/OctaveLauby/BashScripts/blob/master/logs.sh)| colored logs |


# Use case

## Countlines

**Examples**:

```
$ sh countlines.sh txt
$ sh countlines.sh sh
```

## Logs

There is 5 levels of log (`<lvl>`):
- debug
- info
- warning
- error
- fatal

**Set log level**:  `$ set_<lvl>`

**Log message**: `$ <lvl> msg`

**Example**:

```
$ source ./logs.sh
$ set_debug
$ debug "debug msg"
$ info "info msg "
$ warning "warning msg "
$ error "error msg "
$ fatal "fatal msg "
```


# Findings

## Sed Regex

When replacing regex, `sed -e` is broken for:
- non greedy match
- some regex syntaxes (e.g. \d)

So one should use `perl -pe`.


## getopt

Well, looks like one should [not use it](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash).

## Script vs Shell

Some cmds might work in shell but not in script.


## " vs '

```
MSG=hello
echo '$MSG'
echo "$MSG"
```
