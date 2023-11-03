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

function git_flow_feature_start() {
    curbranch=$(git symbolic-ref --short HEAD)
    if [ "$curbranch" == "devel" ]; then
        if [ -z "$1" ]; then
            echo "Please specify a feature name to start."
        else
            git flow feature start "$1"
        fi
    else
        echo "You can only start a new feature from the 'devel' branch."
    fi
}

function git_flow_feature_finish() {
    curbranch=$(git symbolic-ref --short HEAD)
    if [[ $curbranch == feature/* ]]; then
        git flow feature finish "${curbranch#feature/}"
    else
        echo "You can only finish a feature if you are on a 'feature/*' branch."
    fi
}

alias gfs="git_flow_feature_start"
alias gff="git_flow_feature_finish"

