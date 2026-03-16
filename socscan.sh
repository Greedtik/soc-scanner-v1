#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
MODULE_DIR="$BASE_DIR/modules"

source "$MODULE_DIR/runtime.sh"
source "$MODULE_DIR/network.sh"
source "$MODULE_DIR/ports.sh"
source "$MODULE_DIR/process_tree.sh"
source "$MODULE_DIR/reverse_shell.sh"
source "$MODULE_DIR/docker.sh"
source "$MODULE_DIR/users.sh"
source "$MODULE_DIR/persistence.sh"
source "$MODULE_DIR/rootkit.sh"
source "$MODULE_DIR/entropy.sh"

echo "SOC Scanner v17"
echo "Host: $(hostname)"
echo "========================"

case "$1" in

--runtime)
runtime_scan
;;

--network)
network_scan
;;

--ports)
port_scan
;;

--process)
process_tree
;;

--reverse-shell)
reverse_shell_scan
;;

--docker)
docker_scan
;;

--users)
user_scan
;;

--persistence)
persistence_scan
;;

--rootkit)
rootkit_scan
;;

--entropy)
entropy_scan
;;

--all)
runtime_scan
network_scan
port_scan
process_tree
reverse_shell_scan
docker_scan
user_scan
persistence_scan
rootkit_scan
entropy_scan
;;

*)
echo "Usage:"
echo "--all --runtime --network --ports --process --reverse-shell --docker --users --persistence --rootkit --entropy"
;;

esac
