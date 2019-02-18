mongodb-org:
  pkgrepo.managed:
    - humanname: MongoDB
    - name: deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse 
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 9DA31620334BD75D9DCB49F368818C72E52529D4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-org 

  pkg.latest:
    - name: mongodb-org
    - refresh: True
