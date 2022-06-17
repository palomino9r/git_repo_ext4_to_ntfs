create_test_dirs () {
    # load script so you can use the functions
    source git_repo_ext4_to_ntfs.sh
    repo_dir_2=$(pwd)

    mkdir tests_dir
    cd tests_dir

    mkdir tests_dir2_ext4
    cd tests_dir2_ext4

    mkdir test_dir_one
    mkdir test_dir_two
    mkdir test_dir_three

    cd test_dir_one
    touch test_text.txt
    echo 'hello world test one' >> test_text.txt
    git init
    git add .
    git commit -m "initial commit"
    git config --list | grep core.filemode
    cd ../

    cd test_dir_three
    touch test_text2.txt
    echo 'hello world test three' >> test_text2.txt
    git init
    git add .
    git commit -m "initial commit"
    git config --list | grep core.filemode
    cd ../../
    ls -la

    # as is using rsync for copy '/' makes difference
    # remember ./tests_dir2_ext4 will copy the whole folder with inside dirs and files
    # so in order to work remember to use ./tests_dir2_ext4/ it will only copy inside dirs and files
    git_repos_ext4_to_ntfs ./tests_dir2_ext4/ ./tests_dir3_ntfs
    ls -la

    git_repos_ntfs_to_ext4 ./tests_dir3_ntfs/ ./tests_dir4_again_ext4
    ls -la

    cd tests_dir3_ntfs/test_dir_three/ 
    echo 'tests_dir3_ntfs/test_dir_three/ :'
    git config --list | grep core.filemode && \
    cd ../../

    cd tests_dir4_again_ext4/test_dir_three/
    echo 'tests_dir4_again_ext4/test_dir_three/ :'
    git config --list | grep core.filemode && \
    cd ../../
}

create_test_dirs