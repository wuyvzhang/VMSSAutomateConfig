
#!/usr/bin/shell
sudo yum install yum-utils
sudo yum-config-manager --add-repo=https://packages.microsoft.com/config/rhel/7/prod.repo
sudo rpm --import http://packages.microsoft.com/keys/microsoft.asc
yum makecache
sudo yum install mdatp
yum repolist
yum load-transaction /tmp/yum_save_tx.2021-09-13.10-29.LJnjfs.yumtx
sudo yum --enablerepo=packages-microsoft-com-prod install mdatp -y
