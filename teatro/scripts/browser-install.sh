# target is usually "teatro_tv_browser"
target=$1

killall -9 wpf_browser
umount /mnt/vendor/3rd/wpf_browser/browser/$target
# umount /mnt/vendor/3rd/wpf_browser/lib/libavplayerplugin.so
rm -rf /data/$target
# rm -rf /data/libavplayerplugin.so
sync
cp ./$target /data
# cp ./libavplayerplugin.so /data
sync
chmod 777 /data/$target
# chmod 777 /data/libavplayerplugin.so
mount --bind /data/$target /mnt/vendor/3rd/wpf_browser/browser/$target
# # mount --bind /data/libavplayerplugin.so /mnt/vendor/3rd/wpf_browser/lib/libavplayerplugin.so
