FROM archlinux
RUN pacman -Syyu --noconfirm --noprogressbar --quiet \
    && pacman-key --init \
    && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com \
    && pacman-key --lsign-key 3056513887B78AEB \
    && pacman --noconfirm --noprogressbar -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    && echo -e '[chaotic-aur]\nServer = https://mirror.ufscar.br/$repo/$repo/$arch' >> /etc/pacman.conf \
    && pacman -Syyu --noconfirm --noprogressbar --quiet \
    && pacman -S --noconfirm --noprogressbar --quiet base-devel iverilog verilator yosys-git nextpnr-git prjapicula bluespec-git bluespec-contrib-git \
    && rm -rf /var/lib/pacman/sync/* \
    && rm -rf /var/cache/pacman/*
