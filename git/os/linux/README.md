### Chinese settings(设置中文)

de-comment the following two lines in `/etc/locale.gen`
```
# en_US.UTF-8 UTF-8
# zh_CN.UTF-8 UTF-8
```

then run
```
$ locale-gen
```