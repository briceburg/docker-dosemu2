@echo off
rem autoexec.bat for DOSEMU + FreeDOS
path d:\dosemu;d:\bin;d:\gnu
set HELPPATH=d:\help
set TEMP=c:\tmp
sound /e
prompt $P$G
system -s DOSEMU_VERSION
system -s DEX_DOCKER_WORKSPACE_DOS
echo Welcome to dex dosemu2! R: is rootfs, W: is workspace
echo     Build %DOSEMU_VERSION%
lredir2 w: linux\fs/dex/workspace
lredir2 r: linux\fs/dex/rootfs
R:
cd %DEX_DOCKER_WORKSPACE_DOS%
system -e
