# A script which installs the dotfiles onto the system.
# Places any old files in backup.
# Supports folders and 1 depth nested structures.

# The script will automatically find the dotfiles to install by looking
# in the folder. These files should be ignored. 

import os
import os.path
import shutil

exceptions = [ "README.md", "install.py", ".git", ".install.py.swp" ]

home = os.path.expanduser("~")
folder = os.path.expanduser("~/dotfiles")
backup = os.path.expanduser("~/dotfiles_bak")

# Returns a dictionary with the directories and files which
# should be installed
def getFilePaths():
    dir = {}
    dir["."] = []
    files = [ f for f in os.listdir(folder) ]
    for file in files:
        if os.path.isfile(file):
            if file not in exceptions:
                dir["."].append(file)
        else: # It's a directory, add this to dictionary and all files.
            if file not in exceptions:
                dir[file] = [ f for f in os.listdir(file) ]
    return dir

# Copies the to-be installed files into the backup directory
def backupCurrentFiles(directories):
    if not os.path.exists(backup):
        os.makedirs(backup)

    for directory, files in directories.iteritems():
        dirPath = os.path.join(home, directory)
        destinationFolder = os.path.join(backup, directory)
        if not os.path.exists(destinationFolder):
            os.makedirs(destinationFolder)
        for file in files:
            path = os.path.join(dirPath, file)
            if os.path.exists(path):
                shutil.copy2(path, os.path.join(destinationFolder, file))

# Removes the dotfiles and adds symlinks to the files in the dotfiles directory
def removeAndCreateSymlinks(directories):
    for directory, files in directories.iteritems():
        for file in files:
            source = os.path.join(folder, directory, file)
            if os.path.exists(source):
                path = os.path.join(home, directory, file)
                if not os.path.exists(os.path.join(home, directory)):
                    os.makedirs(os.path.join(home, directory))

                if os.path.exists(path):
                    os.remove(path)
                os.symlink(source, path)

print """
Welcome to the dotfiles installer.
This installer will add all dotfiles from the ~/dotfiles folder to this current
user. This is done by backing up the current files in the ~/dotfiles_bak directory,
and replacing the current dotfiles with symlinks to the files  in the ~/dotfiles folder.
"""
directories = getFilePaths()
print "These are the files which will be installed."
for directory, files in directories.iteritems():
    for file in files:
        print "File: %s/%s" % (directory, file)

print ""
print "Backing up files..."
backupCurrentFiles(directories)
print "Done."
print ""
print "Removing current files, and symlinking..."
removeAndCreateSymlinks(directories)
print "Done."
print "Installation is successful."
