ansible-role-hostnames
=========

IPTables configuration

Requirements
------------

This role has only been tested on EL 6 systems using Ansible 1.9.

Role Variables
--------------

###Basic IPTables Configs

__role_iptables_policy_ip4_input_default__: IPv4 default input policy (DROP/ACCEPT)

__role_iptables_policy_ip4_output_default__: IPv4 default output policy (DROP/ACCEPT) 

__role_iptables_policy_ip4_forward_default__: IPv4 default forward policy (DROP/ACCEPT)

__role_iptables_policy_ip6_input_default__: IPv6 default input policy (DROP/ACCEPT)

__role_iptables_policy_ip6_output_default__: IPv6 default output policy (DROP/ACCEPT) 

__role_iptables_policy_ip6_forward_default__: IPv6 default forward policy (DROP/ACCEPT)

__role_iptables_modprobe_modules__: Array of modprobe modules to include

###Variables available to custom rules

__role_iptables_iptables4_path__: Filepath to iptables v4 binary (e.g. "/sbin/iptables")

__role_iptables_iptables6_path__: Filepath to iptables v6 binary (e.g. "/sbin/ip6tables")

__role_iptables_modprobe_path__: Filepath to modprobe binary (e.g. "/sbin/modprobe")

__role_iptables_int_intf__: Name of internal network interface (e.g. "eth0")
__role_iptables_ext_intf__: Name of external network interface (e.g. "eth1")

###Dynamic rules

__role_iptables_header_rules__: Rules that must be included before any others

__role_iptables_input_chain__: Array of input chain rules

__role_iptables_output_chain__: Array of output chain rules

__role_iptables_forward_chain__: Array of forward chain rules

__role_iptables_footer_rules__: Rules that must be included after all others

Override the above variables by modifying your project's group_vars or host_vars in order to customize them on a per-host/group basis.

Example Playbook
----------------

```
- hosts: servers
  roles:
    - { role: bitmotive.ansible-role-iptables, tags: "iptables,common" }
```

License
-------

MIT
