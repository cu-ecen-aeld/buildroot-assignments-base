#!/bin/bash

set -e 

echo "Cleaning"

make -c buildroot distclean

echo "Clean completed."
