# GIT REPO EXT4 TO NTFS

Situation:

-You have a git repo in a ext4 partition that is almost full then you
have a ntfs partition with a lot free space as an intermediate between Linux and Windows.

-When you copy from ext4 to ntfs you see that git shows your git repo
files as if were a lot of changes. Then you do a git diff and it shows
no visible changes. So all the real changed files is hard to see.

Solution:

-have a bash script to copy files from ext4 and disable the git repo to watch changes in file permisions because ntfs isnt compatible

-have a bash script to copy files from ntfs and enable the git repo to watch changes in file permisions in ext4


### load the functions

```bash
source git_repo_ext4_to_ntfs.sh
```

### how to use it

```bash
# as is using rsync for copy '/' makes difference
# remember ./tests_dir2_ext4 will copy the whole folder with inside dirs and files
# so in order to work remember to use ./tests_dir2_ext4/ it will only copy inside dirs and files
git_repos_ext4_to_ntfs ./tests_dir2_ext4/ ./tests_dir3_ntfs


git_repos_ntfs_to_ext4 ./tests_dir3_ntfs/ ./tests_dir4_again_ext4
```

### run the demo
```bash
source test_demo.sh
```