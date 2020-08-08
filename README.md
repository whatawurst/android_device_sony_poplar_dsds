Device configuration for Sony Xperia XZ1 dual sim variant (poplar_dsds)
========================================================

Description
-----------

This repository is for LineageOS 17.1 on Sony Xperia XZ1 dual sim variant (poplar_dsds).

How to build LineageOS
----------------------

* Make a workspace:

        mkdir -p ~/lineageos
        cd ~/lineageos

* Initialize the repo:

        repo init -u git://github.com/LineageOS/android.git -b lineage-17.1

* Create a local manifest:

        vim .repo/local_manifests/roomservice.xml

        <?xml version="1.0" encoding="UTF-8"?>
        <manifest>
            <!-- SONY -->
            <project name="whatawurst/android_kernel_sony_msm8998" path="kernel/sony/msm8998" remote="github" revision="lineage-17.1" />
            <project name="whatawurst/android_device_sony_common-treble" path="device/sony/common-treble" remote="github" revision="lineage-17.1" />
            <project name="whatawurst/android_device_sony_yoshino" path="device/sony/yoshino" remote="github" revision="lineage-17.1" />
            <project name="whatawurst/android_device_sony_poplar_dsds" path="device/sony/poplar_dsds" remote="github" revision="lineage-17.1" />

            <!-- Pinned blobs for poplar_dsds -->
            <project name="whatawurst/android_vendor_sony_poplar_dsds" path="vendor/sony/poplar_dsds" remote="github" revision="lineage-17.1" />
        </manifest>

* Sync the repo:

        repo sync

* Extract vendor blobs

        cd device/sony/poplar_dsds
        ./extract-files.sh

* Setup the environment

        source build/envsetup.sh
        lunch lineage_poplar_dsds-userdebug

* Build LineageOS

        make -j8 bacon
