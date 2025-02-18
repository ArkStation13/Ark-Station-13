#!/bin/bash
set -euo pipefail

MAP=$1

echo Testing $MAP

tools/deploy.sh ci_test
mkdir ci_test/config
mkdir ci_test/data

#test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

#set the map
cp _maps/$MAP.json ci_test/data/next_map.json

cd ci_test
DreamDaemon tgstation.dmb -close -trusted -verbose -params "log-directory=ci"

cd ..

<<<<<<< HEAD
=======
mkdir -p data/screenshots_new
cp -r ci_test/data/screenshots_new data/screenshots_new
cp ci_test/data/unit_tests.json data/unit_tests.json

>>>>>>> 3a1efdd069bfd5d39d34cbd2e08de594521efccb
cat ci_test/data/logs/ci/clean_run.lk
