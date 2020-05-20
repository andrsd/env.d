env.d
=====

Install
-------

Get the environment
```
$ cd ~
$ git clone git@github.com:andrsd/env.d .env.d
```

Update `.bash_profile`:
```
for f in `ls ~/.env.d/*.bashrc | sort` ; do source $f ; done
```
