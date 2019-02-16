# home-salt-configuration

https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html

Boostrap

```
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh
```

In `/etc/salt/minon` set:

```
file_client: local
```