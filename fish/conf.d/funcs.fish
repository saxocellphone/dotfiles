function fish_greeting
    echo Hello friend!
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end

function git_clean
    # See this SO page
    # https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote
    echo Cleaning branches...
    git fetch -p
    for branch in (git branch -vv | grep ': gone]' | awk '{print $1}')
        git branch -D $branch
    end
end

