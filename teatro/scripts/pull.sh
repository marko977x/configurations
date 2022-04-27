# $1: folder (v55, v73, v98, v73-ndk, v98-ndk ...)
# $2 : optional, reset hard all and pull

root_dir=$(pwd)
build_type=$1
git_method=$2
hbbtv_common_dir=$root_dir/hbbtv_common_$build_type
teatro_tv_browser_dir=$hbbtv_common_dir/teatro_tv_browser
hbbtv_stack_dir=$hbbtv_common_dir/hbbtv_stack
teatro_mmlib_iwp_impl_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl
libiwp_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp
libiwu_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp/external/libiwu
libhls_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp/external/libhls
libmss_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp/external/libmss
libdash_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp/external/libdash
open_source_dir=$hbbtv_common_dir/teatro_mmlib_iwp_impl/libiwp/external/open-source

pull_basic() {
  cd $hbbtv_common_dir
  pull
  cd $teatro_tv_browser_dir
  pull
  cd $hbbtv_stack_dir
  pull
  cd $teatro_mmlib_iwp_impl_dir
  pull
}

pull_ndk() {
  cd $libiwp_dir
  pull
  cd $libiwu_dir
  pull
  cd $libhls_dir
  pull
  cd $libmss_dir
  pull
  cd $libdash_dir
  pull
  cd $open_source_dir
  pull
}

pull() {
  branch=$(git branch --show-current)
  if [ "$git_method" == "reset" ]; then
    if [ "$branch" != "" ]; then
      git reset --hard origin/$branch
    fi
  else
    git stash
  fi

  git pull origin --rebase

  if [ "$git_method" != "reset" ]; then
    git stash pop
  fi
}

case $build_type in
  v55)
    pull_basic
  ;;
  v73)
    pull_basic
  ;;
  v73-ndk)
    pull_basic
    pull_ndk
  ;;
  v98)
    pull_basic
  ;;
  v98-ndk)
    pull_basic
    pull_ndk
  ;;
esac