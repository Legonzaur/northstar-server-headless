FROM archlinux

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel vulkan-icd-loader vulkan-swrast xorg-server-xvfb mesa wget mingw-w64 glslang git ninja meson which

ARG WINEPREFIX /Wine
ENV WINEPREFIX /Wine

RUN mkdir dxvk

RUN git clone --branch northstar --single-branch https://github.com/pg9182/dxvk
RUN /dxvk/package-release.sh master / --no-package

RUN git clone https://github.com/wine-mirror/wine
#configure args from https://gist.github.com/pg9182/7e054b72f1553fef82b1d4f9b00b04ed
RUN cd wine && ./configure --enable-win64 --without-alsa --without-capi --without-coreaudio --without-cups --without-dbus --without-fontconfig --without-freetype --without-gettext --without-gphoto --without-gssapi --without-gstreamer --without-netapi --without-krb5 --without-ldap --without-openal --without-opencl --without-oss --without-pcap --without-pulse --without-sane --without-sdl --without-udev --without-usb --without-v4l2 --without-vkd3d --with-vulkan --without-xcomposite --without-xcursor --without-xfixes --without-xinput --without-xinput2 --without-xrandr --without-xinerama --without-xshape --without-xshm --without-xxf86vm --with-x && make -j4 && make install

RUN wget https://github.com/doitsujin/dxvk/releases/download/v1.9.2/dxvk-1.9.2.tar.gz
RUN tar -xvf dxvk-1.9.2.tar.gz
#RUN /dxvk_full/setup_dxvk.sh install

#RUN wineboot -i -e && wineserver --wait
#RUN /dxvk-master/setup_dxvk.sh install

COPY startup.sh /
RUN chmod +x startup.sh

ENTRYPOINT /startup.sh