FROM registry.cn-hangzhou.aliyuncs.com/dsy/castmatch:stable

COPY  ROOT.xml /etc/tomcat/Catalina/localhost
COPY  upload.xml /etc/tomcat/Catalina/localhost
COPY  pc.xml /etc/tomcat/Catalina/localhost
