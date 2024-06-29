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

#-------------------------------------------

#-------------------------------------------