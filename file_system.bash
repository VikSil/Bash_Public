# see all files/folders
ls -lah
ls -lah /some/directory
# see info on current dir
ls -ld
# drill into tree
ls -lR
# sort by size in reverse
ls -lShr
# sort by modification time
ls -lth --full-time

# see everything in current folder
echo *
# see everything in current dir starting with L
echo L*
# see all everything starting with F in subdirectory starting with S
echo S*/F*

#-------------------------------------------
# rebuild file/directory index
sudo updatedb

# find a file/file contents/directory (that user has access to)
locate keyword
# find in filename/directory name only
locate -b keyword #(b=basename)
locate -b "\precisefilename"

# see hit number of the above command
locate -c keyword

# find in a directory
find ~ -name "*bash*" # find file names containing "bash" in home dir

#-------------------------------------------
# copy files
cp /source_path/filename /destination_path
cp /source_path/filename . # copy to current dir
cp -v /etc/hosts ~/hosts.copy # verbosely copy hosts file to home dir and rename the copy
cp -i /etc/example.txt ~/Documents/existing_example.txt # interactive copy (ask if file exists)
cp -n /etc/example.txt ~/Documents # don't ask, don't override if file aready exists
cp -r /etc/source_dir /destination_parent_dir # recursivelly copies everything, including directories
cp -p /source_path/filename /destination_path # copy, but preserve file atributes (including time)


#-------------------------------------------
# move files and directories
mv /source_path/filename /destination_dir
# rename file
mv /etc/example.txt /etc/renamed_example.txt
# rename file and move it to pwd (by specifying destination name but not destination dir)
mv /etc/example.txt renamed_example.txt

#-------------------------------------------
# remove multiple files with confirmation
rm -i *.txt # remove all .txt files from pwd, interactive (ask confirmation) for each

# remove multiple files
rm file1 file2

# remove dirs (recursive remove)
rm -r /path/dir_to_remove

#-------------------------------------------
# check file type
file /path/filename

# check filetypes of everything in a dir
for file in `ls /path/dirname`; do
file /path/dirname/$file
done
# data isa binary/executable!


#-------------------------------------------
# archiving
gzip /path/filename # compress and remove original file
gunzip /path/filename.gz # decompress
gzip -d /path/filename.gz # decompress, works the same as above
gzip -l /path/compressedfile.gz # examine properties of a compressed file

tar -c -f archive_name.tar file1 file2 file3* # create a new archive of several files
tar -cz -f archive_name.tgz file* # archive files and zip the archive
tar -tjf  some_archive.tbz # decompress on the fly (-j) and list (-t) archive file (-f) content
tar -xjf somearchive.tbz # extract here
tar -xjf somearchive.tbz /exact/path/tofile*.txt # extract some of the files here

zip -r new_archive_name.zip files* # create new archive recursivelly 
unzip archive_name.zip # extract here
unzip -l archive_name.zip # list (not unarchive!) files in the archive


#-------------------------------------------
# FILE SYSTEM HIERARCHY

# https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_13_2.png

: <<'COMMENT'
/ 	The base of the structure, or root of the filesystem, this directory unifies all directories regardless of whether they are local partitions, removable devices or network shares
/bin 	Essential binaries like the ls, cp, and rm commands, and be a part of the root filesystem
/boot 	Files necessary to boot the system, such as the Linux kernel and associated configuration files
/dev 	Files that represent hardware devices and other special files, such as the /dev/null and /dev/zero files
/etc 	Essential host configurations files such as the /etc/hosts or /etc/passwd files
/home 	User home directories
/lib 	Essential libraries to support the executable files in the /bin and /sbin directories
/lib64 	Essential libraries built for a specific architecture. For example, the /lib64 directory for 64-bit AMD/Intel x86 compatible processors
/media 	Mount point for removable media mounted automatically
/mnt 	Mount point for temporarily mounting filesystems manually
/opt 	Optional third-party software installation location
/proc 	Virtual filesystem for the kernel to report process information, as well as other information
/root 	Home directory of the root user
/sbin 	Essential system binaries primarily used by the root user
/sys 	Virtual filesystem for information about hardware devices connected to the system
/srv 	Location where site-specific services may be hosted
/tmp 	Directory where all users are allowed to create temporary files and that is supposed to be cleared at boot time (but often is not)
/usr 	

Second hierarchy
Non-essential files for multi-user use
/usr/local 	

Third hierarchy
Files for software not originating from distribution
/var 	

Fourth hierarchy
Files that change over time
/var/cache 	Files used for caching application data
/var/log 	Most log files
/var/lock 	Lock files for shared resources
/var/spool 	Spool files for printing and mail
/var/tmp 	Temporary files to be preserved between reboots

COMMENT

#-------------------------------------------
# PACKAGES / LIBRARIES

dpkg -L packagename # list (-L) all dirs related to the application

ls -lAh /path/dir/*.so # list libraries (shared objects) in the directory


#-------------------------------------------