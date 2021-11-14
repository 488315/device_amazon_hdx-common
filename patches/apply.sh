echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/base system/bt"

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
