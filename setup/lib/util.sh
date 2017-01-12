#! /bin/zsh

# Needs to have $0 passed to it at execution
# because locally, it's replaced with the function name
get_script_path() {
    local mypath=`dirname "$1"`
    echo `cd "$mypath" && pwd`
}

source $(get_script_path $0)/spectrum.zsh

echo_color() {
    bkg=$BG[${2-250}]
    frg=$FG[${3-black}]
    echo -e "${frg}${bkg}$1${FG[none]}${BG[none]}";
}

echo_royal_suggestion() {
    echo_color "Your $(royal)," ${2-yellow} $3
    echo_suggestion $1 ${2-yellow} $3
}

echo_suggestion() {
    echo_color $1 $2 $3
}

echo_done() {
    echo_color "Done!"
    echo -e
}

exit_if_fail() {
  set +e
  `$0`
  if [[ "$?" != 0 ]]; then
    set -e
    echo_color "$1"
    exit 1
  fi
  set -e
}

royal() {
    local attr names index1 index2
    attr=(\
        "Royal" \
        "Unholy" \
        "Epic" \
        "Potent" \
        "Virile" \
        "Evil" \
        "Devious" \
    )
    names=(\
        "Future Myopicness" \
        "Carpal-Tunnelness" \
        "Connectedness" \
        "Caffeinatedness" \
        "Mastermindness" \
        "Nippleness" \
        "Druidness" \
    )

    # +1 added because zsh array are 1 indexed instead of 0
    index1=$(($RANDOM%${#attr[@]}+1))
    index2=$(($RANDOM%${#names[@]}+1))
    echo "${attr[$index1]} ${names[$index2]}"
}

fin() {
    echo -e
    echo_color ${2-"<m(__)m>"} ${1-yellow}
}

royal_fin() {
    fin yellow "<m(__)m> Done, Your $(royal)."
}
