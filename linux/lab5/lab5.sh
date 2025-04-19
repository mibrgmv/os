проверка пункта 5
```shell
chmod +x cpu_quota_manager.sh

while true; do :; done &
TEST_PID=$!
sudo ./cpu_quota_manager.sh $TEST_PID

cat /sys/fs/cgroup/cpu_quota_*/cpu.max
```
