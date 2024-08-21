FROM kasmweb/parrotos-6-desktop:1.15.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

RUN apt update \
    && apt upgrade -y \
    && apt autoremove -y

#Install 1Password
# For x86
# RUN  curl curl -sSO https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz --output /tmp/1password-latest.deb \
# For ARM
#RUN curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz  --output 1password-latest.tar.gz  \
#     && tar -xf 1password-latest.tar.gz && mkdir -p /opt/1Password && mv 1password-*/* /opt/1Password

##other tools
#RUN apt install synapse filezilla timeshift nfs-common time rlwrap hardinfo pwncat
#
##zsh
#RUN apt install zsh \
#    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
##install jetbrains toolbox
#RUN apt install -y libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin tar \
#    && curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# install sudo
RUN apt install -y sudo \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/list/*


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000