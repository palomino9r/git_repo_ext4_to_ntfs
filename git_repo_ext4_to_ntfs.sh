#!/bin/bash

# git_repos_ext4_to_ntfs origin_dir dest_dir
git_repos_ext4_to_ntfs () {
    origin_dir=$1
    dest_dir=$2

    current_dir=$(pwd)

    rsync -apv --progress $origin_dir $dest_dir --exclude node_modules --exclude venv --exclude __pycache__ --exclude vendor --exclude target

    for path in `find $dest_dir -mindepth 1 -maxdepth 1 -type d`
    do
        echo "for path: $path"
        cd "$path" || continue
        git config --local core.filemode false
        echo "for pwd: $(pwd)"
        cd ../../
    done

    echo $current_dir
    cd $current_dir
}

# git_repos_ntfs_to_ext4 origin_dir dest_dir
git_repos_ntfs_to_ext4 () {
    origin_dir=$1
    dest_dir=$2

    current_dir=$(pwd)

    rsync -apv --progress $origin_dir $dest_dir --exclude node_modules --exclude venv --exclude __pycache__ --exclude vendor --exclude target

    for path in `find $dest_dir -mindepth 1 -maxdepth 1 -type d`
    do
        echo "for path: $path"
        cd "$path" || continue
        git config --local core.filemode true
        echo "for pwd: $(pwd)"
        cd ../../
    done

    echo $current_dir
    cd $current_dir
}