# securitas

The express elevator to peace-of-mind for your Ubuntu servers.

## Huh?

`securitas` is an Ansible playbook whose goal is to lock down your servers
semi-tightly. Ideally, you'd run this playbook very shortly after a fresh
install of Ubuntu.

## What exactly does it do?

`securitas` aids you in:

- changing the `root` user's password
- setting the hostname (based on the machine's Ansible inventory hostname)
- setting the locale
- setting the time zone
- upgrading all installed packages
- adding an admin user
- locking down SSH (disallowing `root` log-ins, disallowing password-based authentication, etc.)
- configuring unattended security upgrades
- configuring logwatch to send an email once daily
- setting up and configuring ZeroTier if given a `zerotier_network_id` to join
  - if ZeroTier is used, SSH traffic will not be allowed over any public interfaces,
    but all incoming traffic will be allowed over the private ZeroTier interface
- setting up deny-by-default firewall rules, with exceptions only for SSH and loopback interface traffic
- SSH login notifications, powered by logstash

Coming soon:

- possibly more robust monitoring via nagios
