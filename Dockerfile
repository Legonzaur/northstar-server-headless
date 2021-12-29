FROM archlinux

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm vulkan-icd-loader vulkan-swrast wine winetricks xorg-server-xvfb mesa wget mingw-w64 glslang git ninja meson which

ARG WINEPREFIX /Wine
ENV WINEPREFIX /Wine

RUN git clone --branch northstar --single-branch https://github.com/pg9182/dxvk
RUN /dxvk/package-release.sh master / --no-package
RUN wineboot -i -e && wineserver --wait
RUN /dxvk-master/setup_dxvk.sh install

RUN mkdir Titanfall2

COPY startup.sh /
RUN chmod +x startup.sh

ENTRYPOINT /startup.sh