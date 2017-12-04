HOSTS	::= 192.168.*
RUSER	::= adm_denzuko
JUMPBOX	::= physical.dallasmakerspace.org

define SSHCONFIG
Host $(HOSTS)                                                                                                                        
    ServerAliveInterval 60                                                                                                                 
    TCPKeepAlive yes                                                                                                                       
    ProxyCommand ssh -q -A $(RUSER)@$(JUMPBOX) nc %h %p                                                
    ControlMaster auto                                                                                                                     
    ControlPath ~/.ssh/ansible-%r@%h:%p                                                                                                    
    ControlPersist 8h                                                                                                                      
    User denzuko
endef
export SSHCONFIG

.PHONY: all inventory.ini site.yml requirements.yml

all: roles site.yml inventory.ini ansible.conf
	ansible-playbook site.yml -i inventory.ini

roles: requirements.yml
	ansible -m file -a 'path=roles state='absent' local
	ansible-galaxy install -r requirements.yml --roles-path roles
	ansible -m lineinfile -a 'dest=.gitignore regexp: "^\/roles$" line="/roles" state=present' local

ansible.conf: ssh-config

ssh-config:
	echo "$$(SSHCONFIG))" > ./$@

inventory.ini:
site.yml:
requirements.yml: ;