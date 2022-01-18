#!/bin/sh
echo "Updating packages ..."
# Install Java
mkdir /usr/java  # Create a `java` folder
cd /usr/java     # Enter the `java` folder
# Upload JDK installation package (recommended)
You are recommended to use tools such as WinSCP to upload the JDK installation package to the above `java` folder and then decompress it.
Or
# Use a command (you are recommended to upload the installation package): run `wget` to download the package, which cannot be decompressed because a downloaded package declines the Oracle BSD License by default. Please go to https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html to accept the license agreement and obtain the download link with your cookies.
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz
# Decompress
chmod +x jdk-8u201-linux-x64.tar.gz
tar -xzvf jdk-8u201-linux-x64.tar.gz

vi /etc/profile

# set java environment
export JAVA_HOME=/usr/java/jdk1.8.0_201
export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib
export PATH=$JAVA_HOME/bin:$PATH

source /etc/profile

# Install Tomcat
wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz
tar -xzvf apache-tomcat-8.5.39.tar.gz
mv apache-tomcat-8.5.39 /usr/local/tomcat/

# Add a general user `www` to run Tomcat
useradd www
# Create a website root directory
mkdir -p /data/wwwroot/default
# Upload the Java web project file (WAR package) to the website root directory and modify the file permission under the directory to `www`. This example shows how to create a Tomcat test page in the website root directory:
echo Hello Tomcat! > /data/wwwroot/default/index.jsp
chown -R www.www /data/wwwroot

# Add a general user `www` to run Tomcat
useradd www
# Create a website root directory
mkdir -p /data/wwwroot/default
# Upload the Java web project file (WAR package) to the website root directory and modify the file permission under the directory to `www`. This example shows how to create a Tomcat test page in the website root directory:
echo Hello Tomcat! > /data/wwwroot/default/index.jsp
chown -R www.www /data/wwwroot
