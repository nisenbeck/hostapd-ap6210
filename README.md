hostapd for Banana Pro (ap6210)
-------------------------------

This repo contains hostapd-2.4 with ap6210 driver support for Banana Pro and build manifests to package it as a .deb file. This was tested to build and work on Banana Pro (Allwinner A20) running Bananian 15.08 (Jessie, kernel 3.4.108).

The repo contains almost none of my code (just Debian manifests partially), all software used is described below. Follow the links to find out respective software licenses. Parts done by me are in Public Domain.

Software used:
--------------

* hostapd-2.4:
  * http://w1.fi/releases/hostapd-2.4.tar.gz
* noscan patch from OpenWRT:
  * https://dev.openwrt.org/browser/trunk/package/network/services/hostapd/patches/300-noscan.patch
* init script:
  * https://packages.qa.debian.org/w/wpa.html

INSTALL:
--------

Install the toolchain if missing:

    apt-get install git build-essential fakeroot devscripts debhelper libnl-3-dev libssl-dev pkg-config libnl-genl-3-dev

then copy the repo, build and install the package:

    git clone https://github.com/Bananian/hostapd-ap6210.git
    cd hostapd-ap6210
    bash build.sh
    dpkg -i ../hostapd-ap6210_2.4-4_armhf.deb
USE:
----

Add the following line to /etc/modules to load the ap6210 module in AP mode, then reboot:

    ap6210 op_mode=2

The sample config file is provided in /etc/hostapd/hostapd.conf - edit it for your needs (change BSSID and WPA key).
Then uncomment the DAEMON_CONF line in /etc/default/hostapd to unlock the init script.
Finally, start the init script:

    /etc/init.d/hostapd start

