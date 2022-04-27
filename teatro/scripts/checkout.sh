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
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
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
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b dev_main_73.0.3683.75 "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
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
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwp" $teatro_mmlib_iwp_impl_dir/libiwp
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libdash" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libdash" $teatro_mmlib_iwp_impl_dir/libiwp/external/libdash
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libhls" ]; then
              git clone -b hls2 "ssh://$gerrit_username@gerrit.iwedia.com:29418/libhls" $teatro_mmlib_iwp_impl_dir/libiwp/external/libhls
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libiwu" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwu" $teatro_mmlib_iwp_impl_dir/libiwp/external/libiwu
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/open-source" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/open-source" $teatro_mmlib_iwp_impl_dir/libiwp/external/open-source
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libmss" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libmss" $teatro_mmlib_iwp_impl_dir/libiwp/external/libmss
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b dev_main_73.0.3683.75 "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
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
                git clone -b opapps_capy "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b opapps_capy "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b opapps_capy "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    v98)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning v98"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone -b mediatek "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b dev_main_98.0.4758.80 "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;

    v98-ndk)
        if [ "$gerrit_username" != "" ]; then
            echo "Cloning v98"
            if [ ! -d "$hbbtv_common_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_common" "$hbbtv_common_dir"
            fi

            if [ ! -d "$hbbtv_stack_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/hbbtv_stack" "$hbbtv_stack_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir" ]; then
                git clone -b dev_main "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_mmlib_iwp_impl" "$teatro_mmlib_iwp_impl_dir"
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwp" $teatro_mmlib_iwp_impl_dir/libiwp
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libdash" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libdash" $teatro_mmlib_iwp_impl_dir/libiwp/external/libdash
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libhls" ]; then
              git clone -b hls2 "ssh://$gerrit_username@gerrit.iwedia.com:29418/libhls" $teatro_mmlib_iwp_impl_dir/libiwp/external/libhls
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libiwu" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libiwu" $teatro_mmlib_iwp_impl_dir/libiwp/external/libiwu
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/open-source" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/open-source" $teatro_mmlib_iwp_impl_dir/libiwp/external/open-source
            fi

            if [ ! -d "$teatro_mmlib_iwp_impl_dir/libiwp/external/libmss" ]; then
              git clone "ssh://$gerrit_username@gerrit.iwedia.com:29418/libmss" $teatro_mmlib_iwp_impl_dir/libiwp/external/libmss
            fi

            if [ ! -d "$teatro_tv_browser_dir" ]; then
                git clone -b dev_main_98.0.4758.80 "ssh://$gerrit_username@gerrit.iwedia.com:29418/teatro_tv_browser" "$teatro_tv_browser_dir"
            fi
            echo "All repositories cloned"
        else
            echo "No gerrit username provided."
            exit 0
        fi
    ;;
esac