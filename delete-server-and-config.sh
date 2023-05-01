#!/bin/bash

echo ""

echo "******************************************"

echo ""

echo "Script deleting configurations and server"

echo ""

echo "******************************************"

echo ""

ansible-playbook -i inventory/inventory.yml delete-all.yml --ask-vault-pass

if [ -d group_vars ];
then
	rm -r group_vars
fi

if [ -d host_vars ];
then
	rm -r host_vars
fi

if [ -d inventory ];
then
	rm -r inventory
fi

sed -i '/ansible_user:/,$d' vars_files/var_file_strings.yml

echo ""

echo "******************************************"

echo ""

echo "All configigurations and server were deleted"

echo ""

echo "******************************************"

echo ""
