# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

EDITOR=vim

function krep() {
    grep -r "$1" * 2>/dev/null | grep -v \.svn | grep -v ^Binary | grep -v "obj." | grep -v "^cscope.out"
}

function kind() {
    find . -name "$1" \
        2>/dev/null | grep -v \.svn
}

function sshr() {
    ssh root@$1
}

function mand() {
    for file in $(find . -name Makefile)
    do
        grep "$1" $file 2>&1 1>/dev/null
        rc=$?
        if [ "$rc" = "0" ]
        then
            echo "=== start: $file ==="
            echo "$(grep $1 $file)"
            echo "=== end: $file ==="
            echo
        fi
    done
}
