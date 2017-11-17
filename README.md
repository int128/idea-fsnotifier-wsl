# IntelliJ IDEA fsnotifier for WSL

`fsnotifier` module of IntelliJ IDEA for WSL (Windows Subsystem for Linux; Bash for Windows),
based on [intellij-community/native/fsNotifier/linux](https://github.com/JetBrains/intellij-community/tree/master/native/fsNotifier/linux).


## How to use

Make sure you have a C compiler.

```sh
sudo apt install build-essential
```

Compile source and install `fsnotifier64` to `bin` of IDEA.

```sh
./make.sh
ls -la fsnotifier64
cp -av fsnotifier64 ~/bin/idea-IC-*/bin/
```

Run IDEA and `External file changes sync may be slow: File watcher gave up to operate` will not be shown.


## How it works

Currently `fsnotifier64` fails on WSL, because WSL does not provide `/proc/sys/fs/inotify/max_user_watches` and `/etc/mtab`.

This skips checking `/proc/sys/fs/inotify/max_user_watches`.
Also it reads from `/proc/mounts` instead of `/etc/mtab`.
See commits for more.


## Contribution

Feel free to open an issue or pull request.
Original and this are public under Apache License 2.0.
