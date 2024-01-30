#!/bin/bash

git clone https://github.com/adi1090x/plymouth-themes.git /tmp/plymouth

cd /tmp/plymouth

cd pack_3/lone

#rm -rf /usr/share/plymouth/themes/spinner/

mkdir /usr/share/plymouth/themes/lone/

cp -r * /usr/share/plymouth/themes/lone/

cd /tmp/plymouth

cd pack_1/cuts

mkdir /usr/share/plymouth/themes/cuts/

cp -r * /usr/share/plymouth/themes/cuts/

#plymouth-set-default-theme tataru -R
