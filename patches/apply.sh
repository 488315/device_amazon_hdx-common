echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/base frameworks/opt/net/wifi packages/apps/Settings system/bt system/core system/sepolicy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/amazon/hdx-common/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
