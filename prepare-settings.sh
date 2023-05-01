#!/bin/bash

# Variables to edit
vpn_server_name="vpnserver"
vpn_server_port="1194"
vpn_server_proto="udp"
vpn_server_dev="tun"
vpn_server_dev_peer="tun1"
vpn_server_dev_out="eth0"
vpn_server_network="10.8.0.0 255.255.255.0"
vpn_server_network_different_mask="10.8.0.0/8" # to iptables
vpn_server_network_peer="10.8.0.1 10.8.0.2"
vpn_server_dns_1="" # to set
vpn_server_dns_2="" # to set
vpn_server_keepalive="10 120"
vpn_server_cipher="AES-256-CBC"
vpn_server_user="nobody"
vpn_server_group="nogroup"
vpn_server_status_path="/var/log/openvpn/openvpn-status.log"
vpn_server_log_path="/var/log/openvpn/openvpn.log"
vpn_server_log_append_path="/var/log/openvpn/openvpn.log"
vpn_server_verb="3"
vpn_server_exp_exit_not="1"
country="" # to set
region="" # to set
city="" # to set
company="" # to set
email="" # to set
unit="" # to set

# ansible varsiables
ansible_user="" # to set
ansible_password="" # to set
ansible_port="" # to set
ansible_connection="" # to set
ansible_host="" # to set

echo ""

echo "***************************************"

echo ""

echo "Welcome in config script"

echo ""

echo "***************************************"

echo ""

echo "Create requierd folders"

if [ ! -d group_vars ];
then
	mkdir group_vars
fi

if [ ! -d host_vars ];
then
	mkdir host_vars
fi

if [ ! -d inventory ];
then
	mkdir inventory
fi

echo ""

echo "***************************************"

echo ""

echo "Create requierd files"

echo ""

if [ ! -f group_vars/debian.yml ];
then

	echo "ansible_user: "$ansible_user >> group_vars/debian.yml
	
	echo "Create ansible vault pass"
	
	echo ""
	
	ansible-vault encrypt_string $ansible_password >> group_vars/debian.yml
	
	sed -i 's/!vault /ansible_password: !vault /' group_vars/debian.yml
	
	echo "ansible_port: "$ansible_port >> group_vars/debian.yml
	
	echo "ansible_connection: "$ansible_connection >> group_vars/debian.yml
	
fi

if [ ! -f host_vars/vpn-server.yml ];
then
	echo "ansible_host: "$ansible_host >> host_vars/vpn-server.yml
fi

if [ ! -f inventory/inventory.yml ];
then
	echo "all:" >> inventory/inventory.yml
	echo "  children:" >> inventory/inventory.yml
	echo "    debian:" >> inventory/inventory.yml
	echo "      hosts:" >> inventory/inventory.yml
	echo "        vpn-server:" >> inventory/inventory.yml
fi

echo ""

echo "***************************************"

echo ""

echo "Config vars_files/var_file_strings.yml"

echo ""

if [ $(grep -c ansible_user: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ansible_user: "'"'$ansible_user'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_name: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_name: "'"'$vpn_server_name'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ansible_host: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ansible_host: "'"'$ansible_host'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_port: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_port: "'"'$vpn_server_port'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_proto: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_proto: "'"'$vpn_server_proto'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dev: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dev: "'"'$vpn_server_dev'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dev_peer: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dev_peer: "'"'$vpn_server_dev_peer'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dev_out: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dev_out: "'"'$vpn_server_dev_out'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_network: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_network: "'"'$vpn_server_network'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_network_different_mask: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_network_different_mask: "'"'$vpn_server_network_different_mask'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_network_peer: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_network_peer: "'"'$vpn_server_network_peer'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dns_1: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dns_1: "'"'$vpn_server_dns_1'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_dns_2: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_dns_2: "'"'$vpn_server_dns_2'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_keepalive: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_keepalive: "'"'$vpn_server_keepalive'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_cipher: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_cipher: "'"'$vpn_server_cipher'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_user: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_user: "'"'$vpn_server_user'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_group: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_group: "'"'$vpn_server_group'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_status_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_status_path: "'"'$vpn_server_status_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_log_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_log_path: "'"'$vpn_server_log_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_log_append_path: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_log_append_path: "'"'$vpn_server_log_append_path'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_verb: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_verb: "'"'$vpn_server_verb'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c vpn_server_exp_exit_not: vars_files/var_file_strings.yml) == 0 ];
then
	echo "vpn_server_exp_exit_not: "'"'$vpn_server_exp_exit_not'"' >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ovpn_vars: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ovpn_vars:" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c US vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"US"'", replace: "'"'$country'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c California vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"California"'", replace: "'"'$region'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c Francisco vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"San Francisco"'", replace: "'"'$city'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c Copyleft vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"Copyleft Certificate Co"'", replace: "'"'$company'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c me@example.net vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"me@example.net"'", replace: "'"'$email'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c Unit vars_files/var_file_strings.yml) == 0 ];
then
	echo "  - { regexp: "'"My Organizational Unit"'", replace: "'"'$unit'"'" }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ovpn_client_vars: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ovpn_client_vars:" >> vars_files/var_file_strings.yml
	echo "  # VPN clients to create, example:" >> vars_files/var_file_strings.yml
	echo "  #- { ovpn_client_name: test, ovpn_client_pass: testapass }" >> vars_files/var_file_strings.yml
fi

if [ $(grep -c ovpn_clients_to_remove: vars_files/var_file_strings.yml) == 0 ];
then
	echo "ovpn_clients_to_remove:" >> vars_files/var_file_strings.yml
	echo "  # VPN clients to reomve, example:" >> vars_files/var_file_strings.yml
	echo "  #- test" >> vars_files/var_file_strings.yml
fi

echo "***************************************"

echo ""

echo "Configuration is ready"

echo ""

echo "To create vpn server run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml install-ovpn-server.yml --ask-vault-pass"

echo ""

echo "To create vpn client(s) run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml create-ovpn-clients.yml --ask-vault-pass"

echo ""

echo "To delete vpn client(s) run:"

echo ""

echo "ansible-playbook -i inventory/inventory.yml delete-ovpn-clients.yml --ask-vault-pass"

echo ""

echo "To delete server and config run:"

echo ""

echo "./delete-server-and-config.sh"

echo ""

echo "***************************************"

echo ""





