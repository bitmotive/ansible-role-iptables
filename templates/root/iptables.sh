#!/bin/bash

### Configure host-specific paths
### to necessary IPTables rules.
IPTABLES={{ role_iptables_iptables4_path }} #/sbin/iptables
IP6TABLES={{ role_iptables_iptables6_path }} #/sbin/ip6tables
MODPROBE={{ role_iptables_modprobe_path }} #/sbin/modprobe

### Determine facts for
### internal/external interfaces.
INT_INTF={{ role_iptables_internal_interface }} # eth0
EXT_INTF={{ role_iptables_external_interface }} #eth1
INT_NET={{ int_network }}

echo "[+] Flushing existing iptables rules..."
$IPTABLES -F # Flush all rules
$IPTABLES -F -t nat # Remove NAT table
$IPTABLES -X # Remove user defined chain

echo "[+] Configure default chain policies..."

$IPTABLES -P INPUT {{ role_iptables_policy_ip4_input_default }}
$IPTABLES -P OUTPUT {{ role_iptables_policy_ip4_output_default }}
$IPTABLES -P FORWARD {{ role_iptables_policy_ip4_forward_default }}

$IP6TABLES -P INPUT {{ role_iptables_policy_ip6_input_default }}
$IP6TABLES -P OUTPUT {{ role_iptables_policy_ip6_output_default }}
$IP6TABLES -P FORWARD {{ role_iptables_policy_ip6_forward_default }}

### Optionally include iptables modules
{% for module in role_iptables_modprobe_modules %}
$MODPROBE {{ module }}
{% endfor %}

echo "[+] Applying header rules..."
{% for rule in role_iptables_header_rules %}
{{ rule }}
{% endfor %}

echo "[+] Setting up INPUT chain..."
{% for rule in role_iptables_input_chain %}
{{ rule }}
{% endfor %}

echo "[+] Setting up OUTPUT chain..."
{% for rule in role_iptables_output_chain %}
{{ rule }}
{% endfor %}

echo "[+] Setting up FORWARD chain..."
{% for rule in role_iptables_forward_chain %}
{{ rule }}
{% endfor %}

echo "[+] Applying footer rules..."
{% for rule in role_iptables_footer_rules %}
{{ rule }}
{% endfor %}

exit
### EOF ###
