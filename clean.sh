#!/bin/bash
#Script clean buildroot
#Author: Chutao Wei

set -e 
cd `dirname $0`
cd buildroot
make distclean
