function addToPath {
    export PATH="$1:$PATH"
}
function doOnce {
    if [ "$SHLVL" = 1 ]; then
        sh -c "${@:1}"
    fi
}
function addToPathOnce {
    if [ "$SHLVL" = 1 ]; then
        export PATH="$1:$PATH"
    fi
}
