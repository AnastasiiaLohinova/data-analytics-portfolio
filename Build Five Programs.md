# In this 220-lesson course, you will learn more terminal commands and how to use them within Bash scripts by creating five small programs.
echo hello bash
# questionnaire.sh
touch questionnaire.sh
sh questionnaire.sh
# output text from questionnaire.sh file (run the script) 
<!-- output: hello questionnaire -->
bash questionnaire.sh
# bourne-again shell
<!-- output: hello questionnaire -->
which bash
<!-- output: /usr/bin/bash -->
./questionnaire.sh
<!-- output: bash: ./questionnaire.sh: Permission denied -->
ls -l
<!-- output:
total 4
-rw-r--r-- 1 gitpod gitpod 38 Jun 16 12:22 questionnaire.sh -->
chmod +x questionnaire.sh
ls -l
<!-- output:
total 4
-rwxr-xr-x 1 gitpod gitpod 38 Jun 16 12:22 questionnaire.sh -->
./questionnaire.sh
<!-- output:
hello questionnaire -->
./questionnaire.sh
<!-- output:
hello questionnaire
total 4
-rwxr-xr-x 1 gitpod gitpod 43 Jun 16 12:35 questionnaire.sh -->
./questionnaire.sh
<!-- output:
What's your name? -->
./questionnaire.sh
<!-- output:
What's your name?
Anastasiia            
# I printed my name
Hello Anastasiia. -->
./questionnaire.sh
<!-- output:
What's your name?
Anastasiia                # I printed
Hello Anastasiia.
Where are you from?
Lviv                      # I printed
Hello Anastasiia from Lviv. -->
./questionnaire.sh
<!-- output:
~~ Questionnaire ~~
What's your name?
Anastasiia
Hello Anastasiia.
Where are you from?
Lviv
Hello Anastasiia from Lviv. -->
./questionnaire.sh
<!-- output:

~~ Questionnaire ~~

What's your name?
Anastasiia
Hello Anastasiia.
Where are you from?
Lviv
Hello Anastasiia from Lviv. -->
./questionnaire.sh
<!-- 
~~ Questionnaire ~~

What's your name?
Anastasiia
Hello Anastasiia.
Where are you from?
Lviv
Hello Anastasiia from Lviv.
What's your favorite coding website?
FreeCodeCamp
Hello Anastasiia from Lviv. I learned that your favorite coding website is FreeCodeCamp! -->


# countdown.sh
touch countdown.sh
./countdown.sh arg1 arg2 arg3 
<!-- output:
arg1 arg2 arg3 -->
./countdown.sh arg1 arg2 arg3
<!-- output:
arg1 -->
help if
<!-- if: if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi
    Execute commands based on conditional.
    
    The `if COMMANDS' list is executed.  If its exit status is zero, then the
    `then COMMANDS' list is executed.  Otherwise, each `elif COMMANDS' list is
    executed in turn, and if its exit status is zero, the corresponding
    `then COMMANDS' list is executed and the if command completes.  Otherwise,
    the `else COMMANDS' list is executed, if present.  The exit status of the
    entire construct is the exit status of the last command executed, or zero
    if no condition tested true.
    
    Exit Status:
    Returns the status of the last command executed. -->
./countdown.sh arg1
<!-- output:
true -->
./countdown.sh dasa
<!-- output:
false -->
./countdown.sh 4
<!-- output:
true -->
./countdown.sh 5
<!-- output:
false -->
help [[ expression ]]
<!-- [[ ... ]]: [[ expression ]]
    Execute conditional command.
    
    Returns a status of 0 or 1 depending on the evaluation of the conditional
    expression EXPRESSION.  Expressions are composed of the same primaries used
    by the `test' builtin, and may be combined using the following operators:
    
      ( EXPRESSION )    Returns the value of EXPRESSION
      ! EXPRESSION              True if EXPRESSION is false; else false
      EXPR1 && EXPR2    True if both EXPR1 and EXPR2 are true; else false
      EXPR1 || EXPR2    True if either EXPR1 or EXPR2 is true; else false
    
    When the `==' and `!=' operators are used, the string to the right of
    the operator is used as a pattern and pattern matching is performed.
    When the `=~' operator is used, the string to the right of the operator
    is matched as a regular expression.
    
    The && and || operators do not evaluate EXPR2 if EXPR1 is sufficient to
    determine the expression's value.
    
    Exit Status:
    0 or 1 depending on value of EXPRESSION. -->
help test
<!-- test: test [expr]
    Evaluate conditional expression.
    
    Exits with a status of 0 (true) or 1 (false) depending on
    the evaluation of EXPR.  Expressions may be unary or binary.  Unary
    expressions are often used to examine the status of a file.  There
    are string operators and numeric comparison operators as well.
    
    The behavior of test depends on the number of arguments.  Read the
    bash manual page for the complete specification.
    
    File operators:
    
      -a FILE        True if file exists.
      -b FILE        True if file is block special.
      -c FILE        True if file is character special.
      -d FILE        True if file is a directory.
      -e FILE        True if file exists.
      -f FILE        True if file exists and is a regular file.
      -g FILE        True if file is set-group-id.
      -h FILE        True if file is a symbolic link.
      -L FILE        True if file is a symbolic link.
      -k FILE        True if file has its `sticky' bit set.
      -p FILE        True if file is a named pipe.
      -r FILE        True if file is readable by you.
      -s FILE        True if file exists and is not empty.
      -S FILE        True if file is a socket.
      -t FD          True if FD is opened on a terminal.
      -u FILE        True if the file is set-user-id.
      -w FILE        True if the file is writable by you.
      -x FILE        True if the file is executable by you.
      -O FILE        True if the file is effectively owned by you.
      -G FILE        True if the file is effectively owned by your group.
      -N FILE        True if the file has been modified since it was last read.
    
      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).
    
      FILE1 -ot FILE2  True if file1 is older than file2.
    
      FILE1 -ef FILE2  True if file1 is a hard link to file2.
    
    All file operators except -h and -L are acting on the target of a symbolic
    link, not on the symlink itself, if FILE is a symbolic link.
    
    String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.
    
    Other operators:
    
      -o OPTION      True if the shell option OPTION is enabled.
      -v VAR         True if the shell variable VAR is set.
      -R VAR         True if the shell variable VAR is set and is a name
                     reference.
      ! EXPR         True if expr is false.
      EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
      EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.
    
      arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                     -lt, -le, -gt, or -ge.
    
    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.
    
    See the bash manual page bash(1) for the handling of parameters (i.e.
    missing parameters).
    
    Exit Status:
    Returns success if EXPR evaluates to true; fails if EXPR evaluates to
    false or an invalid argument is given. -->
./countdown.sh 5
<!-- output: true -->
camper: /project$ [[ 4 -le 5 ]]
camper: /project$ echo $?
<!--output:  0 --> 
# it means true 
camper: /project$ [[ 4 -ge 5 ]]
camper: /project$ echo $?
<!-- output: 1 -->
# it means false
[[ 4 -ge 5 ]]; echo $?
<!-- output: 1 --> 
[[ 10 -ne 5 ]]; echo $?
<!--output:  0 -->  
bad_command; echo $?
<!-- output:
bash: bad_command: command not found
127 -->
# command not found, with an exit status of 127. Anything but 0 means there was an error with the command. bad_command didn't exist.
ls; echo $?
<!-- output:
countdown.sh  questionnaire.sh
0 -->
ls -y; echo $?
<!-- output:
ls: invalid option -- 'y'
Try 'ls --help' for more information.
2 -->
[[ -a countdown.sh ]]; echo $?
# -a FILE        True if file exists.
<!-- output: 0 -->
# -x FILE        True if the file is executable by you.
[[ -x countdown.sh ]]; echo $?
<!-- output: 0 -->
 [[ -x countdown.sh && 5 -le 4 ]]; echo $?
<!-- output: 1 -->
[[ -x countdown.sh || 5 -le 4 ]]; echo $?
<!-- output: 0 --> 
./countdown.sh 1
<!-- output: true -->
./countdown.sh 0
<!-- output: Include a positive integer as the first argument. -->
./countdown.sh 10
<!-- output:
10
9
8
7
6
5
4
3
2
1 -->
./countdown.sh 3
<!-- output: whith pause 1 sec
3
2
1 -->
./countdown.sh 1
<!-- output: 

~~ Countdown Timer ~~

1
0 -->
help while
<!-- while: while COMMANDS; do COMMANDS; done
    Execute commands as long as a test succeeds.
    
    Expand and execute COMMANDS as long as the final command in the
    `while' COMMANDS has an exit status of zero.
    
    Exit Status:
    Returns the status of the last command executed. -->
./countdown.sh 5
<!-- 
~~ Countdown Timer ~~

5
4
3
2
1
0 -->


# bingo.sh
touch bingo.sh 
chmod +x bingo.sh
./bingo.sh
<!-- output: 

~~ Bingo Number Generator ~~

5 -->

printenv 
<!-- 
output:
GP_PREVIEW_BROWSER=/ide/bin/remote-cli/gitpod-code --preview
COLORTERM=truecolor
TERM_PROGRAM_VERSION=1.100.2
GITPOD_CPU_COUNT=1
SUPERVISOR_ADDR=localhost:22999
HOSTNAME=freecodecam-learnbashsc-t3xxwshoeaq
GITPOD_REPO_ROOT=/workspace/project
WORKSPACEKIT_WRAP_NETNS=true
GITPOD_ANALYTICS_WRITER=segment
TRIGGER_REBUILD=1
THEIA_RATELIMIT_LOG=50
EDITOR=/ide/bin/remote-cli/gitpod-code
QTWEBENGINE_DISABLE_SANDBOX=1
GITPOD_WORKSPACE_CLASS_INFO={"id":"g1-standard","category":"GENERAL PURPOSE","displayName":"Standard","description":"Up to 4 cores, 8GB RAM, 30GB storage","powerups":1,"isDefault":true,"deprecated":false}
PWD=/workspace/project
THEIA_WORKSPACE_ROOT=/workspace/project
GITPOD_PREVENT_METADATA_ACCESS=true
GP_OPEN_EDITOR=/ide/bin/remote-cli/gitpod-code
PNPM_HOME=/home/gitpod/.pnpm
GP_EXTERNAL_BROWSER=/ide/bin/remote-cli/gitpod-code --openExternal
VSCODE_GIT_ASKPASS_NODE=/ide/node
GITPOD_OWNER_ID=8f38407e-2eb5-49fb-9c9f-2d1b6cd5cc28
HOME=/home/gitpod
LANG=en_US.UTF-8
GITPOD_WORKSPACE_ID=freecodecam-learnbashsc-t3xxwshoeaq
GITPOD_INTERVAL=30000
GITPOD_CODE_HOST=gitpod.io
HISTFILE=/workspace/.bash_history
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
CODEROAD_WEBHOOK_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOiJtYVR4ejNNYXZkdXNkb2Q2QlBUSElGOVR6MGl6eVB4dnBKYUhHNEVJSGNXS3hVUE05VVNwTm1HN3Z0VkM3Sjg1IiwiaWF0IjoxNzUwMDczOTI2fQ.7QqIQ7vCjQjNEfPiHLsboFG03XdsRtVjFy3nQ7PcorE
GITPOD_SSH_CA_PUBLIC_KEY=ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMQPGLZ5GCM03ISbMVdPZE9YO3KjbXcaxpdcUNPRNnbJ Gitpod-CA
GITPOD_WORKSPACE_CONTEXT_URL=https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs
THEIA_MINI_BROWSER_HOST_PATTERN=browser-{{hostname}}
GIT_ASKPASS=/ide/extensions/git/dist/askpass.sh
PROMPT_COMMAND=__vsc_prompt_cmd_original
GITPOD_WORKSPACE_CLASS=g1-standard
GITPOD_INSTANCE_ID=fff5cb06-2970-4c5b-b5c1-17c84db3245b
THEIA_WEBVIEW_EXTERNAL_ENDPOINT=webview-{{hostname}}
GITPOD_REPO_ROOTS=/workspace/project
GITPOD_IS_SET_JAVA_XMX=false
GITPOD_DISABLE_JETBRAINS_LOCAL_PORT_FORWARDING=false
GITPOD_WORKSPACE_URL=https://freecodecam-learnbashsc-t3xxwshoeaq.ws-eu120.gitpod.io
GITPOD_THEIA_PORT=23000
VSCODE_GIT_ASKPASS_EXTRA_ARGS=
GITPOD_WORKSPACE_CONTEXT={"isFile":false,"path":"","title":"freeCodeCamp/learn-bash-scripting-by-building-five-programs - main","ref":"main","refType":"branch","revision":"84988b9eb3c1f6ec24770309af32c32e6f4b25f8","repository":{"cloneUrl":"https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs.git","host":"github.com","defaultBranch":"main","name":"learn-bash-scripting-by-building-five-programs","owner":"freeCodeCamp","private":false},"normalizedContextURL":"https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs","checkoutLocation":"project","warnings":[],"envvars":[{"name":"CODEROAD_TUTORIAL_URL","value":"https://raw.githubusercontent.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/main/tutorial.json"},{"name":"CODEROAD_DISABLE_RUN_ON_SAVE","value":"true"},{"name":"CODEROAD_WEBHOOK_TOKEN","value":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOiJtYVR4ejNNYXZkdXNkb2Q2QlBUSElGOVR6MGl6eVB4dnBKYUhHNEVJSGNXS3hVUE05VVNwTm1HN3Z0VkM3Sjg1IiwiaWF0IjoxNzUwMDczOTI2fQ.7QqIQ7vCjQjNEfPiHLsboFG03XdsRtVjFy3nQ7PcorE"}]}
TERM=xterm-256color
USER=gitpod
JAVA_TOOL_OPTIONS=-XX:+UseContainerSupport -XX:ActiveProcessorCount=1
VSCODE_GIT_IPC_HANDLE=/tmp/vscode-git-d5e3ee95e0.sock
GITPOD_WORKSPACE_CLUSTER_HOST=ws-eu120.gitpod.io
GITPOD_GIT_USER_NAME=AnastasiiaLohinova Lohinova
CODEROAD_TUTORIAL_URL=https://raw.githubusercontent.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/main/tutorial.json
VISUAL=/ide/bin/remote-cli/gitpod-code
SHLVL=1
GITPOD_DEFAULT_WORKSPACE_IMAGE=gitpod/workspace-full:latest
GIT_EDITOR=/ide/bin/remote-cli/gitpod-code --wait
GITPOD_MEMORY=3328
GITPOD_CONFIGCAT_ENABLED=true
VSCODE_GIT_ASKPASS_MAIN=/ide/extensions/git/dist/askpass-main.js
GITPOD_HOST=https://gitpod.io
GITPOD_COMMIT_ANNOTATION_ENABLED=false
GITPOD_IS_SET_JAVA_PROCESSOR_COUNT=true
GITPOD_IDE_ALIAS=code
CODEROAD_DISABLE_RUN_ON_SAVE=true
BROWSER=/ide/bin/helpers/browser.sh
PATH=/ide/bin/remote-cli:/ide/bin/remote-cli:/home/gitpod/.nvm/versions/node/v18.19.0/bin:/home/gitpod/.yarn/bin:/home/gitpod/.pnpm:/home/gitpod/.local/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/gitpod/.rvm/bin
NODE_VERSION=18.19.0
GITPOD_ANALYTICS_SEGMENT_ENDPOINT=https://gitpod.io/analytics
GITPOD_GIT_USER_EMAIL=lohinova.anastasiia@gmail.com
VSX_REGISTRY_URL=https://open-vsx.gitpod.io
TERM_PROGRAM=vscode
GITPOD_TASKS=[{"before":"sudo touch /workspace/.bash_history\nsudo chmod -R 777 /workspace\nsudo cp /workspace/project/.freeCodeCamp/.bashrc ~/.bashrc\n","command":"sudo rm /workspace/project/CHANGELOG.md\nsudo rm /workspace/project/coderoad.yaml\nsudo rm /workspace/project/tutorial.json\nsudo rm /workspace/project/TUTORIAL.md\nexit\n"}]
VSCODE_IPC_HOOK_CLI=/tmp/vscode-ipc-dbe0af04-a0d9-4a2c-93c6-324f5d6a05ca.sock
_=/usr/bin/printenv -->
echo $LANG
<!-- output: en_US.UTF-8 -->
declare -p
<!-- output:
declare -- BASH="/bin/bash"
declare -r BASHOPTS="checkwinsize:cmdhist:complete_fullquote:expand_aliases:extglob:extquote:force_fignore:globasciiranges:histappend:interactive_comments:progcomp:promptvars:sourcepath"
declare -i BASHPID
declare -A BASH_ALIASES=()
declare -a BASH_ARGC=([0]="0")
declare -a BASH_ARGV=()
declare -- BASH_ARGV0
declare -A BASH_CMDS=()
declare -- BASH_COMMAND="declare -p"
declare -a BASH_COMPLETION_VERSINFO=([0]="2" [1]="11")
declare -a BASH_LINENO=()
declare -a BASH_REMATCH=()
declare -a BASH_SOURCE=()
declare -- BASH_SUBSHELL
declare -ar BASH_VERSINFO=([0]="5" [1]="1" [2]="16" [3]="1" [4]="release" [5]="x86_64-pc-linux-gnu")
declare -- BASH_VERSION="5.1.16(1)-release"
declare -x BROWSER="/ide/bin/helpers/browser.sh"
declare -x CODEROAD_DISABLE_RUN_ON_SAVE="true"
declare -x CODEROAD_TUTORIAL_URL="https://raw.githubusercontent.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/main/tutorial.json"
declare -x CODEROAD_WEBHOOK_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOiJtYVR4ejNNYXZkdXNkb2Q2QlBUSElGOVR6MGl6eVB4dnBKYUhHNEVJSGNXS3hVUE05VVNwTm1HN3Z0VkM3Sjg1IiwiaWF0IjoxNzUwMDczOTI2fQ.7QqIQ7vCjQjNEfPiHLsboFG03XdsRtVjFy3nQ7PcorE"
declare -x COLORTERM="truecolor"
declare -- COLUMNS="123"
declare -- COMP_WORDBREAKS
declare -a DIRSTACK=()
declare -x EDITOR="/ide/bin/remote-cli/gitpod-code"
declare -- EPOCHREALTIME
declare -- EPOCHSECONDS
declare -ir EUID="33333"
declare -a FUNCNAME
declare -x GITPOD_ANALYTICS_SEGMENT_ENDPOINT="https://gitpod.io/analytics"
declare -x GITPOD_ANALYTICS_WRITER="segment"
declare -x GITPOD_CODE_HOST="gitpod.io"
declare -x GITPOD_COMMIT_ANNOTATION_ENABLED="false"
declare -x GITPOD_CONFIGCAT_ENABLED="true"
declare -x GITPOD_CPU_COUNT="1"
declare -x GITPOD_DEFAULT_WORKSPACE_IMAGE="gitpod/workspace-full:latest"
declare -x GITPOD_DISABLE_JETBRAINS_LOCAL_PORT_FORWARDING="false"
declare -x GITPOD_GIT_USER_EMAIL="lohinova.anastasiia@gmail.com"
declare -x GITPOD_GIT_USER_NAME="AnastasiiaLohinova Lohinova"
declare -x GITPOD_HOST="https://gitpod.io"
declare -x GITPOD_IDE_ALIAS="code"
declare -x GITPOD_INSTANCE_ID="fff5cb06-2970-4c5b-b5c1-17c84db3245b"
declare -x GITPOD_INTERVAL="30000"
declare -x GITPOD_IS_SET_JAVA_PROCESSOR_COUNT="true"
declare -x GITPOD_IS_SET_JAVA_XMX="false"
declare -x GITPOD_MEMORY="3328"
declare -x GITPOD_OWNER_ID="8f38407e-2eb5-49fb-9c9f-2d1b6cd5cc28"
declare -x GITPOD_PREVENT_METADATA_ACCESS="true"
declare -x GITPOD_REPO_ROOT="/workspace/project"
declare -x GITPOD_REPO_ROOTS="/workspace/project"
declare -x GITPOD_SSH_CA_PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMQPGLZ5GCM03ISbMVdPZE9YO3KjbXcaxpdcUNPRNnbJ Gitpod-CA"
declare -x GITPOD_TASKS="[{\"before\":\"sudo touch /workspace/.bash_history\\nsudo chmod -R 777 /workspace\\nsudo cp /workspace/project/.freeCodeCamp/.bashrc ~/.bashrc\\n\",\"command\":\"sudo rm /workspace/project/CHANGELOG.md\\nsudo rm /workspace/project/coderoad.yaml\\nsudo rm /workspace/project/tutorial.json\\nsudo rm /workspace/project/TUTORIAL.md\\nexit\\n\"}]"
declare -x GITPOD_THEIA_PORT="23000"
declare -x GITPOD_WORKSPACE_CLASS="g1-standard"
declare -x GITPOD_WORKSPACE_CLASS_INFO="{\"id\":\"g1-standard\",\"category\":\"GENERAL PURPOSE\",\"displayName\":\"Standard\",\"description\":\"Up to 4 cores, 8GB RAM, 30GB storage\",\"powerups\":1,\"isDefault\":true,\"deprecated\":false}"
declare -x GITPOD_WORKSPACE_CLUSTER_HOST="ws-eu120.gitpod.io"
declare -x GITPOD_WORKSPACE_CONTEXT="{\"isFile\":false,\"path\":\"\",\"title\":\"freeCodeCamp/learn-bash-scripting-by-building-five-programs - main\",\"ref\":\"main\",\"refType\":\"branch\",\"revision\":\"84988b9eb3c1f6ec24770309af32c32e6f4b25f8\",\"repository\":{\"cloneUrl\":\"https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs.git\",\"host\":\"github.com\",\"defaultBranch\":\"main\",\"name\":\"learn-bash-scripting-by-building-five-programs\",\"owner\":\"freeCodeCamp\",\"private\":false},\"normalizedContextURL\":\"https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs\",\"checkoutLocation\":\"project\",\"warnings\":[],\"envvars\":[{\"name\":\"CODEROAD_TUTORIAL_URL\",\"value\":\"https://raw.githubusercontent.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/main/tutorial.json\"},{\"name\":\"CODEROAD_DISABLE_RUN_ON_SAVE\",\"value\":\"true\"},{\"name\":\"CODEROAD_WEBHOOK_TOKEN\",\"value\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOiJtYVR4ejNNYXZkdXNkb2Q2QlBUSElGOVR6MGl6eVB4dnBKYUhHNEVJSGNXS3hVUE05VVNwTm1HN3Z0VkM3Sjg1IiwiaWF0IjoxNzUwMDczOTI2fQ.7QqIQ7vCjQjNEfPiHLsboFG03XdsRtVjFy3nQ7PcorE\"}]}"
declare -x GITPOD_WORKSPACE_CONTEXT_URL="https://github.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs"
declare -x GITPOD_WORKSPACE_ID="freecodecam-learnbashsc-t3xxwshoeaq"
declare -x GITPOD_WORKSPACE_URL="https://freecodecam-learnbashsc-t3xxwshoeaq.ws-eu120.gitpod.io"
declare -x GIT_ASKPASS="/ide/extensions/git/dist/askpass.sh"
declare -x GIT_EDITOR="/ide/bin/remote-cli/gitpod-code --wait"
declare -x GP_EXTERNAL_BROWSER="/ide/bin/remote-cli/gitpod-code --openExternal"
declare -x GP_OPEN_EDITOR="/ide/bin/remote-cli/gitpod-code"
declare -x GP_PREVIEW_BROWSER="/ide/bin/remote-cli/gitpod-code --preview"
declare -a GROUPS=()
declare -i HISTCMD
declare -x HISTFILE="/workspace/.bash_history"
declare -- HISTFILESIZE="2000"
declare -- HISTSIZE="1000"
declare -x HOME="/home/gitpod"
declare -x HOSTNAME="freecodecam-learnbashsc-t3xxwshoeaq"
declare -- HOSTTYPE="x86_64"
declare -- IFS=" 
"
declare -x JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:ActiveProcessorCount=1"
declare -x LANG="en_US.UTF-8"
declare -- LINENO
declare -- LINES="10"
declare -x LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
declare -- MACHTYPE="x86_64-pc-linux-gnu"
declare -i MAILCHECK="60"
declare -x NODE_VERSION="18.19.0"
declare -x OLDPWD
declare -- OPTERR="1"
declare -i OPTIND="1"
declare -- OSTYPE="linux-gnu"
declare -x PATH="/ide/bin/remote-cli:/ide/bin/remote-cli:/home/gitpod/.nvm/versions/node/v18.19.0/bin:/home/gitpod/.yarn/bin:/home/gitpod/.pnpm:/home/gitpod/.local/bin:/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/gitpod/.rvm/bin"
declare -a PIPESTATUS=([0]="0")
declare -x PNPM_HOME="/home/gitpod/.pnpm"
declare -ir PPID="189"
declare -x PROMPT_COMMAND="__vsc_prompt_cmd_original"
declare -- PS1="\\[\\]camper: \\[\\033[01;34m\\]/\${PWD##*/}\\[\\033[00m\\]\\\$ \\[\\]"
declare -- PS2="\\[\\]> \\[\\]"
declare -- PS4="+ "
declare -x PWD="/workspace/project"
declare -x QTWEBENGINE_DISABLE_SANDBOX="1"
declare -i RANDOM
declare -- SECONDS
declare -- SHELL="/bin/bash"
declare -r SHELLOPTS="braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor"
declare -x SHLVL="1"
declare -i SRANDOM
declare -x SUPERVISOR_ADDR="localhost:22999"
declare -x TERM="xterm-256color"
declare -x TERM_PROGRAM="vscode"
declare -x TERM_PROGRAM_VERSION="1.100.2"
declare -x THEIA_MINI_BROWSER_HOST_PATTERN="browser-{{hostname}}"
declare -x THEIA_RATELIMIT_LOG="50"
declare -x THEIA_WEBVIEW_EXTERNAL_ENDPOINT="webview-{{hostname}}"
declare -x THEIA_WORKSPACE_ROOT="/workspace/project"
declare -x TRIGGER_REBUILD="1"
declare -ir UID="33333"
declare -x USER="gitpod"
declare -x VISUAL="/ide/bin/remote-cli/gitpod-code"
declare -x VSCODE_GIT_ASKPASS_EXTRA_ARGS=""
declare -x VSCODE_GIT_ASKPASS_MAIN="/ide/extensions/git/dist/askpass-main.js"
declare -x VSCODE_GIT_ASKPASS_NODE="/ide/node"
declare -x VSCODE_GIT_IPC_HANDLE="/tmp/vscode-git-d5e3ee95e0.sock"
declare -x VSCODE_IPC_HOOK_CLI="/tmp/vscode-ipc-dbe0af04-a0d9-4a2c-93c6-324f5d6a05ca.sock"
declare -- VSCODE_SHELL_INTEGRATION="1"
declare -x VSX_REGISTRY_URL="https://open-vsx.gitpod.io"
declare -x WORKSPACEKIT_WRAP_NETNS="true"
declare -- _="en_US.UTF-8"
declare -- __git_printf_supports_v="yes"
declare -- __vsc_current_command="declare -p"
declare -- __vsc_custom_PS1="\\[\\]camper: \\[\\033[01;34m\\]/\${PWD##*/}\\[\\033[00m\\]\\\$ \\[\\]"
declare -- __vsc_custom_PS2="\\[\\]> \\[\\]"
declare -- __vsc_cwd="/workspace/project"
declare -- __vsc_dbg_trap="echo \$BASH_COMMAND >> /workspace/project/.freeCodeCamp/test/.next_command"
declare -- __vsc_first_prompt="1"
declare -- __vsc_history_verify="1"
declare -- __vsc_in_command_execution="1"
declare -- __vsc_initialized="1"
declare -- __vsc_is_windows="0"
declare -- __vsc_nonce="0ec1cda3-9769-4bfe-ad4e-4acc68791881"
declare -- __vsc_original_PS1="camper: \\[\\033[01;34m\\]/\${PWD##*/}\\[\\033[00m\\]\\\$ "
declare -- __vsc_original_PS2="> "
declare -- __vsc_original_prompt_command="echo \$PWD >> /workspace/project/.freeCodeCamp/test/.cwd; history -a"
declare -- __vsc_stable="1"
declare -- __vsc_status="0"
declare -- __vscode_shell_env_reporting=""
declare -- _backup_glob="@(#*#|*@(~|.@(bak|orig|rej|swp|dpkg*|rpm@(orig|new|save))))"
declare -A _xspecs=([tex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [freeamp]="!*.@(mp3|og[ag]|pls|m3u)" [gqmpeg]="!*.@(mp3|og[ag]|pls|m3u)" [texi2html]="!*.texi*" [hbpp]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [lowriter]="!*.@(sxw|stw|sxg|sgl|doc?([mx])|dot?([mx])|rtf|txt|htm|html|?(f)odt|ott|odm|pdf)" [rpm2cpio]="!*.[rs]pm" [localc]="!*.@(sxc|stc|xls?([bmx])|xlw|xlt?([mx])|[ct]sv|?(f)ods|ots)" [hbrun]="!*.[Hh][Rr][Bb]" [vi]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [latex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [view]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [madplay]="!*.mp3" [compress]="*.Z" [pdfjadetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [pbunzip2]="!*.?(t)bz?(2)" [lrunzip]="!*.lrz" [gunzip]="!*.@(Z|[gGd]z|t[ag]z)" [oowriter]="!*.@(sxw|stw|sxg|sgl|doc?([mx])|dot?([mx])|rtf|txt|htm|html|?(f)odt|ott|odm|pdf)" [epiphany]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [acroread]="!*.[pf]df" [znew]="*.Z" [kwrite]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [xemacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [gview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [lzfgrep]="!*.@(tlz|lzma)" [lzless]="!*.@(tlz|lzma)" [cdiff]="!*.@(dif?(f)|?(d)patch)?(.@([gx]z|bz2|lzma))" [zipinfo]="!*.@(zip|[aegjswx]ar|exe|pk3|wsz|zargo|xpi|s[tx][cdiw]|sx[gm]|o[dt][tspgfc]|od[bm]|oxt|epub|apk|aab|ipa|do[ct][xm]|p[op]t[mx]|xl[st][xm]|pyz|whl)" [pdflatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [portecle]="!@(*.@(ks|jks|jceks|p12|pfx|bks|ubr|gkr|cer|crt|cert|p7b|pkipath|pem|p10|csr|crl)|cacerts)" [modplugplay]="!*.@(669|abc|am[fs]|d[bs]m|dmf|far|it|mdl|m[eo]d|mid?(i)|mt[2m]|oct|okt?(a)|p[st]m|s[3t]m|ult|umx|wav|xm)" [lokalize]="!*.po" [lbzcat]="!*.?(t)bz?(2)" [qiv]="!*.@(gif|jp?(e)g|tif?(f)|png|p[bgp]m|bmp|x[bp]m|rle|rgb|pcx|fits|pm|svg)" [totem]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [ps2pdfwr]="!*.@(?(e)ps|pdf)" [dvitype]="!*.dvi" [unpigz]="!*.@(Z|[gGdz]z|t[ag]z)" [mozilla]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [pdfunite]="!*.pdf" [gpdf]="!*.[pf]df" [texi2dvi]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [bunzip2]="!*.?(t)bz?(2)" [zathura]="!*.@(cb[rz7t]|djv?(u)|?(e)ps|pdf)" [kaffeine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [mpg123]="!*.mp3" [lzegrep]="!*.@(tlz|lzma)" [xv]="!*.@(gif|jp?(e)g?(2)|j2[ck]|jp[2f]|tif?(f)|png|p[bgp]m|bmp|x[bp]m|rle|rgb|pcx|fits|pm|?(e)ps)" [xdvi]="!*.@(dvi|DVI)?(.@(gz|Z|bz2))" [xfig]="!*.fig" [xpdf]="!*.@(pdf|fdf)?(.@(gz|GZ|bz2|BZ2|Z))" [oobase]="!*.odb" [xelatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [gharbour]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [bzcat]="!*.?(t)bz?(2)" [dragon]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM|iso|ISO)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [xanim]="!*.@(mpg|mpeg|avi|mov|qt)" [lualatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [rgview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [rvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [xetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [lomath]="!*.@(sxm|smf|mml|odf)" [zcat]="!*.@(Z|[gGd]z|t[ag]z)" [lynx]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [uncompress]="!*.Z" [xzcat]="!*.@(?(t)xz|tlz|lzma)" [vim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [loimpress]="!*.@(sxi|sti|pps?(x)|ppt?([mx])|pot?([mx])|?(f)odp|otp)" [dvipdf]="!*.dvi" [mpg321]="!*.mp3" [jadetex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [lobase]="!*.odb" [epdfview]="!*.pdf" [ps2pdf14]="!*.@(?(e)ps|pdf)" [ps2pdf13]="!*.@(?(e)ps|pdf)" [ps2pdf12]="!*.@(?(e)ps|pdf)" [poedit]="!*.po" [luatex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [kbabel]="!*.po" [bzme]="!*.@(zip|z|gz|tgz)" [dviselect]="!*.dvi" [realplay]="!*.@(rm?(j)|ra?(m)|smi?(l))" [kdvi]="!*.@(dvi|DVI)?(.@(gz|Z|bz2))" [elinks]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [kghostview]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [gtranslator]="!*.po" [unzip]="!*.@(zip|[aegjswx]ar|exe|pk3|wsz|zargo|xpi|s[tx][cdiw]|sx[gm]|o[dt][tspgfc]|od[bm]|oxt|epub|apk|aab|ipa|do[ct][xm]|p[op]t[mx]|xl[st][xm]|pyz|whl)" [ggv]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [oomath]="!*.@(sxm|smf|mml|odf)" [dvipdfmx]="!*.dvi" [makeinfo]="!*.texi*" [okular]="!*.@(okular|@(?(e|x)ps|?(E|X)PS|[pf]df|[PF]DF|dvi|DVI|cb[rz]|CB[RZ]|djv?(u)|DJV?(U)|dvi|DVI|gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx|GIF|JP?(E)G|MIFF|TIF?(F)|PN[GM]|P[BGP]M|BMP|XPM|ICO|XWD|TGA|PCX|epub|EPUB|odt|ODT|fb?(2)|FB?(2)|mobi|MOBI|g3|G3|chm|CHM)?(.?(gz|GZ|bz2|BZ2|xz|XZ)))" [sxemacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [aviplay]="!*.@(avi|asf|wmv)" [rgvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [dvipdfm]="!*.dvi" [ly2dvi]="!*.ly" [oodraw]="!*.@(sxd|std|sda|sdd|?(f)odg|otg)" [kpdf]="!*.@(?(e)ps|pdf)" [bibtex]="!*.aux" [netscape]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [emacs]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [rview]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [galeon]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [dillo]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [fbxine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [oocalc]="!*.@(sxc|stc|xls?([bmx])|xlw|xlt?([mx])|[ct]sv|?(f)ods|ots)" [harbour]="!*.@([Pp][Rr][Gg]|[Cc][Ll][Pp])" [lodraw]="!*.@(sxd|std|sda|sdd|?(f)odg|otg)" [dvips]="!*.dvi" [ps2pdf]="!*.@(?(e)ps|pdf)" [kate]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [kid3-qt]="!*.@(mp[234c]|og[ag]|@(fl|a)ac|m4[abp]|spx|tta|w?(a)v|wma|aif?(f)|asf|ape)" [pdftex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [gvim]="*.@([ao]|so|so.!(conf|*/*)|[rs]pm|gif|jp?(e)g|mp3|mp?(e)g|avi|asf|ogg|class)" [timidity]="!*.@(mid?(i)|rmi|rcp|[gr]36|g18|mod|xm|it|x3m|s[3t]m|kar)" [ogg123]="!*.@(og[ag]|m3u|flac|spx)" [lzgrep]="!*.@(tlz|lzma)" [ee]="!*.@(gif|jp?(e)g|miff|tif?(f)|pn[gm]|p[bgp]m|bmp|xpm|ico|xwd|tga|pcx)" [unlzma]="!*.@(tlz|lzma)" [lbunzip2]="!*.?(t)bz?(2)" [ooimpress]="!*.@(sxi|sti|pps?(x)|ppt?([mx])|pot?([mx])|?(f)odp|otp)" [xine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [amaya]="!*.@(?([xX]|[sS])[hH][tT][mM]?([lL]))" [gv]="!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))" [kid3]="!*.@(mp[234c]|og[ag]|@(fl|a)ac|m4[abp]|spx|tta|w?(a)v|wma|aif?(f)|asf|ape)" [lilypond]="!*.ly" [modplug123]="!*.@(669|abc|am[fs]|d[bs]m|dmf|far|it|mdl|m[eo]d|mid?(i)|mt[2m]|oct|okt?(a)|p[st]m|s[3t]m|ult|umx|wav|xm)" [pbzcat]="!*.?(t)bz?(2)" [unxz]="!*.@(?(t)xz|tlz|lzma)" [playmidi]="!*.@(mid?(i)|cmf)" [lzcat]="!*.@(tlz|lzma)" [slitex]="!*.@(?(la)tex|texi|dtx|ins|ltx|dbj)" [aaxine]="!*@(.@(mp?(e)g|MP?(E)G|wm[av]|WM[AV]|avi|AVI|asf|vob|VOB|bin|dat|divx|DIVX|vcd|ps|pes|fli|flv|FLV|fxm|FXM|viv|rm|ram|yuv|mov|MOV|qt|QT|web[am]|WEB[AM]|mp[234]|MP[234]|m?(p)4[av]|M?(P)4[AV]|mkv|MKV|og[agmvx]|OG[AGMVX]|t[ps]|T[PS]|m2t?(s)|M2T?(S)|mts|MTS|wav|WAV|flac|FLAC|asx|ASX|mng|MNG|srt|m[eo]d|M[EO]D|s[3t]m|S[3T]M|it|IT|xm|XM)|+([0-9]).@(vdr|VDR))?(.@(crdownload|part))" [advi]="!*.dvi" [lzmore]="!*.@(tlz|lzma)" )
declare -- bash_major_version="5"
declare -a envVarsToReport=()
declare -- use_associative_array="1"
declare -A vsc_aa_env
declare -a vsc_env_keys=()
declare -a vsc_env_values=() -->
echo $RANDOM
<!-- output: 16915 -->
./bingo.sh
<!-- output: 

~~ Bingo Number Generator ~~

26121 -->
./bingo.sh

<!-- output:

~~ Bingo Number Generator ~~

11659 -->
I=0 
# input in the terminal 

echo $I
<!-- output:
0 -->
(( I++ ))
# was error
echo $I
# but 
<!-- output:
1 -->
help let
<!-- let: let arg [arg ...]
    Evaluate arithmetic expressions.
    
    Evaluate each ARG as an arithmetic expression.  Evaluation is done in
    fixed-width integers with no check for overflow, though division by 0
    is trapped and flagged as an error.  The following list of operators is
    grouped into levels of equal-precedence operators.  The levels are listed
    in order of decreasing precedence.
    
        id++, id--      variable post-increment, post-decrement
        ++id, --id      variable pre-increment, pre-decrement
        -, +            unary minus, plus
        !, ~            logical and bitwise negation
        **              exponentiation
        *, /, %         multiplication, division, remainder
        +, -            addition, subtraction
        <<, >>          left and right bitwise shifts
        <=, >=, <, >    comparison
        ==, !=          equality, inequality
        &               bitwise AND
        ^               bitwise XOR
        |               bitwise OR
        &&              logical AND
        ||              logical OR
        expr ? expr : expr
                        conditional operator
        =, *=, /=, %=,
        +=, -=, <<=, >>=,
        &=, ^=, |=      assignment
    
    Shell variables are allowed as operands.  The name of the variable
    is replaced by its value (coerced to a fixed-width integer) within
    an expression.  The variable need not have its integer attribute
    turned on to be used in an expression.
    
    Operators are evaluated in order of precedence.  Sub-expressions in
    parentheses are evaluated first and may override the precedence
    rules above.
    
    Exit Status:
    If the last ARG evaluates to 0, let returns 1; let returns 0 otherwise. -->
(( I += 10 ))
echo $I
<!-- output:
11 -->
$(( I + 4 ))
% output: was error but it counted 11+4
% bash: 15: command not found
echo $(( I + 4 ))
<!-- output: 
15 -->
echo $I
<!-- output: 
11 -->
J=$(( I - 6 ))
echo $J
<!-- output: 
5 -->
echo $(( J * 5 + 25 ))
<!-- output: 
50 -->
declare -p J
<!-- output: declare -- J="5" -->
declare -p RANDOM
<!-- output: declare -i RANDOM="8063" -->
echo $(( RANDOM % 75 ))
# that calculation will give a number between 0 and 74
<!-- output: 42 -->

echo $(( RANDOM % 75 + 1 ))
<!-- output: 18 -->

./bingo.sh
<!-- output:

~~ Bingo Number Generator ~~

7 -->
./bingo.sh
<!-- output:

~~ Bingo Number Generator ~~

The next number is, N:32 -->
./bingo.sh
 <!-- output:

~~ Bingo Number Generator ~~

The next number is, G:54 -->

# fortune.sh
chmod +x fortune.sh
ARR=("a" "b" "c")
# it is an array the first item would be index zero
echo ${ARR[1]}
<!-- output: b -->
echo ${ARR[@]}
<!-- output:
a b c -->
# it is the same echo ${ARR[*]}
<!-- output:
a b c -->
declare -p ARR
<!-- output: declare -a ARR=([0]="a" [1]="b" [2]="c") -->
./fortune.sh
<!-- output:

~~ Fortune Teller ~~

Ask again later -->
help function
<!-- function: function name { COMMANDS ; } or name () { COMMANDS ; }
    Define shell function.
    
    Create a shell function named NAME.  When invoked as a simple command,
    NAME runs COMMANDs in the calling shell's context.  When NAME is invoked,
    the arguments are passed to the function as $1...$n, and the function's
    name is in $FUNCNAME.
    
    Exit Status:
    Returns success unless NAME is readonly. -->
./fortune.sh
 <!-- output:

~~ Fortune Teller ~~

Outlook good
Ask a yes or no question: -->
./fortune.sh
<!-- output:

~~ Fortune Teller ~~

Don't count on it
Ask a yes or no question:
Input: 
Am I young? -->
help until 
<!-- until: until COMMANDS; do COMMANDS; done
    Execute commands as long as a test does not succeed.
    
    Expand and execute COMMANDS as long as the final command in the
    `until' COMMANDS has an exit status which is not zero.
    
    Exit Status:
    Returns the status of the last command executed. -->
[[ hello == hello ]]; echo $? 
<!-- output:
0 -->
[[ hello == world ]]; echo $?
<!-- output:
1 --> 
[[ hello =~ el ]]; echo $?
<!-- output:
0 -->
[[ 'hello world' =~ 'lo wor' ]]; echo $?
<!-- output:
0 -->
[[ "hello world" =~ ^h ]]; echo $? 
<!-- output:
0 --> 
[[ "hello world" =~ ^h.+d$ ]]; echo $?
# the string starts with an h, has at least one character after it, and ends with a d.
<!-- output:
0 --> 
VAR="hello world"
echo $VAR
<!-- output: hello world -->
[[ $VAR == "hello world" ]]; echo $?
<!-- output:
0 --> 
[[ $VAR =~ \?$ ]]; echo $?
<!-- output:
1 --> 

# five.sh
touch five.sh
# this file to run my other four programs
chmod +x five.sh
help type
<!-- type: type [-afptP] name [name ...]
    Display information about command type.
    
    For each NAME, indicate how it would be interpreted if used as a
    command name.
    
    Options:
      -a        display all locations containing an executable named NAME;
                includes aliases, builtins, and functions, if and only if
                the `-p' option is not also used
      -f        suppress shell function lookup
      -P        force a PATH search for each NAME, even if it is an alias,
                builtin, or function, and returns the name of the disk file
                that would be executed
      -p        returns either the name of the disk file that would be executed,
                or nothing if `type -t NAME' would not return `file'
      -t        output a single word which is one of `alias', `keyword',
                `function', `builtin', `file' or `', if NAME is an alias,
                shell reserved word, shell function, shell builtin, disk file,
                or not found, respectively
    
    Arguments:
      NAME      Command name to be interpreted.
    
    Exit Status:
    Returns success if all of the NAMEs are found; fails if any are not found. -->
type echo
<!-- output: 
echo is a shell builtin -->
type read
<!-- output:
read is a shell builtin -->
type if
<!-- output:
if is a shell keyword -->
type then
<!-- output:
then is a shell keyword -->
type bash
<!-- output:
bash is /usr/bin/bash -->
type psql
<!-- output:
bash: type: psql: not found -->
type ./five.sh
<!-- output:
./five.sh is ./five.sh -->
./five.sh
<!-- output:

~~ Questionnaire ~~

What's your name?
Anastasiia
Where are you from?
Lviv
What's your favorite coding website?
GPT

Hello Anastasiia from Lviv. I learned that your favorite coding website is GPT!

~~ Countdown Timer ~~

3
2
1
0

~~ Bingo Number Generator ~~

The next number is, I:26

~~ Fortune Teller ~~

Ask a yes or no question:
Do you speak English?

Ask again later -->
