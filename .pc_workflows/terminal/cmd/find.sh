

pcwf_findsrc() {
    find $* -name .repo -prune -o -name .git -prune -o -type f \( \
        -iname '*.c' -o -iname '*.cc' -o -iname '*.cpp' -o -iname '*.h' \
        -o -iname '*.java' \
        -o -iname '*.xml' \
        -o -iname '*.mk' \
        \) -print
}

