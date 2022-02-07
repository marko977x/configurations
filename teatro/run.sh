version=$1
root_dir=$(pwd)
if [ $version == "v55" ]; then
	echo "Running v55"
	export LD_LIBRARY_PATH=$root_dir/hbbtv_common_v55/output/iwedia/hbbtv/lib:/usr/lib:$LD_LIBRARY_PATH
	export BROWSER_LOCATION=$root_dir/hbbtv_common_v55/teatro_tv_browser/chromium/out/v55-pc/hbbtv_content_shell
	$root_dir/hbbtv_common_v55/output/iwedia/hbbtv/bin/test-web-browser
elif [ $version == "v73" ]; then
	echo "Running v73"
	export LD_LIBRARY_PATH=$root_dir/hbbtv_common_v73/output/teatro/hbbtv/lib:$LD_LIBRARY_PATH
	export BROWSER_LOCATION=$root_dir/hbbtv_common_v73/teatro_tv_browser/chromium/out/v73-pc/teatro_tv_browser
	# export FCITX_LOCATION=$root_dir/hbbtv_common_v73/output/teatro/hbbtv/bin/fcitx
	$root_dir/hbbtv_common_v73/output/teatro/hbbtv/bin/test-teatro-tv-browser --js-flags="--no-icu-timezone-data"
elif [ $version == "opapps_capy" ]; then
	export LD_LIBRARY_PATH=$root_dir/hbbtv_common_opapps_capy/output/teatro/hbbtv/lib:$LD_LIBRARY_PATH
	export BROWSER_LOCATION=$root_dir/hbbtv_common_opapps_capy/teatro_tv_browser/chromium/out/opapps_capy-pc/hbbtv_content_shell
	$root_dir/hbbtv_common_opapps_capy/output/teatro/hbbtv/bin/test-web-browser
fi
