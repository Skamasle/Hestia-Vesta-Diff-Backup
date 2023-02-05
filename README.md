# Hestia-Vesta-Diff-Backup
Differential bakcup integration for Hestiacp and Vestacp

I try to do someting for my needs, but may be works for some body else.

I will base this script in https://github.com/hestiacp/hestiacp/blob/main/bin/v-backup-user

¿ Why ?

I dont want programing from 0 a backup system, Hestia / Vesta backup working fine but when you have a big site you dont want make a bit archive backup

So, I leve a hestia / vesta make working backup for all ( user config, databases, templates and the rest ) but exclude files and mails, then I change that part for duplicity backup ( you may use borg, rdiff or any orther system, this will work in same way.

For now , this just make a backup, when you need restore a user you need use v-restore-user script from panel, but duplicity tool for restore file domains and mails.

I will modify this to make compatible with panel exclutions and maybe modify v-restore-user to work together.

