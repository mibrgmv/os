## Как запустить `.ova` файл на Mac через UTM
```shell
arch -arm64 brew install qemu

tar -xvf /path/to/file.ova

# сгенерируются файлы .mf, .ovf и .vmdk в /Users/<username>

qemu-img convert -f vmdk -O qcow2 /path/to/file-disk001.vmdk file.qcow2
```
Сгенерированный `.cqow2` файл можно запустить в UTM
