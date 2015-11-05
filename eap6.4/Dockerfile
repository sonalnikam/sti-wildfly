#######################################################################
# Creates a base image with JBoss EAP-6.4                             #
#######################################################################

# Use 
FROM registry.access.redhat.com/jboss-eap-6/eap-openshift:6.4

USER root

ENV APPDYNAMICS_AGENT_VERSION 4.1.6.0
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
