# Purpose: clone and build teatro
# Parameters:
# $1: build type (v55, v73, opapps_capy, ...)
# $2: gerrit username

root_dir=$(pwd)
build_type=$1
gerrit_username=$2
hbbtv_common_dir=$root_dir/hbbtv_common_$build_type

hbbtv_stack_dir=$hbbtv_common_dir/hbbtv_stack
teatro_mmlib_iwp_impl_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl
teatro_tv_browser_dir=$hbbtv_common_dir/teatro_tv_browser

case $build_type in
    v55)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning v55"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi
            cd $hbbtv_common_dir
            git checkout mediatek

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi
            cd $hbbtv_stack_dir
            git checkout mediatek

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi
            cd $teatro_mmlib_iwp_impl_dir
            git checkout mediatek

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            cd $teatro_tv_browser_dir
            git checkout mediatek
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    v73)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning v73"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi
            cd $hbbtv_common_dir
            git checkout dev_main

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi
            cd $hbbtv_stack_dir
            git checkout dev_main

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi
            cd $teatro_mmlib_iwp_impl_dir
            git checkout mediatek

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            cd $teatro_tv_browser_dir
            git checkout dev_main_73.0.3683.75
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    v73-ndk)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning v73"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi
            cd $hbbtv_common_dir
            git checkout dev_main

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi
            cd $hbbtv_stack_dir
            git checkout dev_main

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi
            cd $teatro_mmlib_iwp_impl_dir
            git checkout dev_main
            git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwp"
            cd libiwp/external
            git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libdash"
            git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libhls"
            git checkout hls2
            git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwu"
            git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/open-source"

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            cd $teatro_tv_browser_dir
            git checkout dev_main_73.0.3683.75
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    opapps_capy)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning opapps_capy"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi
            cd $hbbtv_common_dir
            git checkout opapps_capy

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi
            cd $hbbtv_stack_dir
            git checkout opapps_capy

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            cd $teatro_tv_browser_dir
            git checkout opapps_capy
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    gcc1.4.2)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning gcc1.4.2"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi
            cd $hbbtv_common_dir
            git checkout gcc-5.5.0_dfb-1.4.2

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi
            cd $hbbtv_stack_dir
            git checkout gcc-5.5.0_dfb-1.4.2

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            cd $teatro_tv_browser_dir
            git checkout gcc-5.5.0_dfb-1.4.2
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;
esac