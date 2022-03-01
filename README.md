# OTBridge
A program to simplify running OTSoft on linux. It might work on Mac, but I haven't tested it. This guide assumes that if you are running OTSoft on linux, you know enough to trouble shoot minor problems yourself. That said, it can be improved so feel free to submit issues or patches.

##Prerequisites
The program requires `wine`, `make` and `unix2dos` in order to function. These should be available from your package manager.

It also requires a working version of OTSoft running under wine. Depending on your machine this may be simple or difficult, but this guide assumes you have already figured out how to get the program running.

##Installation
The program is a Makefile that you place in the OTSoft directory. Installation is as simple as downloading the file.

##Quick start
To start, you will need a constraint file saved as a CSV. Throughout the file we use `NAME` to identify this and related files and it refers to the filename without the file extension.

The Makefile has three recipes.

`make load NAME=filename` converts the constraint file's path to a DOS path and adds it to OTSoftRecentlyOpenedFiles.txt so that it can be loaded. The default behavior of OTSoft requires inputs be draged and dropped, but the pecularieties of WINE make this not possible. Instead, we manually edit the recently loaded files list so that the inputs can be loaded from the *File>Open recent* drop-down menu.

`make inputs-clean NAME=filename` converts the input CSV into DOS format and cleans up the working firectory. On unix, the CSV is saved with `\n`, but OTSoft expects the DOS convention of `\r\n` leading to confusing errors caused by non-printing characters.

`make run` is a wrapper for running OTSoft.

##License
This software is licensed to you under the terms of the BSD 3-clause license. See LICENSE for further details.
