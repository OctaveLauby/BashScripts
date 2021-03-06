Bash scripts
---

# Introduction

A collection of bash scripts. The idea is to keep track of the kind of commands one can use. Those scripts are not to use as given.

# Scripts breakdown

| script | description |
| --- | --- |
| [clean.sh](https://github.com/OctaveLauby/BashScripts/blob/master/clean.sh) | clean repository from the category you want |
| [copy_rename.sh](https://github.com/OctaveLauby/BashScripts/blob/master/copy_rename.sh) | copy and rename files from directory |
| [concat.sh](https://github.com/OctaveLauby/BashScripts/blob/master/concat.sh) | concat files from directory |
| [countlines.sh](https://github.com/OctaveLauby/BashScripts/blob/master/countlines.sh) | countlines in repository |
| [logs.sh](https://github.com/OctaveLauby/BashScripts/blob/master/logs.sh)| colored logs |


# Use case

## Concat

**Examples**:

```
$ sh concat.sh -d data/ -o tmp/test.csv
$ sh concat.sh -d data/ -o tmp/test.csv -r 0[34]
```

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

Well, looks like one [should not use getopt](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash).


## " vs '

```
$ MSG=hello
$ echo '$MSG'
$ echo "$MSG"
```
