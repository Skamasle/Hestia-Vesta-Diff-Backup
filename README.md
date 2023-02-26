# Hestia-Vesta-Diff-Backup

##Alpha 0000.1v

Differential bakcup integration for Hestiacp and Vestacp

I try to do someting for my needs, but may be works for some body else.

I will base this script in https://github.com/hestiacp/hestiacp/blob/main/bin/v-backup-user

-----------------
Just for testing
-----------------
I start testing this with duplicity

# Why duplicity

Change just a line you can send backups to diferente location
Same configuration is used to send backups to amazon, one drive, ftp, dropbox no extra configuration needed, just change conection data and destination.

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

# Now I try this with BorgBackup

```
# bash v-user-borg-backup maks
-- SYSTEM --
2023-02-26 14:16:01 maks.conf
2023-02-26 14:16:01 stats.log
2023-02-26 14:16:01 history.log
2023-02-26 14:16:01 pam


-- WEB --
2023-02-26 14:16:01 testmaks.com
------------------------------------------------------------------------------
Archive name: 2023-02-26-14:16:01
Archive fingerprint: d1220667a949b3f34bf1ff133a9490e5599bd5aa7b338447e0e887723a23b180
Time (start): Sun, 2023-02-26 14:16:01
Time (end):   Sun, 2023-02-26 14:16:07
Duration: 5.94 seconds
Number of files: 11711
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:              287.68 MB            122.65 MB             46.14 MB
All archives:              287.68 MB            122.65 MB             46.14 MB

                       Unique chunks         Total chunks
Chunk index:                    2831                11755
------------------------------------------------------------------------------
Keeping archive: 2023-02-26-14:16:01                  Sun, 2023-02-26 14:16:01 [d1220667a949b3f34bf1ff133a9490e5599bd5aa7b338447e0e887723a23b180]
2023-02-26 14:16:08 maks2.com
------------------------------------------------------------------------------
Archive name: 2023-02-26-14:16:01
Archive fingerprint: 70588c44feb3e5228be314575524e5e5d68c279a7b547cdce3bfd2279fe5d71f
Time (start): Sun, 2023-02-26 14:16:08
Time (end):   Sun, 2023-02-26 14:16:08
Duration: 0.01 seconds
Number of files: 6
Utilization of max. archive size: 0%
------------------------------------------------------------------------------
                       Original size      Compressed size    Deduplicated size
This archive:               18.38 kB              8.04 kB              8.04 kB
All archives:               18.38 kB              8.04 kB              8.04 kB

                       Unique chunks         Total chunks
Chunk index:                       8                    8
------------------------------------------------------------------------------
Keeping archive: 2023-02-26-14:16:01                  Sun, 2023-02-26 14:16:08 [70588c44feb3e5228be314575524e5e5d68c279a7b547cdce3bfd2279fe5d71f]
2023-02-26 14:16:08 *** 2 domains ***

-- DNS --
2023-02-26 14:16:08 testmaks.com
2023-02-26 14:16:08 maks2.com
2023-02-26 14:16:09 *** 2 domains ***

-- MAIL --
2023-02-26 14:16:09 maks2.com
2023-02-26 14:16:09 *** 1 domain ***

-- DB --
2023-02-26 14:16:09 *** 0 databases ***

-- CRON --
2023-02-26 14:16:09 *** 0 jobs ***

-- User Dir --
2023-02-26 14:16:09 adding .bash_logout
2023-02-26 14:16:09 adding .bashrc
2023-02-26 14:16:09 adding .cache
2023-02-26 14:16:09 adding .composer
2023-02-26 14:16:09 adding .config
2023-02-26 14:16:09 adding .local
2023-02-26 14:16:09 adding .npm
2023-02-26 14:16:09 adding .profile
2023-02-26 14:16:09 adding .ssh
2023-02-26 14:16:09 adding .vscode-server
2023-02-26 14:16:09 *** 10 directories ***

-- SUMMARY --
2023-02-26 14:16:09 Rotated: 2023-02-26_14-00-31
2023-02-26 14:16:09 Local: /backup/maks.2023-02-26_14-16-09.tar
2023-02-26 14:16:09 Size: 1 MB
2023-02-26 14:16:09 Runtime: 1 minute
```

Each week or when get some time, I will try modify some parts of v-backup-user to intetrage completly with borg, of course v-restore-user need some work


