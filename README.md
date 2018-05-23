# compute  [![Open in Cloud9](https://img.shields.io/badge/Open%20in-Cloud9-blue.svg?style=flat-square)](https://c9.io/auth/github?r=https%3A%2F%2Fc9.io%2Fopen%2F%3Fclone_url%3Dhttps%253A%252F%252Fgithub.com%252FDallas-Makerspace%252Fcompute.git) [![Analytics](https://ga-beacon.appspot.com/UA-110571074-1/Dallas-Makerspace/compute?flat)](https://github.com/Dallas-Makerspace/compute)

OpenStack + Docker Swarm on CentOS Server Playbooks, Wiki, and Issue tracker

## Requirements
  * ansible >= 2.0
  * gnu make
  * linux
  * ssh key installed on jumpbox

## Install

  - `git clone https://github.com/Dallas-Makerspace/compute compute`
  - `cd $_ && make`

## Options

| | |
|---|---|
| HOSTS | Host values for ssh config (defaults: "`192.168.*`") |
| RUSER | Remote user name to connect with |
| JUMPBOX | Remote jump box server address |
