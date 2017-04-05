#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

echo "Update lectures"
lectures.sh

# echo
# echo "Start notebook"
# . /usr/local/bin/start.sh jupyter notebook $*
