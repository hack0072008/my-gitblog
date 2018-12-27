


### linxu增加swap
```shell
free -m
```


#### 增加swap:
```shell
    dd if=/dev/zero of=/swapfile bs=1M count=1024
    mkswap /swapfile
    swapon /swapfile
```

```shell
cat /etc/fstab
/swapfile                                 swap                    swap    defaults        0 0
```

```shell
free -m
```



~~完~~
