#!/usr/bin/env bash

echo "Validating if test discovery passes in scripts/ and serial_scripts"
echo ""
GIVEN_TEST_PATH=$OS_TEST_PATH

export PYTHON=/usr/bin/python3
export TESTR=$(which testr)
export PYTHONPATH=$PATH:$PWD/scripts:$PWD/fixtures
export OS_TEST_PATH=${GIVEN_TEST_PATH:-./scripts}; ${TESTR} list-tests || exit 1
export PYTHONPATH=$PATH:$PWD/serial_scripts:$PWD/fixtures
export OS_TEST_PATH=${GIVEN_TEST_PATH:-./serial_scripts}; ${TESTR} list-tests || exit 1
