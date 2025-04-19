4. -
```shell
cat /sys/fs/cgroup/cgroup.controllers

sudo mkdir /sys/fs/cgroup/cpu_group

echo 0 | sudo tee /sys/fs/cgroup/cpu_group/cpuset.cpus

sudo cgexec -g cpuset:cpu_group top

```

проверка пункта 5
```shell
chmod +x cpu_quota_manager.sh

while true; do :; done &
TEST_PID=$!
sudo ./cpu_quota_manager.sh $TEST_PID

cat /sys/fs/cgroup/cpu_quota_*/cpu.max
```
