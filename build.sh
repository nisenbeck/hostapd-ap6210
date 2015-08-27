echo "Please ensure you install the toolchain and build dependencies first!"
make clean && cd .. && tar -cvzf hostapd-ap6210_2.4.orig.tar.gz hostapd-ap6210 && cd hostapd-ap6210
debuild -us -uc
