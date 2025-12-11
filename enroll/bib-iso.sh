#!/bin/bash

sudo podman run --rm -it --privileged --pull=newer \
    --security-opt label=type:unconfined_t \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    -v $(pwd)/config.toml:/config.toml \
    -v $(pwd)/output:/output \
    registry.redhat.io/rhel9/bootc-image-builder:9.6 \
    --type iso --config /config.toml \
    --progress=verbose \
    registry.lab.example.com:5000/rhem-enroll:v1.0

