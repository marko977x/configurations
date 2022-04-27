# Purpose: build teatro
# Parameters:
# $1: build type: v55, v73, opapps_capy, ...
# $2: platform_type: arm, pc, ...
# $3: target: teatro_tv_browser, hbbtv_content_shell ...

root_dir=$(pwd)
build_type=$1
platform_type=$2
target=$3

if [ ! -f "$root_dir/build.sh" ]; then
    echo "Run script from your hbbtv_common_x directory level and make sure there is build.sh in hbbtv_common_x directory level"
    exit 0
fi

hbbtv_common_dir=$root_dir/hbbtv_common_$build_type

if [ ! -d "$hbbtv_common_dir" ]; then
    echo "Can't find hbbtv_common_$build_type"
    echo "Run checkout.sh for $build_type (bash checkout.sh $build_type your-gerrit-username)"
    exit 0
fi


if [ "$platform_type" != "pc" ] && [ "$platform_type" != "arm" ]; then
    echo "'$platform_type' is not valid platform type value"
    exit 0;
fi

if [ "$target" != "hbbtv_content_shell" ] && [ "$target" != "teatro_tv_browser" ]; then
    echo "'$target' is not valid target value"
    exit 0;
fi

hbbtv_stack_dir=$hbbtv_common_dir/hbbtv_stack
teatro_mmlib_iwp_impl_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl_dir
teatro_tv_browser_dir=$hbbtv_common_dir/teatro_tv_browser

source $hbbtv_common_dir/scripts/build/linux_blink/mtk/setenv_linux_hbbtv.sh
cd $hbbtv_stack_dir/makefiles_linux

case $build_type in
    v55)
        make -f make-test-web-browser clean
    ;;

    v73)
        make -f make-test-teatro-tv-browser clean
    ;;

    opapps_capy)
        make -f make-test-web-browser clean
    ;;

    gcc1.4.2)
        make -f make-test-web-browser clean
    ;;
esac

make -f make-all $platform_type

if [ ! -d "$teatro_tv_browser_dir/chromium/out/$build_type-$platform_type" ]; then
    cd $teatro_tv_browser_dir/chromium/src
    gn args ../out/$build_type-$platform_type
fi

cd $teatro_tv_browser_dir/chromium
ninja -C out/$build_type-$platform_type $target

# ./obj_inter/objcopy-2.19 --update-section .interp=obj_inter/1.txt $teatro_tv_browser_dir/teatro_tv_browser/chromium/out/$build_type-$platform_type/$target