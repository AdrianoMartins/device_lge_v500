# Sync
#repo sync -c -j4 --force-sync --no-clone-bundle --no-tags

# System Config
#export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3g"
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server

# Set up environment
. build/envsetup.sh

# Target
lunch aosp_v500-userdebug

# Build
#mka bacon -j8
#make clean
#make bootimage
make -j8 otapackage
