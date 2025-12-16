#!/bin/bash

if [[ ! "${1}" =~ ^[1-9]$ ]]; then
    echo 'Please provide a single-digit number [1-9] to identify your test VM' 1>&2
    exit 1
fi

echo "Creating VM edge-${1}, use port 8${1}22 for SSH."

LABEL=RHEL-9-6-BaseOS-x86_64

virt-install --name edge-{$1} \
--vcpus 2 --memory 4096 \
--disk size=20 \
--network passt,portForward0=8${1}22:22,portForward1=8${1}08:80 \
--location httpd-enroll.iso,kernel=/images/pxeboot/vmlinuz,initrd=/images/pxeboot/initrd.img \
--os-variant rhel9.0 \
--graphics=none \
--extra-arg inst.ks=hd:LABEL=$LABEL:/osbuild.ks \
--extra-arg console=ttyS0 -v
