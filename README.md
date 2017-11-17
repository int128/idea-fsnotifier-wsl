# IntelliJ IDEA fsnotifier for WSL

[IntelliJ IDEA for Linux](https://www.jetbrains.com/idea/download/#section=linux) works on WSL (Windows Subsystem for Linux; Bash for Windows) as well but the file watching feature does not work for now.
This `fsnotifier` module allows the file watching feature works on WSL as well.


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

Run IDEA. Check if the following warning is not shown.

> External file changes sync may be slow: File watcher gave up to operate


## How it works

Currently `fsnotifier64` fails on WSL, because WSL does not provide `/proc/sys/fs/inotify/max_user_watches` and `/etc/mtab`.

This skips checking `/proc/sys/fs/inotify/max_user_watches`.
Also it reads from `/proc/mounts` instead of `/etc/mtab`.
See commits for more.


## Contribution

This is based on [JetBrains/intellij-community/native/fsNotifier/linux](https://github.com/JetBrains/intellij-community/tree/master/native/fsNotifier/linux).

Feel free to open an issue or pull request.
Original and this are public under Apache License 2.0.
