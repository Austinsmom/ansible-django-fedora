---
nm: 172.29.227.100
gw: 172.29.224.1
dns: 172.29.224.11
# ks_url: http://10.5.126.23/repo/rhel/ks/kvm-rhel-6
# ks_repo: http://10.5.126.23/repo/rhel/RHEL6-x86_64/
# volgroup: /dev/vg_guests00
eth0_ip: 172.29.227.100
# vmhost: virthost14.phx2.fedoraproject.org
# datacenter: phx2

dbs_to_backup:
- djangodb

host_backup_targets: ['/backups']

# These are normally group variables, but in this case db servers are often different
#lvm_size: 300000

# virtual machine ram size and CPUs to allocate, but not used for this role anyway (need VMWare VSpheres credentials)
# fedoraproject.org postgres_server VMs use 8192 MB RAM, with 2 cores and only https,postgres ports left open
mem_size: 4096 # free says 32948620
num_cpus: 4
tcp_ports: [ {{ port_ssh }}, {{ port_http }}, {{ port_http_debug }}, {{ port_https }}, {{ port_postgres }} ] # [22, 80, 8000, 5432, 443 ]  # 22=ssh, 80=http, gunicorn, postgres, https
# fas_client_groups: sysadmin-dba,sysadmin-noc
