#!/usr/bin/env python2
"""
monitor-music.py
Copyright 2011 Aaron Goss

This file is part of Monitor Toys.

Monitor Toys is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Monitor Toys is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Monitor Toys.  If not, see <http://www.gnu.org/licenses/>.
"""
import sys, os, optparse, re
import subprocess

INPUT_FILE  = "/tmp/pianobar.out" # Modify to change the default file location
DEFAULT_MSG = "Pianobar: not playing"

def main(argv):
    """
    main()
      - argv: arguments passed from the command-line

      This method parses the arguments passed from the command-line.  If an invalid argument is passed,
      this method will output an error and immediately return.
      One all arguments are parsed, this method will print either the title of the song playing and/or
      the time remaining.

      This method returns 0 if all processes are successful, 1 otherwise.
    """
    parser = optparse.OptionParser()

    parser.add_option("-a", "--album", action="store_true", dest="album", default=False,
                      help="Print most recent album played")
    parser.add_option("-f", "--full-song-info", action="store_true", dest="fullInfo", default=False,
                      help="Print the full song-information w/out tokenizing it")
    parser.add_option("-i", "--input-file", dest="inputFile", default=INPUT_FILE,
                      help="File pianobar output is being directed to (i.e. file to monitor")
    parser.add_option("-n", "--station", action="store_true", dest="station", default=False,
                      help="Print most recent station selected")
    parser.add_option("-r", "--artist", action="store_true", dest="artist", default=False,
                      help="Print most recent artist played")
    parser.add_option("-s", "--song-title", action="store_true", dest="song", default=False,
                      help="Print most recent song title being played")
    parser.add_option("-t", "--time", action="store_true", dest="time", default=False,
                      help="Print most recent time remaining information")
    parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=False,
                      help="Print all output with header information (e.g. 'Now Playing: XXXXX')")
    (opts, args) = parser.parse_args(argv)

    if not testFile(opts.inputFile):
        return 0
    try:
        if opts.station:
            printStation(opts.inputFile, opts.verbose)
        if opts.song or opts.fullInfo:
            printSongTitle(opts.inputFile, opts.verbose, opts.fullInfo)
        if opts.artist and not opts.fullInfo:
            printArtist(opts.inputFile, opts.verbose)
        if opts.album and not opts.fullInfo:
            printAlbum(opts.inputFile, opts.verbose)
        if opts.time:
            printSongTime(opts.inputFile, opts.verbose)

    except IOError, e:
        print(DEFAULT_MSG)
        return 1

    return 0

def testFile(file):
    """
    testFile()
      - file: filename being checked

      This method tests a file, checking to see if a process is attached to it.  The result of this
      operation is returned (True if a process _is_ attached, False otherwise).

      This method executes the 'fuser' command on the command-line, and checks to see if there are
      results.
    """
    p = subprocess.Popen(["fuser", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    result = p.communicate()[0]

    return result not in (None, "")

def printStation(file, verbose):
    """
    printStation()
      - file:    path to file being written by Pianobar
      - verbose: setting to print headers

      This method attempts to parse out the most recently-selected station.  This
      content is buried deep within the file; this method runs "grep" on the command-line,
      extracting all strings with "Station" in them.  The last instance of this string
      is printed to STDOUT.
    """
    p = subprocess.Popen(["grep", "Station", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    result = p.communicate()[0]
    output = result.split("\r")[-1]

    if "Station" in output:
        if verbose:
            output = output.replace("|>", "")
            output = re.sub("\(.*\)", "", output)
            output = output.strip()
            output = output.rstrip()
            print(output)
        else:
            output = output.split("\"")[1]
            print(output)
    else:
        print(DEFAULT_MSG)

def printSongTitle(file, verbose, printAllInfo):
    """
    printSongTitle()
      - file: path to file being written by Pianobar
      - verbose: setting to print headers

      This method attempts to parse out the title of the most recently-played song.  This
      content is buried deep within the content in the file.  This method runs the 'grep'
      command on the command-line against this file, first extracting "|>" lines (which are
      hard-coded in Pianobar to indicate song titles).  It then uses a combination of newline
      and carriage-return parsing to extract the last instance of this string in the file.
    """
    output = parseSongInfo(file)
    if "<3" in output:
        test = "<3"
    else:
        test = ""
    if output is not None:
        if not printAllInfo:
            output = output.split("by")[0]
        if verbose:
            output = "Now Playing: %s" % output
        print(output+test)
    else:
        print(DEFAULT_MSG)

def printArtist(file, verbose):
    """
    printArtist()
      - file: path to file being written by Pianobar
      - verbose: setting to print headers

      This method parses out the name of the artist currently playing.  If the
      verbose flag is included, this method includes header information about
      what's playing.
    """
    output = parseSongInfo(file)

    if output is not None:
        output = output.split("\"")[3]
        if verbose:
            output = "Artist: %s" % output
        print(output)
    else:
        print(DEFAULT_MSG)

def printAlbum(file, verbose):
    """
    printAlbum()
      - file: path to file being written by Pianobar
      - verbose: setting to print headers

      This method parses out the album currently playing.  If the
      verbose flag is included, this method includes header information
      about what's playing.
    """
    output = parseSongInfo(file)
    if output is not None:
        output = output.split("\"")[5]
        if verbose:
            output = "AlbumL %s" % output
        print(output)
    else:
        print(DEFAULT_MSG)

def printSongTime(file, verbose):
    """
    printSongTitle()
      - file: path to file being written by Pianobar
      - verbose: setting to print headers

      This method opens a new file object using the filepath passed by the calling method.  This
      filehandle is then modified so its position is set to 12 bytes prior to the end (yes, hard-
      coded length, I know).  It then reads the following 12 bytes of information, which indicates
      the time remaining in the song.  The file is then closed (which repositions the file to the
      EOF so it writes correctly).
    """
    try:
        with open(file, 'ra') as fileH:
            fileH.seek(-25, 2)
            #content = fileH.read(12).rstrip()
            lineList=fileH.readlines();
            content = lineList[-1][8:].rstrip()
            if "/" in content:
                content = "Play time remaining: %s" % content if verbose else content
                print(content)
            else:
                print(DEFAULT_MSG)

            fileH.close()
    except IOError:
        print(DEFAULT_MSG)

def parseSongInfo(file):
    """
    parseSongInfo()
      - file: path to file being written by Pianobar

      This method opens the file being written by Pianobar, extracting out the most recent
      song information from the file.  This is a fairly ugly process, since tee-ing the
      streaming information is a combination of '\n' and '\r' characters.  There are also
      superfluous characters and whitespace used to designate the various segments of info.
      This parsed information is returned to the calling method.

      If any processing or parsing fails, this method will swallow the exception and simply
      return a None value.  I'm not terribly interested in trying to figure out _why_ the
      error happened, but I certainly want to make sure the caller can handle it.
    """
    try:
        p = subprocess.Popen(["grep", "|>", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        result = p.communicate()[0]
        output = result.split("\r")[-1].split("\n")[-2].replace("|>", "")
        output = re.sub("^.*?\"", "\"", output, 1)

        # Return None if the output doesn't contain "by"
        return output if "by" in output else None

    except Exception:
        return None

if __name__ == '__main__':
    sys.exit(main(sys.argv))
