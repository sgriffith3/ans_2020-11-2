---
- name: Testing my new module
  hosts: localhost
  gather_facts: no

  tasks:
  - name: Testing my custom module to interact with NASA imagery and Google Earth
    nasaimagery:
      lon: 77.593675
      lat: 12.972172
      apikey: DEMO_KEY # replace with your key
      dest: /home/student/static/example.png   # location to download image

