# Learn Bash by Building a Boilerplate

This document contains my notes and command outputs while taking the FreeCodeCamp "Learn Bash by Building a Boilerplate" course.

It demonstrates the use of various Bash commands such as `ls`, `pwd`, `cd`, `touch`, `mkdir`, `cp`, `mv`, `rm`, `find`, and others.

Below is a step-by-step log of my work and learning progress.

---

<!-- Learn Bash by Building a Boilerplate
The terminal allows you to send text commands to your computer that can manipulate the file system, run programs, automate tasks, and much more.

In this 170-lesson course, you will learn terminal commands by creating a website boilerplate using only the command line.

Build a Boilerplate -->

echo hello terminal
pwd                           
#  path of the folder   "print working directory"
<!-- output: /workspace/project -->
ls                            
# show what's in folder 
cd freeCodeCamp               
# "change directory"  open this folder
pwd
<!-- output: /workspace/project/freeCodeCamp -->
ls
<!-- output: node_modules  package.json  package-lock.json  reset.sh  setup.sh  test          -->

# The folders are blue or green and the files include their extension.

cd test 
pwd
<!-- output: /workspace/project/freeCodeCamp/test -->
ls 
<!-- output: 1000.test.js  1120.test.js  1275.test.js  140.test.js   1530.test.js  260.test.js  40.test.js   560.test.js  700.test.js  880.test.js
100.test.js   1130.test.js  1280.test.js  1410.test.js  160.test.js   270.test.js  410.test.js  570.test.js  70.test.js   890.test.js
1010.test.js  1135.test.js  1290.test.js  1415.test.js  170.test.js   280.test.js  420.test.js  580.test.js  710.test.js  900.test.js
<!-- 1020.test.js  1150.test.js  1300.test.js  1420.test.js  180.test.js   285.test.js  430.test.js  585.test.js  720.test.js  90.test.js
1030.test.js  1170.test.js  130.test.js   1430.test.js  181.test.js   290.test.js  440.test.js  590.test.js  730.test.js  910.test.js
1040.test.js  1190.test.js  1310.test.js  1440.test.js  182.test.js   300.test.js  450.test.js  5.test.js    740.test.js  920.test.js
1050.test.js  1195.test.js  1315.test.js  1445.test.js  183.test.js   30.test.js   460.test.js  600.test.js  750.test.js  930.test.js
1055.test.js  1200.test.js  1320.test.js  1450.test.js  184.test.js   310.test.js  470.test.js  60.test.js   755.test.js  940.test.js
1060.test.js  120.test.js   1330.test.js  1460.test.js  185.test.js   320.test.js  480.test.js  610.test.js  760.test.js  950.test.js
1065.test.js  1210.test.js  1340.test.js  1470.test.js  190.test.js   330.test.js  490.test.js  620.test.js  770.test.js  960.test.js
1070.test.js  1215.test.js  1350.test.js  1475.test.js  200.test.js   340.test.js  500.test.js  630.test.js  780.test.js  970.test.js
1080.test.js  1220.test.js  1360.test.js  1480.test.js  20.test.js    350.test.js  50.test.js   640.test.js  790.test.js  980.test.js
1090.test.js  1230.test.js  1370.test.js  1490.test.js  210.test.js   360.test.js  510.test.js  650.test.js  800.test.js  990.test.js
10.test.js    1240.test.js  1380.test.js  1500.test.js  220.test.js   370.test.js  520.test.js  660.test.js  80.test.js   utils.js
1100.test.js  1250.test.js  1390.test.js  150.test.js   230.test.js   380.test.js  530.test.js  670.test.js  850.test.js
110.test.js   1260.test.js  1400.test.js  1510.test.js  240.test.js   390.test.js  540.test.js  680.test.js  860.test.js
1110.test.js  1270.test.js  1405.test.js  1520.test.js  250.test.js   400.test.js  550.test.js  690.test.js  870.test.js --> -->

cd ..                                            
# will take me back one level go to the freeCodeCamp here

more package.json                                
# what's in a file package.json here
<!-- output: 
{
  "name": "freecodecamp",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "programmatic-test": "mocha --config .mocharc.json",
    "test": "mocha --config .mocharc.json"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "mocha": "^7.2.0",
    "mocha-tap-reporter": "^0.1.3",
    "shell-quote": "^1.7.2"
  }
} -->

clear                                             
# cleared the terminal 
cd node_modules
ls
<!-- output: 
ansi-colors        diff                  inherits                 mocha-tap-reporter                shell-quote
ansi-regex         emoji-regex           is-binary-path           ms                                sprintf-js
ansi-styles        es-abstract           is-buffer                node-environment-flags            string.prototype.trimend
anymatch           escape-string-regexp  is-callable              normalize-path                    string.prototype.trimstart
argparse           esprima               is-date-object           object.assign                     string-width
balanced-match     es-to-primitive       isexe                    object.getownpropertydescriptors  strip-ansi
binary-extensions  fill-range            is-extglob               object-inspect                    strip-json-comments
brace-expansion    find-up               is-fullwidth-code-point  object-keys                       supports-color
braces             flat                  is-glob                  once                              to-regex-range
browser-stdout     fs.realpath           is-number                path-exists                       which
camelcase          function-bind         is-regex                 path-is-absolute                  which-module
chalk              get-caller-file       is-symbol                picomatch                         wide-align
chokidar           glob                  js-yaml                  p-limit                           wrap-ansi
cliui              glob-parent           locate-path              p-locate                          wrappy
color-convert      growl                 lodash                   p-try                             y18n
color-name         has                   log-symbols              readdirp                          yargs
concat-map         has-flag              minimatch                require-directory                 yargs-parser
debug              has-symbols           minimist                 require-main-filename             yargs-unparser
decamelize         he                    mkdirp                   semver
define-properties  inflight              mocha                    set-blocking -->

ls -l                                                       
# "long list format"  -l is a flag It is showing more details about each item in here and it's a little easier to read.
<!-- output 
total 80
drwxr-xr-x  3 gitpod gitpod   105 Jun 12 09:18 ansi-colors
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 ansi-regex
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 ansi-styles
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 anymatch
drwxr-xr-x  3 gitpod gitpod   105 Jun 12 09:18 argparse
drwxr-xr-x  2 gitpod gitpod    95 Jun 12 09:18 balanced-match
drwxr-xr-x  2 gitpod gitpod   157 Jun 12 09:18 binary-extensions
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 brace-expansion
drwxr-xr-x  3 gitpod gitpod   105 Jun 12 09:18 braces
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 browser-stdout
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 camelcase
drwxr-xr-x  4 gitpod gitpod   148 Jun 12 09:18 chalk
drwxr-xr-x  4 gitpod gitpod    98 Jun 12 09:18 chokidar
drwxr-xr-x  3 gitpod gitpod   118 Jun 12 09:18 cliui
drwxr-xr-x  2 gitpod gitpod   132 Jun 12 09:18 color-convert
drwxr-xr-x  2 gitpod gitpod   129 Jun 12 09:18 color-name
drwxr-xr-x  4 gitpod gitpod   126 Jun 12 09:18 concat-map
drwxr-xr-x  4 gitpod gitpod   116 Jun 12 09:18 debug
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 decamelize
drwxr-xr-x  3 gitpod gitpod   181 Jun 12 09:18 define-properties
drwxr-xr-x  4 gitpod gitpod   163 Jun 12 09:18 diff
drwxr-xr-x  3 gitpod gitpod   129 Jun 12 09:18 emoji-regex
drwxr-xr-x 12 gitpod gitpod  4096 Jun 12 09:18 es-abstract
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 escape-string-regexp
drwxr-xr-x  4 gitpod gitpod   102 Jun 12 09:18 esprima
drwxr-xr-x  5 gitpod gitpod  4096 Jun 12 09:18 es-to-primitive
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 fill-range
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 find-up
drwxr-xr-x  3 gitpod gitpod   119 Jun 12 09:18 flat
drwxr-xr-x  2 gitpod gitpod    88 Jun 12 09:18 fs.realpath
drwxr-xr-x  3 gitpod gitpod  4096 Jun 12 09:18 function-bind
drwxr-xr-x  2 gitpod gitpod   115 Jun 12 09:18 get-caller-file
drwxr-xr-x  2 gitpod gitpod   125 Jun 12 09:18 glob
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 glob-parent
drwxr-xr-x  3 gitpod gitpod   155 Jun 12 09:18 growl
drwxr-xr-x  4 gitpod gitpod    85 Jun 12 09:18 has
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 has-flag
drwxr-xr-x  4 gitpod gitpod   173 Jun 12 09:18 has-symbols
drwxr-xr-x  4 gitpod gitpod   101 Jun 12 09:18 he
drwxr-xr-x  2 gitpod gitpod    77 Jun 12 09:18 inflight
drwxr-xr-x  2 gitpod gitpod   104 Jun 12 09:18 inherits
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 is-binary-path
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 is-buffer
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 is-callable
drwxr-xr-x  4 gitpod gitpod   175 Jun 12 09:18 is-date-object
drwxr-xr-x  3 gitpod gitpod   137 Jun 12 09:18 isexe
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 is-extglob
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 is-fullwidth-code-point
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 is-glob
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 is-number
drwxr-xr-x  4 gitpod gitpod   178 Jun 12 09:18 is-regex
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 is-symbol
drwxr-xr-x  5 gitpod gitpod   128 Jun 12 09:18 js-yaml
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 locate-path
drwxr-xr-x  3 gitpod gitpod 20480 Jun 12 09:18 lodash
drwxr-xr-x  2 gitpod gitpod   110 Jun 12 09:18 log-symbols
drwxr-xr-x  2 gitpod gitpod    78 Jun 12 09:18 minimatch
drwxr-xr-x  4 gitpod gitpod   126 Jun 12 09:18 minimist
drwxr-xr-x  3 gitpod gitpod    91 Jun 12 09:18 mkdirp
drwxr-xr-x  5 gitpod gitpod   187 Jun 12 09:18 mocha
drwxr-xr-x  3 gitpod gitpod    70 Jun 12 09:18 mocha-tap-reporter
drwxr-xr-x  2 gitpod gitpod    77 Jun 12 09:18 ms
drwxr-xr-x  2 gitpod gitpod   151 Jun 12 09:18 node-environment-flags
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 normalize-path
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 object.assign
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 object.getownpropertydescriptors
drwxr-xr-x  5 gitpod gitpod  4096 Jun 12 09:18 object-inspect
drwxr-xr-x  3 gitpod gitpod  4096 Jun 12 09:18 object-keys
drwxr-xr-x  2 gitpod gitpod    73 Jun 12 09:18 once
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 path-exists
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 path-is-absolute
drwxr-xr-x  3 gitpod gitpod   105 Jun 12 09:18 picomatch
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 p-limit
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 p-locate
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 p-try
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 readdirp
drwxr-xr-x  2 gitpod gitpod   134 Jun 12 09:18 require-directory
drwxr-xr-x  2 gitpod gitpod    98 Jun 12 09:18 require-main-filename
drwxr-xr-x  3 gitpod gitpod   123 Jun 12 09:18 semver
drwxr-xr-x  2 gitpod gitpod    98 Jun 12 09:18 set-blocking
drwxr-xr-x  4 gitpod gitpod   146 Jun 12 09:18 shell-quote
drwxr-xr-x  6 gitpod gitpod   161 Jun 12 09:18 sprintf-js
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 string.prototype.trimend
drwxr-xr-x  4 gitpod gitpod  4096 Jun 12 09:18 string.prototype.trimstart
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 string-width
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 strip-ansi
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 strip-json-comments
drwxr-xr-x  2 gitpod gitpod    92 Jun 12 09:18 supports-color
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 to-regex-range
drwxr-xr-x  3 gitpod gitpod   105 Jun 12 09:18 which
drwxr-xr-x  2 gitpod gitpod    94 Jun 12 09:18 which-module
drwxr-xr-x  2 gitpod gitpod    74 Jun 12 09:18 wide-align
drwxr-xr-x  3 gitpod gitpod    94 Jun 12 09:18 wrap-ansi
drwxr-xr-x  2 gitpod gitpod    75 Jun 12 09:18 wrappy
drwxr-xr-x  2 gitpod gitpod    94 Jun 12 09:18 y18n
drwxr-xr-x  5 gitpod gitpod   156 Jun 12 09:18 yargs
drwxr-xr-x  3 gitpod gitpod   109 Jun 12 09:18 yargs-parser
drwxr-xr-x  2 gitpod gitpod    94 Jun 12 09:18 yargs-unparser -->

cd has 
ls
<!-- output: LICENSE-MIT  package.json  README.md  src  test -->
more README.md
<!-- output: # has

> Object.prototype.hasOwnProperty.call shortcut

## Installation

```sh
npm install --save has
```

## Usage

```js
var has = require('has');

has({}, 'hasOwnProperty'); // false
has(Object.prototype, 'hasOwnProperty'); // true
``` -->

more LICENSE-MIT
# this file doesn't appear to have an extension looked more 
<!-- output: Copyright (c) 2013 Thiago de Arruda

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE. -->
cd src 
pwd
<!-- output: /workspace/project/freeCodeCamp/node_modules/has/src -->
ls
<!-- output: index.js -->
more index.js
<!-- output: 'use strict';

var bind = require('function-bind');

module.exports = bind.call(Function.call, Object.prototype.hasOwnProperty); -->
cd ..
cd ..
cd ../..  
# will take me back two level (Go back to the project directory from the node_modules here)
clear

# I will be making a website boilerplate.
mkdir website 
# "make directory" make a new folder 
ls
<!-- output: freeCodeCamp  website -->
cd website
# it's folder empty yet 
echo hello website
touch index.html
# create new file 
touch styles.css
ls
<!-- output: index.html  styles.css -->
touch index.js
touch .gitignore 
# turn this into a git repository
ls
<!-- output: index.html  index.js  styles.css -->

ls --help

<!-- output: Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      with -l, scale sizes by SIZE when printing them;
                               e.g., '--block-size=M'; see SIZE format below
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information);
                               with -l: show ctime and sort by name;
                               otherwise: sort by ctime, newest first
  -C                         list entries by columns
      --color[=WHEN]         colorize the output; WHEN can be 'always' (default
                               if omitted), 'auto', or 'never'; more info below
  -d, --directory            list directories themselves, not their contents
  -D, --dired                generate output designed for Emacs' dired mode
  -f                         do not sort, enable -aU, disable -ls --color
  -F, --classify             append indicator (one of */=>@|) to entries
      --file-type            likewise, except do not append '*'
      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
      --full-time            like -l --time-style=full-iso
  -g                         like -l, but do not list owner
      --group-directories-first
                             group directories before files;
                               can be augmented with a --sort option, but any
                               use of --sort=none (-U) disables grouping
  -G, --no-group             in a long listing, don't print group names
  -h, --human-readable       with -l and -s, print sizes like 1K 234M 2G etc.
      --si                   likewise, but use powers of 1000 not 1024
  -H, --dereference-command-line
                             follow symbolic links listed on the command line
      --dereference-command-line-symlink-to-dir
                             follow each command line symbolic link
                               that points to a directory
      --hide=PATTERN         do not list implied entries matching shell PATTERN
                               (overridden by -a or -A)
      --hyperlink[=WHEN]     hyperlink file names; WHEN can be 'always'
                               (default if omitted), 'auto', or 'never'
      --indicator-style=WORD  append indicator with style WORD to entry names:
                               none (default), slash (-p),
                               file-type (--file-type), classify (-F)
  -i, --inode                print the index number of each file
  -I, --ignore=PATTERN       do not list implied entries matching shell PATTERN
  -k, --kibibytes            default to 1024-byte blocks for disk usage;
                               used only with -s and per directory totals
  -l                         use a long listing format
  -L, --dereference          when showing file information for a symbolic
                               link, show information for the file the link
                               references rather than for the link itself
  -m                         fill width with a comma separated list of entries
  -n, --numeric-uid-gid      like -l, but list numeric user and group IDs
  -N, --literal              print entry names without quoting
  -o                         like -l, but do not list group information
  -p, --indicator-style=slash
                             append / indicator to directories
  -q, --hide-control-chars   print ? instead of nongraphic characters
      --show-control-chars   show nongraphic characters as-is (the default,
                               unless program is 'ls' and output is a terminal)
  -Q, --quote-name           enclose entry names in double quotes
      --quoting-style=WORD   use quoting style WORD for entry names:
                               literal, locale, shell, shell-always,
                               shell-escape, shell-escape-always, c, escape
                               (overrides QUOTING_STYLE environment variable)
  -r, --reverse              reverse order while sorting
  -R, --recursive            list subdirectories recursively
  -s, --size                 print the allocated size of each file, in blocks
  -S                         sort by file size, largest first
      --sort=WORD            sort by WORD instead of name: none (-U), size (-S),
                               time (-t), version (-v), extension (-X)
      --time=WORD            change the default of using modification times;
                               access time (-u): atime, access, use;
                               change time (-c): ctime, status;
                               birth time: birth, creation;
                             with -l, WORD determines which time to show;
                             with --sort=time, sort by WORD (newest first)
      --time-style=TIME_STYLE  time/date format with -l; see TIME_STYLE below
  -t                         sort by time, newest first; see --time
  -T, --tabsize=COLS         assume tab stops at each COLS instead of 8
  -u                         with -lt: sort by, and show, access time;
                               with -l: show access time and sort by name;
                               otherwise: sort by access time, newest first
  -U                         do not sort; list entries in directory order
  -v                         natural sort of (version) numbers within text
  -w, --width=COLS           set output width to COLS.  0 means no limit
  -x                         list entries by lines instead of by columns
  -X                         sort alphabetically by entry extension
  -Z, --context              print any security context of each file
  -1                         list one file per line.  Avoid '\n' with -q or -b
      --help     display this help and exit
      --version  output version information and exit

The SIZE argument is an integer and optional unit (example: 10K is 10*1024).
Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000).
Binary prefixes can be used, too: KiB=K, MiB=M, and so on.

The TIME_STYLE argument can be full-iso, long-iso, iso, locale, or +FORMAT.
FORMAT is interpreted like in date(1).  If FORMAT is FORMAT1<newline>FORMAT2,
then FORMAT1 applies to non-recent files and FORMAT2 to recent files.
TIME_STYLE prefixed with 'posix-' takes effect only outside the POSIX locale.
Also the TIME_STYLE environment variable sets the default style to use.

Using color to distinguish file types is disabled both by default and
with --color=never.  With --color=auto, ls emits color codes only when
standard output is connected to a terminal.  The LS_COLORS environment
variable can change the settings.  Use the dircolors command to set it.

Exit status:
 0  if OK,
 1  if minor problems (e.g., cannot access subdirectory),
 2  if serious trouble (e.g., cannot access command-line argument).

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/ls>
or available locally via: info '(coreutils) ls invocation' -->

# -a, --all                  do not ignore entries starting with .
ls --all
<!-- output: .  ..  .gitignore  index.html  index.js  styles.css -->
touch background.jpg
touch header.png
touch footer.jpeg
ls
<!-- output: background.jpg  footer.jpeg  header.png  index.html  index.js  styles.css -->
# Looks like images show up in pink.
touch roboto.font 
touch lato.font     
# created fonts roboto.font and lato.font and menlo.font
touch menlo.font
ls
<!-- output: background.jpg  footer.jpeg  header.png  index.html  index.js  lato.font  menlo.font  roboto.font  styles.css -->
touch CodeAlly.svg
touch CodeRoad.svg
touch freeCodeCamp.svg
ls
<!-- output: background.jpg  CodeRoad.svg  freeCodeCamp.svg  index.html  lato.font   roboto.font
CodeAlly.svg    footer.jpeg   header.png        index.js    menlo.font  styles.css -->
# the images should go in a separate folder to clean it up a little
mkdir images 
# created new folder 
ls
<!-- output: background.jpg  CodeRoad.svg  freeCodeCamp.svg  images      index.js   menlo.font   styles.css
CodeAlly.svg    footer.jpeg   header.png        index.html  lato.font  roboto.font -->
#  new images folder. It's blue. 
cp background.jpg images 
# "copy" file to another folder 
cd images
ls
<!-- output: background.jpg -->
cd ..
rm background.jpg 
# remove file the (same that delete)
cp header.png images
cp footer.jpeg images
cd images
ls
<!-- output: background.jpg  footer.jpeg  header.png -->
cd ..
rm header.png
rm footer.jpeg
ls
<!-- output: CodeAlly.svg  CodeRoad.svg  freeCodeCamp.svg  images  index.html  index.js  lato.font  menlo.font  roboto.font  styles.css -->
mv roboto.font roboto.woff
# "move" rename oe move something 
mv lato.font lato.ttf
mv menlo.font menlo.otf 
ls
<!-- output: CodeAlly.svg  CodeRoad.svg  freeCodeCamp.svg  images  index.html  index.js  lato.ttf  menlo.otf  roboto.woff  styles.css -->
mkdir fonts
mv roboto.woff fonts
# move the file becouse fount is foldef 

find
#  use find to find things or view a file tree. here in website
<!-- output:
.
./index.html
./styles.css
./index.js
./.gitignore
./CodeAlly.svg
./CodeRoad.svg
./freeCodeCamp.svg
./images
./images/background.jpg
./images/header.png
./images/footer.jpeg
./lato.ttf
./menlo.otf
./fonts
./fonts/roboto.woff -->

mv lato.ttf fonts
mv menlo.otf fonts
find
<!-- output:
.
./index.html
./styles.css
./index.js
./.gitignore
./CodeAlly.svg
./CodeRoad.svg
./freeCodeCamp.svg
./images
./images/background.jpg
./images/header.png
./images/footer.jpeg
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf -->

mkdir client
mkdir client/src 
# created new folder in the existing folder
mv index.html client/src 
# move files all the way across the system from here with the right path
find
<!-- output:
.
./styles.css
./index.js
./.gitignore
./CodeAlly.svg
./CodeRoad.svg
./freeCodeCamp.svg
./images
./images/background.jpg
./images/header.png
./images/footer.jpeg
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html -->

mv index.js client/src
mv styles.css client/src
find
<!-- output:
.
./.gitignore
./CodeAlly.svg
./CodeRoad.svg
./freeCodeCamp.svg
./images
./images/background.jpg
./images/header.png
./images/footer.jpeg
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html
./client/src/index.js
./client/src/styles.css -->
find client
# display the tree of a different folder
<!-- output:
client
client/src
client/src/index.html
client/src/index.js
client/src/styles.css -->

find --help
<!-- output: Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]

default path is the current directory; default expression is -print
expression may consist of: operators, options, tests, and actions:
operators (decreasing precedence; -and is implicit where no others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2
positional options (always true): -daystart -follow -regextype

normal options (always true, specified before other expressions):
      -depth --help -maxdepth LEVELS -mindepth LEVELS -mount -noleaf
      --version -xdev -ignore_readdir_race -noignore_readdir_race
tests (N can be +N or -N or N): -amin N -anewer FILE -atime N -cmin N
      -cnewer FILE -ctime N -empty -false -fstype TYPE -gid N -group NAME
      -ilname PATTERN -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      -readable -writable -executable
      -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      -used N -user NAME -xtype [bcdpfls]      -context CONTEXT

actions: -delete -print0 -printf FORMAT -fprintf FILE FORMAT -print 
      -fprint0 FILE -fprint FILE -ls -fls FILE -prune -quit
      -exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;
      -execdir COMMAND ; -execdir COMMAND {} + -okdir COMMAND ;

Valid arguments for -D:
exec, opt, rates, search, stat, time, tree, all, help
Use '-D help' for a description of the options, or see find(1)

Please see also the documentation at https://www.gnu.org/software/findutils/.
You can report (and track progress on fixing) bugs in the "find"
program via the GNU findutils bug-reporting page at
https://savannah.gnu.org/bugs/?group=findutils or, if
you have no web access, by sending email to <bug-findutils@gnu.org>. -->

find -name index.html 
# search the file
<!-- output:
./client/src/index.html -->

find -name styles.css
<!-- output
./client/src/styles.css -->
find -name src
<!-- output: ./client/src -->
cd client
mkdir assets
cd assets
mkdir images
cd images
touch background.jpg
cd ../../..
cd images
ls
<!-- output: background.jpg  footer.jpeg  header.png -->
mv header.png .. 
# move on one level up (here website)
cd .. 
find -name images
<!-- output:
./images
./client/assets/images -->
mv header.png client/assets/images
find -name header.png
<!-- output: ./client/assets/images/header.png -->
find -name footer.jpeg
<!-- output: ./images/footer.jpeg -->
mv images/footer.jpeg client/assets/images
find
<!-- output: 
.
./.gitignore
./CodeAlly.svg
./CodeRoad.svg
./freeCodeCamp.svg
./images
./images/background.jpg
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html
./client/src/index.js
./client/src/styles.css
./client/assets
./client/assets/images
./client/assets/images/background.jpg
./client/assets/images/header.png
./client/assets/images/footer.jpeg -->
rmdir images 
<!-- output: rmdir: failed to remove 'images': Directory not empty -->
rm images/background.jpg
rmdir images
ls
<!-- output: client  CodeAlly.svg  CodeRoad.svg  fonts  freeCodeCamp.svg -->
mkdir client/assets/icons
mv CodeAlly.svg client/assets/icons
find
<!-- output: 
.
./.gitignore
./CodeRoad.svg
./freeCodeCamp.svg
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html
./client/src/index.js
./client/src/styles.css
./client/assets
./client/assets/images
./client/assets/images/background.jpg
./client/assets/images/header.png
./client/assets/images/footer.jpeg
./client/assets/icons
./client/assets/icons/CodeAlly.svg
./icons -->
mv CodeRoad.svg client/assets/icons
mv freeCodeCamp.svg client/assets/icons
find
<!-- output:
.
./.gitignore
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html
./client/src/index.js
./client/src/styles.css
./client/assets
./client/assets/images
./client/assets/images/background.jpg
./client/assets/images/header.png
./client/assets/images/footer.jpeg
./client/assets/icons
./client/assets/icons/CodeAlly.svg
./client/assets/icons/CodeRoad.svg
./client/assets/icons/freeCodeCamp.svg
./icons -->
mkdir client/assets/fonts
touch client/assets/fonts/roboto-bold.woff
touch client/assets/fonts/roboto-light.woff
find client/assets/fonts
<!-- output:
client/assets/fonts
client/assets/fonts/roboto-bold.woff
client/assets/fonts/roboto-light.woff -->
touch client/assets/fonts/lato-bold.ttf
touch client/assets/fonts/lato-light.ttf
find
<!-- output:
.
./.gitignore
./fonts
./fonts/roboto.woff
./fonts/lato.ttf
./fonts/menlo.otf
./client
./client/src
./client/src/index.html
./client/src/index.js
./client/src/styles.css
./client/assets
./client/assets/images
./client/assets/images/background.jpg
./client/assets/images/header.png
./client/assets/images/footer.jpeg
./client/assets/icons
./client/assets/icons/CodeAlly.svg
./client/assets/icons/CodeRoad.svg
./client/assets/icons/freeCodeCamp.svg
./client/assets/fonts
./client/assets/fonts/roboto-bold.woff
./client/assets/fonts/roboto-light.woff
./client/assets/fonts/lato-bold.ttf
./client/assets/fonts/lato-light.ttf
./icons -->
rm --help
<!-- output: Usage: rm [OPTION]... [FILE]...
Remove (unlink) the FILE(s).

  -f, --force           ignore nonexistent files and arguments, never prompt
  -i                    prompt before every removal
  -I                    prompt once before removing more than three files, or
                          when removing recursively; less intrusive than -i,
                          while still giving protection against most mistakes
      --interactive[=WHEN]  prompt according to WHEN: never, once (-I), or
                          always (-i); without WHEN, prompt always
      --one-file-system  when removing a hierarchy recursively, skip any
                          directory that is on a file system different from
                          that of the corresponding command line argument
      --no-preserve-root  do not treat '/' specially
      --preserve-root[=all]  do not remove '/' (default);
                              with 'all', reject any command line argument
                              on a separate device from its parent
  -r, -R, --recursive   remove directories and their contents recursively
  -d, --dir             remove empty directories
  -v, --verbose         explain what is being done
      --help     display this help and exit
      --version  output version information and exit

By default, rm does not remove directories.  Use the --recursive (-r or -R)
option to remove each listed directory, too, along with all of its contents.

To remove a file whose name starts with a '-', for example '-foo',
use one of these commands:
  rm -- -foo

  rm ./-foo

Note that if you use rm to remove a file, it might be possible to recover
some of its contents, given sufficient expertise and/or time.  For greater
assurance that the contents are truly unrecoverable, consider using shred.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/rm>
or available locally via: info '(coreutils) rm invocation' -->
rm -r fonts
ls
<!-- output:
client  icons -->
touch package.json
touch server.js
touch README.md
ls
<!-- output: client  icons  package.json  README.md  server.js -->
echo I made this boilerplate >> README.md
# print to a file instead of the terminal
more README.md
<!-- output: I made this boilerplate -->
echo from the command line >> README.md
echo for the freeCodeCamp bash lessons >> README.md
more README.md
<!-- output: I made this boilerplate
from the command line
for the freeCodeCamp bash lessons -->
cd ..
mv website website-boilerplate
ls
<!-- output: freeCodeCamp  website-boilerplate -->
cp --help
<!-- output: Usage: cp [OPTION]... [-T] SOURCE DEST
  or:  cp [OPTION]... SOURCE... DIRECTORY
  or:  cp [OPTION]... -t DIRECTORY SOURCE...
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY.

Mandatory arguments to long options are mandatory for short options too.
  -a, --archive                same as -dR --preserve=all
      --attributes-only        don't copy the file data, just the attributes
      --backup[=CONTROL]       make a backup of each existing destination file
  -b                           like --backup but does not accept an argument
      --copy-contents          copy contents of special files when recursive
  -d                           same as --no-dereference --preserve=links
  -f, --force                  if an existing destination file cannot be
                                 opened, remove it and try again (this option
                                 is ignored when the -n option is also used)
  -i, --interactive            prompt before overwrite (overrides a previous -n
                                  option)
  -H                           follow command-line symbolic links in SOURCE
  -l, --link                   hard link files instead of copying
  -L, --dereference            always follow symbolic links in SOURCE
  -n, --no-clobber             do not overwrite an existing file (overrides
                                 a previous -i option)
  -P, --no-dereference         never follow symbolic links in SOURCE
  -p                           same as --preserve=mode,ownership,timestamps
      --preserve[=ATTR_LIST]   preserve the specified attributes (default:
                                 mode,ownership,timestamps), if possible
                                 additional attributes: context, links, xattr,
                                 all
      --no-preserve=ATTR_LIST  don't preserve the specified attributes
      --parents                use full source file name under DIRECTORY
  -R, -r, --recursive          copy directories recursively
      --reflink[=WHEN]         control clone/CoW copies. See below
      --remove-destination     remove each existing destination file before
                                 attempting to open it (contrast with --force)
      --sparse=WHEN            control creation of sparse files. See below
      --strip-trailing-slashes  remove any trailing slashes from each SOURCE
                                 argument
  -s, --symbolic-link          make symbolic links instead of copying
  -S, --suffix=SUFFIX          override the usual backup suffix
  -t, --target-directory=DIRECTORY  copy all SOURCE arguments into DIRECTORY
  -T, --no-target-directory    treat DEST as a normal file
  -u, --update                 copy only when the SOURCE file is newer
                                 than the destination file or when the
                                 destination file is missing
  -v, --verbose                explain what is being done
  -x, --one-file-system        stay on this file system
  -Z                           set SELinux security context of destination
                                 file to default type
      --context[=CTX]          like -Z, or if CTX is specified then set the
                                 SELinux or SMACK security context to CTX
      --help     display this help and exit
      --version  output version information and exit

By default, sparse SOURCE files are detected by a crude heuristic and the
corresponding DEST file is made sparse as well.  That is the behavior
selected by --sparse=auto.  Specify --sparse=always to create a sparse DEST
file whenever the SOURCE file contains a long enough sequence of zero bytes.
Use --sparse=never to inhibit creation of sparse files.

When --reflink[=always] is specified, perform a lightweight copy, where the
data blocks are copied only when modified.  If this is not possible the copy
fails, or if --reflink=auto is specified, fall back to a standard copy.
Use --reflink=never to ensure a standard copy is performed.

The backup suffix is '~', unless set with --suffix or SIMPLE_BACKUP_SUFFIX.
The version control method may be selected via the --backup option or through
the VERSION_CONTROL environment variable.  Here are the values:

  none, off       never make backups (even if --backup is given)
  numbered, t     make numbered backups
  existing, nil   numbered if numbered backups exist, simple otherwise
  simple, never   always make simple backups

As a special case, cp makes a backup of SOURCE when the force and backup
options are given and SOURCE and DEST are the same name for an existing,
regular file.

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation <https://www.gnu.org/software/coreutils/cp>
or available locally via: info '(coreutils) cp invocation' -->
cp -r website-boilerplate toms-website
ls
<!-- output: freeCodeCamp  toms-website  website-boilerplate -->
find toms-website
<!-- output:
toms-website
toms-website/package.json
toms-website/server.js
toms-website/README.md
toms-website/.gitignore
toms-website/client
toms-website/client/src
toms-website/client/src/index.html
toms-website/client/src/styles.css
toms-website/client/src/index.js
toms-website/client/assets
toms-website/client/assets/fonts
toms-website/client/assets/fonts/roboto-light.woff
toms-website/client/assets/fonts/lato-bold.ttf
toms-website/client/assets/fonts/lato-light.ttf
toms-website/client/assets/fonts/roboto-bold.woff
toms-website/client/assets/images
toms-website/client/assets/images/background.jpg
toms-website/client/assets/images/header.png
toms-website/client/assets/images/footer.jpeg
toms-website/client/assets/icons
toms-website/client/assets/icons/CodeAlly.svg
toms-website/client/assets/icons/CodeRoad.svg
toms-website/client/assets/icons/freeCodeCamp.svg
toms-website/icons -->
find website-boilerplate
<!-- output: 
website-boilerplate
website-boilerplate/.gitignore
website-boilerplate/client
website-boilerplate/client/src
website-boilerplate/client/src/index.html
website-boilerplate/client/src/index.js
website-boilerplate/client/src/styles.css
website-boilerplate/client/assets
website-boilerplate/client/assets/images
website-boilerplate/client/assets/images/background.jpg
website-boilerplate/client/assets/images/header.png
website-boilerplate/client/assets/images/footer.jpeg
website-boilerplate/client/assets/icons
website-boilerplate/client/assets/icons/CodeAlly.svg
website-boilerplate/client/assets/icons/CodeRoad.svg
website-boilerplate/client/assets/icons/freeCodeCamp.svg
website-boilerplate/client/assets/fonts
website-boilerplate/client/assets/fonts/roboto-bold.woff
website-boilerplate/client/assets/fonts/roboto-light.woff
website-boilerplate/client/assets/fonts/lato-bold.ttf
website-boilerplate/client/assets/fonts/lato-light.ttf
website-boilerplate/icons
website-boilerplate/package.json
website-boilerplate/server.js
website-boilerplate/README.md -->