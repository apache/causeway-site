Title: upd.sh script

The `upd.sh` script automates the downloading of the zip, asc and md5 scripts from the official Apache repository.

To use:

* download the [upd.sh](./resources/upd.sh) script to your local SVN workspace (corresponding to `https://dist.apache.org/repos/dist/release/isis`).  

* edit the first section, to specify the old and new versions for each of the components.

* run the script.

* commit the changes.

Note that the `upd.sh` script must not itself be checked in to Subversion, hence the necessity to copy it down from here whenever needed.

