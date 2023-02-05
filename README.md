# Hestia-Vesta-Diff-Backup

##Alpha 0000.1v

Differential bakcup integration for Hestiacp and Vestacp

I try to do someting for my needs, but may be works for some body else.

I will base this script in https://github.com/hestiacp/hestiacp/blob/main/bin/v-backup-user

¿ Why ?

I dont want programing from 0 a backup system, Hestia / Vesta backup working fine but when you have a big site you dont want make a heavy archive backup

So, I leve a hestia / vesta make working backup for all ( user config, databases, templates and the rest ) but exclude files and mails, then I change that part for duplicity backup ( you may use borg, rdiff or any orther system, this will work in same way.

For now , this just make a backup, when you need restore a user you need use v-restore-user script from panel, but duplicity tool for restore file domains and mails.

I will modify this to make compatible with panel exclutions and maybe modify v-restore-user to work together.

How this looks when you do a backup
```

# v-backup-diff-user maks

-- SYSTEM --
2023-02-05 14:40:24 maks.conf
2023-02-05 14:40:24 stats.log
2023-02-05 14:40:24 history.log
2023-02-05 14:40:24 pam


-- WEB --
2023-02-05 14:40:24 testmaks.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: Sun Feb  5 14:38:49 2023
--------------[ Backup Statistics ]--------------
StartTime 1675604424.62 (Sun Feb  5 14:40:24 2023)
EndTime 1675604430.20 (Sun Feb  5 14:40:30 2023)
ElapsedTime 5.58 (5.58 seconds)
SourceFiles 13061
SourceFileSize 290275014 (277 MB)
NewFiles 6524
NewFileSize 132936502 (127 MB)
DeletedFiles 3261
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 9785
RawDeltaSize 130167606 (124 MB)
TotalDestinationSizeChange 45389188 (43.3 MB)
Errors 0
-------------------------------------------------

2023-02-05 14:40:30 maks2.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: Sun Feb  5 14:38:57 2023
--------------[ Backup Statistics ]--------------
StartTime 1675604430.79 (Sun Feb  5 14:40:30 2023)
EndTime 1675604430.79 (Sun Feb  5 14:40:30 2023)
ElapsedTime 0.00 (0.00 seconds)
SourceFiles 15
SourceFileSize 44330 (43.3 KB)
NewFiles 0
NewFileSize 0 (0 bytes)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 0
RawDeltaSize 0 (0 bytes)
TotalDestinationSizeChange 500 (500 bytes)
Errors 0
-------------------------------------------------

2023-02-05 14:40:30 *** 2 domains ***

-- DNS --
2023-02-05 14:40:30 testmaks.com
2023-02-05 14:40:30 maks2.com
2023-02-05 14:40:30 *** 2 domains ***

-- MAIL --
2023-02-05 14:40:30 maks2.com
Local and Remote metadata are synchronized, no sync needed.
Last full backup date: Sun Feb  5 14:38:58 2023
--------------[ Backup Statistics ]--------------
StartTime 1675604431.00 (Sun Feb  5 14:40:30 2023)
EndTime 1675604431.00 (Sun Feb  5 14:40:30 2023)
ElapsedTime 0.00 (0.00 seconds)
SourceFiles 2
SourceFileSize 8192 (8.00 KB)
NewFiles 0
NewFileSize 0 (0 bytes)
DeletedFiles 0
ChangedFiles 0
ChangedFileSize 0 (0 bytes)
ChangedDeltaSize 0 (0 bytes)
DeltaEntries 0
RawDeltaSize 0 (0 bytes)
TotalDestinationSizeChange 500 (500 bytes)
Errors 0
-------------------------------------------------

2023-02-05 14:40:31 *** 1 domain ***

-- DB --
2023-02-05 14:40:31 *** 0 databases ***

-- CRON --
2023-02-05 14:40:31 *** 0 jobs ***

-- User Dir --
2023-02-05 14:40:31 adding .bash_logout
2023-02-05 14:40:31 adding .bashrc
2023-02-05 14:40:31 adding .cache
2023-02-05 14:40:31 adding .composer
2023-02-05 14:40:31 adding .config
2023-02-05 14:40:31 adding .local
2023-02-05 14:40:31 adding .npm
2023-02-05 14:40:31 adding .profile
2023-02-05 14:40:31 adding .ssh
2023-02-05 14:40:31 adding .vscode-server
2023-02-05 14:40:31 *** 10 directories ***

-- SUMMARY --
2023-02-05 14:40:31 Rotated: 2023-02-05_14-38-58
2023-02-05 14:40:31 Local: /backup/maks.2023-02-05_14-40-31.tar
2023-02-05 14:40:31 Size: 1 MB
2023-02-05 14:40:31 Runtime: 1 minute


```

# How restore ?

If you lost entery user account you just need restore hestia / vesta backup as always, this will restore all data for you but you will need manually restore data from duplicity storage ( remote or local )

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

And store incremental backup for files files and emails in remote or local directory.

So if you delete entery account you will need first restore a regular backup and before that restore diferencial backup ( this will be work by default some day )

Both backups, hestia / vesta and duplicity can be stored in remote server, event you can send panel backup to one server and diferrencial backup to other server, for my needs this works perfect.


# Why duplicity

Change just a line you can send backups to diferente location
```

Backends and their URL formats:
  azure://container_name
  b2://account_id[:application_key]@bucket_name/[some_dir/]
  boto3+s3://bucket_name[/prefix]
  cf+http://container_name
  dpbx:///some_dir
  file:///some_dir
  ftp://user[:password]@other.host[:port]/some_dir
  ftps://user[:password]@other.host[:port]/some_dir
  gdocs://user[:password]@other.host/some_dir
  hsi://user[:password]@other.host[:port]/some_dir
  imap://user[:password]@other.host[:port]/some_dir
  mega://user[:password]@other.host/some_dir
  megav2://user[:password]@other.host/some_dir
  mf://user[:password]@other.host/some_dir
  onedrive://some_dir
  pca://container_name
  pydrive://user@other.host/some_dir
  rclone://remote:/some_dir
  rsync://user[:password]@other.host[:port]/relative_path
  rsync://user[:password]@other.host[:port]//absolute_path
  rsync://user[:password]@other.host[:port]::/module/some_dir
  s3+http://bucket_name[/prefix]
  s3://other.host[:port]/bucket_name[/prefix]
  scp://user[:password]@other.host[:port]/some_dir
  ssh://user[:password]@other.host[:port]/some_dir
  swift://container_name
  tahoe://alias/directory
  webdav://user[:password]@other.host/some_dir
  webdavs://user[:password]@other.host/some_dir
```

Same configuration is used to send backups to amazon, one drive, ftp, dropbox no extra configuration needed, just change conection data and destination.

