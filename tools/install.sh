#!/bin/sh

pkg_location='https://github.com/burningtree/mysetup/archive/master.tar.gz'
target="$HOME/.mysetup"
tmp_name="$HOME/thesetup.tar.gz"

rm -rf $target

echo "Checking if installed .."
# check if installed
if [ -d "$target" ]; then
  echo "mysetup seems to be is installed. cancelling."  
  echo "for deinstall remove directory: $target"  
  exit 1
fi

# clean
if [ -f $tmp_name ]; then
  rm $tmp_name
fi

echo "Downloading package .."
curl -sL $pkg_location -o $tmp_name
if [ $? != 0 ]; then
  echo "error: downloading package failed: $pkg_location"
  exit 10
fi

# install
echo "Installing to: $target"

mkdir $target
tar -C $target -xf $tmp_name --strip-components=1

# clean
rm $tmp_name

# check installation
if [ ! -f "$target/bin/mysetup" ]; then
  echo "error: unpacking failed"
  exit 10;
fi

version=`$target/bin/mysetup version`
echo "Instalation complete: $version"

