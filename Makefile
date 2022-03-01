OTS_VERSION=2.5
export OTS_VERSION

WORK_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
export WORK_DIR

OTS_ROF=OTSoftRecentlyOpenedFiles.txt
export OTS_ROF

# The drag-and-drop interface of OTSoft does not play well with
# WINE, but we can get around that by adding the file's path to
# the recently opened file list so that it loads at start.
#
# First replace unix / with DOS \, then use awk to format the
# winepath for the file. Lastly, concatenate the filename to the
# start of the ROF list, save as a temp file and if there are
# no errors move the temporary file over the previous version.
load:
	echo $(WORK_DIR) | \
		sed 's/\//\\/g' | \
		awk '{print "Z:" $$1 "$(NAME).txt"}' | \
		cat - $(OTS_ROF) > temp && mv temp $(OTS_ROF) 

# Clean up the file space by deleting old files, and converting
# the csv file into DOS format.
inputs-clean: 
	rm -rf FilesFor$(NAME)
	unix2dos $(NAME).csv
	cp $(NAME).csv $(NAME).txt

run:
	wine OTSoft$(OTS_VERSION).exe
