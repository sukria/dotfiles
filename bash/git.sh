export GIT_DIFF_PAGER="colordiff | less -RS"
export GIT_EDITOR="vim"

function gitexp ()
{
    local name=$(pwd)
    name=${name##*/}

    if [ ! "$1" ]; then
        echo "[ERROR] what branch to export?"
        return 1
    fi

    local date=$(TZ=UTC date '+%Y%m%d.%H%M')
    local pkg="$name-$date"
    local dir=".."
    local tar="$dir/$pkg.tar.gz"

    git archive \
        --format=tar \
        --prefix="$pkg/" \
        "$@" |
    gzip --best > "$tar"

    echo $tar
}

