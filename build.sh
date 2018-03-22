#!/bin/bash

cd /home/builder/webos
source oe-init-build-env
bitbake webos-image
