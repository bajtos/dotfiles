#!/bin/bash -e

cutstring="DO NOT EDIT BELOW THIS LINE"

for name in *; do
  if [ $name = "iterm" ]; then
    continue;
  fi

  if [[ $name == "vscode" ]]; then
    vscode="$HOME/Library/Application Support/Code/User"
    if [ ! -d "$vscode" ]; then
      echo "Skipping VSCode files, '$vscode' directory not found"
    else
      for name in `ls -1 vscode`; do
        if [ -L "$vscode/$name" ]; then
          echo "Skipping vscode/$name - symlinks already exists"
        else
          ln -s "$PWD/vscode/$name" "$vscode/$name"
        fi
      done
    fi
    continue;
  fi
  target="$HOME/.$name"
  if [[ $name == "config" ]]; then
    # Config files often contain secret credentials
    # Install symlinks only for config files that are safe to be shared
    mkdir -p $target
    for fname in `ls -1 $name`; do
      if [ -L "$target/$fname" ]; then
        echo "Skipping $name/$fname - symlinks already exists"
      else
        ln -s "$PWD/$name/$fname" "$target/$fname"
      fi
    done
    continue;
  fi
  if [ -e $target ]; then
    if [ ! -L $target ]; then
      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
      if [[ -n $cutline ]]; then
        let "cutline = $cutline - 1"
        echo "Updating $target"
        head -n $cutline "$target" > update_tmp
        startline=`tail -r "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        if [[ -n $startline ]]; then
          tail -n $startline "$name" >> update_tmp
        else
          cat "$name" >> update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    if [[ $name != 'install.sh' && $name != 'README.md' && $name != 'win' ]]; then
      echo "Creating $target"
      if [[ -n `grep "$cutstring" "$name"` ]]; then
        cp "$PWD/$name" "$target"
      else
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done
