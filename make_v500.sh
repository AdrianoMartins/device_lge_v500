. build/envsetup.sh

lunch aosp_v500-userdebug

#export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3g"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server

#make clean
#make bootimage
make -j8 otapackage
