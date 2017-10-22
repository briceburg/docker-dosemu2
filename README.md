# dosemu2

docker container with [dosemu2](https://github.com/stsp/dosemu2).

Used by [dex](https://github.com/dockerland/dex) for those _fun_ images that
need dos such as [deltree](https://github.com/dockerland/dex-dockerfiles-extra/tree/master/dex-images/deltree and [edit](https://github.com/dockerland/dex-dockerfiles-extra/tree/master/dex-images/edit)

## usage

* to support console auto-detection of keyboard layout, pass tty0

```sh
docker run briceburg/dosemu2
^^^ opens c:\ -- use `exitemu` to exit

docker run --device=/dev/tty0 -e LANG=$LANG briceburg/dosemu2
^^^ autodetects keyboard layout and passthru LANG

docker run briceburg/dosemu2 -dumb dir
^^^ outputs directory listing of c:\
```

`exitemu` to exit from dosemu

## todo

* compile on musl for alpine
* allow non-root user to read tty0, the SUID bit on dosemu did not fix.
