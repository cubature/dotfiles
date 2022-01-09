### Chinese settings(设置中文)
de-comment the following two lines in `/etc/locale.gen`
```
# en_US.UTF-8 UTF-8
# zh_CN.UTF-8 UTF-8
```

then run
```
$ sudo locale-gen
```

### virtualbox guest additions
mount the CD `VBoxGuestAdditions.iso`:
```
$ sudo mount /dev/sr0 /mnt
```

run the installing script for linux:
```
$ sudo /mnt/VBoxLinuxAdditions.run
```