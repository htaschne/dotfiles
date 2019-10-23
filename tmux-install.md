# tmux 2.8 installation guide:

1. Create a directory to build tmux (optional)

```
$ mkdir ~/tmux-install && cd ~/tmux-install
```

2. Download both tmux and libevent from the links:

* [tmux](https://github.com/tmux/tmux/releases/tag/2.8)

* [libevent](https://github.com/libevent/libevent/releases)

3. Unzip both into ~/tmux-install folder

4. Compile libevent:
```
$ cd libevent-2.1.11-stable
$ ./configure --prefix=/opt
$ make
$ sudo make install
```
5. Compile tmux:
```
$ cd ../tmux-2.8
$ LDFLAGS="-L/opt/lib" CPPFLAGS="-I/opt/include" LIBS="-lresolv" ./configure --prefix=/opt
$ make
$ sudo make install
```

6. Link it
```
$ sudo ln -s /opt/bin/tmux /usr/local/bin/tmux
```

* Inspired by:
https://gist.github.com/shrayasr/8714601
