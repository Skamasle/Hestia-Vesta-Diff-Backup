# Hestia-Vesta-Diff-Backup

##Alpha 0000.1v

Differential bakcup integration for Hestiacp and Vestacp

I try to do someting for my needs, but may be works for some body else.

I will base this script in https://github.com/hestiacp/hestiacp/blob/main/bin/v-backup-user

¿ Why ?

I dont want programing from 0 a backup system, Hestia / Vesta backup working fine but when you have a big site you dont want make a bit archive backup

So, I leve a hestia / vesta make working backup for all ( user config, databases, templates and the rest ) but exclude files and mails, then I change that part for duplicity backup ( you may use borg, rdiff or any orther system, this will work in same way.

For now , this just make a backup, when you need restore a user you need use v-restore-user script from panel, but duplicity tool for restore file domains and mails.

I will modify this to make compatible with panel exclutions and maybe modify v-restore-user to work together.

How this looks when you do a backup
```

# v-backup-diff-user maks

-- SYSTEM --
2023-02-05 14:10:17 maks.conf
2023-02-05 14:10:17 stats.log
2023-02-05 14:10:17 history.log
2023-02-05 14:10:17 pam


-- WEB --
2023-02-05 14:10:17 testmaks.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: Sun Feb  5 14:06:33 2023
--------------[ Backup Statistics ]--------------
StartTime 1675602617.25 (Sun Feb  5 14:10:17 2023)
EndTime 1675602618.29 (Sun Feb  5 14:10:18 2023)
ElapsedTime 1.04 (1.04 seconds)
SourceFiles 9815
SourceFileSize 223855189 (213 MB)
NewFiles 0
NewFileSize 0 (0 bytes)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 0
RawDeltaSize 0 (0 bytes)
TotalDestinationSizeChange 501 (501 bytes)
Errors 0
-------------------------------------------------

2023-02-05 14:10:18 maks2.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: Sun Feb  5 14:06:42 2023
--------------[ Backup Statistics ]--------------
StartTime 1675602618.47 (Sun Feb  5 14:10:18 2023)
EndTime 1675602619.53 (Sun Feb  5 14:10:19 2023)
ElapsedTime 1.06 (1.06 seconds)
SourceFiles 9815
SourceFileSize 223855189 (213 MB)
NewFiles 0
NewFileSize 0 (0 bytes)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 0
RawDeltaSize 0 (0 bytes)
TotalDestinationSizeChange 501 (501 bytes)
Errors 0
-------------------------------------------------

2023-02-05 14:10:19 *** 2 domains ***

-- DNS --
2023-02-05 14:10:19 testmaks.com
2023-02-05 14:10:19 maks2.com
2023-02-05 14:10:19 *** 2 domains ***

-- MAIL --
2023-02-05 14:10:19 maks2.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: none
Last full backup is too old, forcing full backup
--------------[ Backup Statistics ]--------------
StartTime 1675602619.73 (Sun Feb  5 14:10:19 2023)
EndTime 1675602619.73 (Sun Feb  5 14:10:19 2023)
ElapsedTime 0.00 (0.00 seconds)
SourceFiles 2
SourceFileSize 8192 (8.00 KB)
NewFiles 2
NewFileSize 8192 (8.00 KB)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 2
RawDeltaSize 0 (0 bytes)
TotalDestinationSizeChange 602 (602 bytes)
Errors 0
-------------------------------------------------

2023-02-05 14:10:19 *** 1 domain ***

-- DB --
2023-02-05 14:10:19 *** 0 databases ***

-- CRON --
2023-02-05 14:10:19 *** 0 jobs ***

-- User Dir --
2023-02-05 14:10:19 adding .bash_logout
2023-02-05 14:10:19 adding .bashrc
2023-02-05 14:10:19 adding .cache
2023-02-05 14:10:19 adding .composer
2023-02-05 14:10:19 adding .config
2023-02-05 14:10:19 adding .local
2023-02-05 14:10:19 adding .npm
2023-02-05 14:10:19 adding .profile
2023-02-05 14:10:19 adding .ssh
2023-02-05 14:10:19 adding .vscode-server
2023-02-05 14:10:19 *** 10 directories ***

-- SUMMARY --
2023-02-05 14:10:19 Rotated: 2023-02-05_14-06-50
2023-02-05 14:10:19 Local: /backup/maks.2023-02-05_14-10-19.tar
2023-02-05 14:10:19 Size: 1 MB
2023-02-05 14:10:19 Runtime: 1 minute

```

# How restore ?

If you lost entery user account you just need restore hestia / vesta backup as always, this will restore all data for you but you will need manually restore data from duplicity storage ( sftp or local )

Then if you lost a file, just restore it from duplicity backup
```
duplicity list-current-files file:///home/backup/diff/maks/web/maks2.com/
Synchronizing remote metadata to local cache...
GnuPG passphrase for decryption: 
Copying duplicity-full-signatures.20230205T130642Z.sigtar.gpg to local cache.
Copying duplicity-full.20230205T130642Z.manifest.gpg to local cache.
Copying duplicity-inc.20230205T130642Z.to.20230205T131018Z.manifest.gpg to local cache.
Copying duplicity-new-signatures.20230205T130642Z.to.20230205T131018Z.sigtar.gpg to local cache.
Last full backup date: Sun Feb  5 14:06:42 2023
Sat Feb  4 22:29:45 2023 .
Sat Feb  4 22:29:45 2023 maks2.com
Sat Feb  4 22:29:45 2023 maks2.com/cgi-bin
Sat Feb  4 22:29:45 2023 maks2.com/document_errors
Sat Feb  4 22:29:45 2023 maks2.com/document_errors/403.html
Sat Feb  4 22:29:45 2023 maks2.com/document_errors/404.html
Sat Feb  4 22:29:45 2023 maks2.com/document_errors/410.html
Sat Feb  4 22:29:45 2023 maks2.com/document_errors/50x.html
Sat Feb  4 22:29:45 2023 maks2.com/logs
Sat Feb  4 22:20:43 2023 testmaks.com/public_html/robots.txt
Tue Nov 15 20:03:30 2022 testmaks.com/public_html/wordpress
Thu Feb  6 07:33:11 2020 testmaks.com/public_html/wordpress/index.php
Sat Jan  1 01:15:02 2022 testmaks.com/public_html/wordpress/license.txt
Sat Sep 17 00:27:10 2022 testmaks.com/public_html/wordpress/readme.html
Sat Sep 17 01:13:10 2022 testmaks.com/public_html/wordpress/wp-activate.php
Tue Nov 15 20:03:29 2022 testmaks.com/public_html/wordpress/wp-admin
Tue Nov 15 19:50:12 2022 testmaks.com/public_html/wordpress/wp-admin/about.php
Sat May  7 18:21:18 2022 testmaks.com/public_html/wordpress/wp-admin/admin-ajax.php
Tue Jun  1 13:30:57 2021 testmaks.com/public_html/wordpress/wp-admin/admin-footer.php
Thu Feb  6 07:33:11 2020 testmaks.com/public_html/wordpress/wp-admin/admin-functions.php
Mon Apr  4 20:39:01 2022 testmaks.com/public_html/wordpress/wp-admin/admin-header.php
Wed Mar  2 16:00:11 2022 testmaks.com/public_html/wordpress/wp-admin/admin-post.php
Mon Apr  4 20:43:02 2022 testmaks.com/public_html/wordpress/wp-admin/admin.php
Thu Jan 27 23:17:00 2022 testmaks.com/public_html/wordpress/wp-admin/async-upload.php
Thu Aug  4 16:52:11 2022 testmaks.com/public_html/wordpress/wp-admin/authorize-application.php
Tue Mar 22 17:25:03 2022 testmaks.com/public_html/wordpress/wp-admin/comment.php
Tue Oct 18 17:10:12 2022 testmaks.com/public_html/wordpress/wp-admin/credits.php
Tue Nov 15 20:03:29 2022 testmaks.com/public_html/wordpress/wp-admin/css


```

# Becareful

This system make two backups

The regular backup as always with database, configurations, email passwords, users and any orther data stored in remote or local dir /backup/USER.2023-02-05_12-49-37.tar

And store files and emails in remote or local directory

So if you delete entery account you will need first restore a regular backup and before that restore diferencial backup ( this will be work by default some day )

Both backups, hestia / vesta and duplicity can be stored in remote server, event you can send panel backup to one server and diferrencial backup to other server, for my needs this works perfect.



