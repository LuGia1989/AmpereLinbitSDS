#!/bin/bash
# precondition NVMe drives per Samsung recommendation
set echo on
count=0
for i in "/dev/nvme0n1" "/dev/nvme1n1" "/dev/nvme3n1" "/dev/nvme4n1" "/dev/nvme5n1" "/dev/nvme6n1"; do 
    count=$((count+1))
    echo "nvme format $i before preconditioning with fio:"
    nvme format -s1 $i --force
    echo "preconditioning the following drives with fio:"
    echo "$count : $i"
    fio --filename=$i --direct=1 --size=100% --log_avg_msec=10000 --ioengine=libaio --name PreCon --numjobs=4 --rw=write --bs=128k --iodepth=64 &
done
exit 0
