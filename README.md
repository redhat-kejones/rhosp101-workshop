# rhosp101-workshop
RHOSP 101 Workshop http://redhatgov.io/workshops/rhosp_101/

# Instructions

```
$ sudo yum install -y ansible git
$ git clone https://github.com/redhat-kejones/rhosp101-workshop.git
```

```
$ ansible-playbook create-virtualenv.yml
```

```
$ ansible-playbook -i inventory-local --ask-vault-pass initialize-workshop.yml
```
