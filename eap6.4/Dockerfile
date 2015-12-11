#######################################################################
# Creates a base image with JBoss EAP-6.4                             #
#######################################################################

# Use 
FROM registry.access.redhat.com/jboss-eap-6/eap-openshift:6.4

USER root

LABEL help=Please visit http://github.com/AppDynamics/sti-wildfly for more details.		# Command to run the help command of the image
LABEL run=Please visit http://github.com/AppDynamics/sti-wildfly for more details.     		# Command to run the image
LABEL uninstall=Please visit http://github.com/AppDynamics/sti-wildfly for more details.	# Command to uninstall the image
LABEL install=Please visit http://github.com/AppDynamics/sti-wildfly for more details.  	# Command to install the image
LABEL stop=Please visit http://github.com/AppDynamics/sti-wildfly for more details.     	# Command to execute before stopping container

LABEL name=eap-openshift:6.4-appdynamics-4.1.6.0 		# Name of the Image
LABEL version=1.0                                		# Version of the image
LABEL release=1.0                                		# Release Number for this version
LABEL architecture=Linux/x64                     		# Architecture for the image
LABEL build-date=2015-12-11T10:00:00-05:00               	# Date/Time image was built as RFC 3339 date-time
LABEL vendor=AppDynamics                                	# Owner of the image
LABEL url=http://github.com/AppDynamics/sti-wildfly     	# Url with more information on the image
LABEL summary=EAP 6.4 builder image with AppDynamics Java agent	# Short Description of the image
LABEL description=This enhanced builder image allows EAP 6.4 \
                  applications to be monitored using  \
                  AppDynamics Java agent. 			# Detailed description of the image
LABEL vcs-type=git						# The type of version control used by the container source. Generally one of git, hg, svn, bzr, cvs
LABEL vcs-url=http://github.com/AppDynamics/sti-wildfly         # URL of the version control repository
LABEL vcs-ref=903d874ea4b8df219783bffb5d5936d19529f08e		# A 'reference' within the version control repository; e.g. a git commit, or a subversion branch
LABEL authoritative-source-url=https://hub.docker.com/r/appdynamics/sti-wildfly-eap64-centos7/	\
								# The authoritative location in which the image is published
LABEL distribution-scope=public					# Intended scope of distribution for image (see below for possible values)
LABEL changelog-url=https://github.com/Appdynamics/sti-wildfly/releases
								# URL of a page containing release notes for the image

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
