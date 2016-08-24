@echo off
rem autoexec.bat for DOSEMU + FreeDOS
path d:\dosemu;d:\bin;d:\gnu
set HELPPATH=d:\help
set TEMP=c:\tmp
sound /e
prompt $P$G
system -s DOSEMU_VERSION
system -s DEX_HOST_PWD_DOSSAFE
echo Welcome to dex dosemu2! R: is rootfs, H: is home
echo     Build %DOSEMU_VERSION%
lredir2 h: linux\fs/dex/home
lredir2 r: linux\fs/dex/workspace
R:
cd %DEX_HOST_PWD_DOSSAFE%
system -e
