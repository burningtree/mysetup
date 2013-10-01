#!/bin/sh

pkg_location='https://github.com/burningtree/mysetup/archive/master.tar.gz'
target="$HOME/.mysetup"
tmp_name="$HOME/thesetup.tar.gz"

rm -rf $target

# check if installed
if [ -d "$target" ]; then
  echo "mysetup seems to be is installed. cancelling."  
  echo "for deinstall remove directory: $target"  
  exit 1
fi

# clean
rm $tmp_name

echo "Downloading package .."

echo "curl -sL $pkg_location -o $tmp_name"
curl -sL $pkg_location -o $tmp_name
if [ $? != 0 ]; then
  echo "Error: downloading package failed: $pkg_location"
fi

echo $tmp_name

# install
echo "Installing to: $target"

mkdir $target
tar xvf $tmp_name -C $target

# clean
#rm $tmp_name
