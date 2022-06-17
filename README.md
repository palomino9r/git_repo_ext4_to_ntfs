# GIT REPO EXT4 TO NTFS

Situation:

-You have a git repo in a ext4 partition that is almost full then you
have a ntfs partition with a lot free space as an intermediate between Linux and Windows.

-When you copy from ext4 to ntfs you see that git shows your git repo
files as if were a lot of changes. Then you do a git diff and it shows
no visible changes. So all the real changed files is hard to see.

Solution:

-have a script to copy files from ext4 and disable the git repo to watch changes in file permisions because ntfs isnt compatible

-have a script to copy files from ntfs and enable the git repo to watch changes in file permisions in ext4