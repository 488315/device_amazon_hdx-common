echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="dirs=bionic frameworks/av frameworks/base frameworks/native system/bt system/connectivity/wificond"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Reverting $dir patches..."
	#git apply --reverse $rootdirectory/device/manufacturer/codename/patches/$dir/*.patch
	git reset --hard
	git clean -f -d
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
