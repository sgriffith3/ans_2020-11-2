# Friday Challenge

Create a collection that has the following roles:

## Role 1

The planetexpress hosts need to have the unwanted programs **figlet** and **bastet** removed from them.

You also need to veify that their home directories look as expected. Use the `ls` command to do this, 
then save the **stdout_lines** of this output to a local file, named `/home/student/<date>/<hostname>.home`

You need to change `<date>` to the current date, and `<hostname>` to the machine's name as ansible knows it.

## Role 2
The eosswitches need to have the login banner changed to say: **"I rock at Ansible!"**

## Requirements:

> Note: You need to configure both the planetexpress hosts, and the eosswitches to accomplisth this task:

- Use a loop
- Create a variable in the vars section
- use local_action:
- build the collection after it is all finished.

