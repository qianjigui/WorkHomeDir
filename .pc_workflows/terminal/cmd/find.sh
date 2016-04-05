

pcwf_findsrc() {
    find $* -name .repo -prune -o -name .git -prune -o -type f \( \
        -iname '*.c' \
        -o -iname '*.cc' \
        -o -iname '*.cpp' \
        -o -iname '*.h' \
        -o -iname '*.hpp' \
        -o -iname '*.hxx' \
        -o -iname '*.java' \
        -o -iname '*.mk' \
        -o -iname '*.xml' \
        -o -iname '*.mk' \
        -o -iname '*.rb' \
        -o -iname '*.go' \
        -o -iname '*.py' \
        \) -print
}

