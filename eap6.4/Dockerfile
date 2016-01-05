#######################################################################
# Creates a base image with JBoss EAP-6.4                             #
#######################################################################

# Use 
FROM registry.access.redhat.com/jboss-eap-6/eap-openshift:6.4

USER root

LABEL help="Please visit http://github.com/AppDynamics/sti-wildfly for more details."	
LABEL run="Please visit http://github.com/AppDynamics/sti-wildfly for more details."
LABEL uninstall="Please visit http://github.com/AppDynamics/sti-wildfly for more details."
LABEL install="Please visit http://github.com/AppDynamics/sti-wildfly for more details."
LABEL stop="Please visit http://github.com/AppDynamics/sti-wildfly for more details."

LABEL name="eap-openshift:6.4-appdynamics-4.1.7.0"
LABEL version=1.0
LABEL release=1.0
LABEL architecture=Linux/x64
LABEL build-date=2015-12-11T10:00:00-05:00
LABEL vendor=AppDynamics
LABEL url=http://github.com/AppDynamics/sti-wildfly 
LABEL summary="EAP 6.4 builder image with AppDynamics Java agent"
LABEL description="This enhanced builder image allows EAP 6.4 \
                  applications to be monitored using  \
                  AppDynamics Java agent."
LABEL vcs-type=git
LABEL vcs-url=http://github.com/AppDynamics/sti-wildfly
LABEL vcs-ref=903d874ea4b8df219783bffb5d5936d19529f08e
LABEL authoritative-source-url=https://hub.docker.com/r/appdynamics/sti-wildfly-eap64-rhel7	
LABEL distribution-scope=public
LABEL changelog-url=https://github.com/Appdynamics/sti-wildfly/releases

RUN yum -y update java

ENV APPDYNAMICS_AGENT_VERSION 4.1.7.0
ENV APPDYNAMICS_URL https://packages.appdynamics.com/java
RUN curl -o AppServerAgent-$APPDYNAMICS_AGENT_VERSION.zip \
    -0 $APPDYNAMICS_URL/$APPDYNAMICS_AGENT_VERSION/AppServerAgent-$APPDYNAMICS_AGENT_VERSION.zip  && \
    mkdir -p /opt/java-agent && \
    unzip -q AppServerAgent-$APPDYNAMICS_AGENT_VERSION.zip -d /opt/java-agent && \
    chmod -R 777 /opt/java-agent/ver$APPDYNAMICS_AGENT_VERSION && \
    rm -rf AppServerAgent-$APPDYNAMICS_AGENT_VERSION.zip

# Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH
COPY ./sti/bin/ /usr/local/sti


##########################################################
# Create jboss user
##########################################################

# add our user 
#RUN $JBOSS_HOME/bin/add-user.sh -g admin -u admin -p admin-123 -s

EXPOSE 8080 4447 9990

USER jboss


CMD /usr/local/sti/usage
