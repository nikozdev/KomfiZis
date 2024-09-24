# .zprofile - zshell one-time-running init script;

echo "startx? [Y/n]"
read iput
case $iput in
    ("Y"|"y"|"")
        startx
        ;;
    ("n")
        ;;
    (*)
        echo "invalid answer: ${iput}"
        ;;
esac
