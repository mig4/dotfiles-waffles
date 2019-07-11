function gclone --description 'git clone from a hub URL to appropriate workspace'
    set -l githost
    set -l gitrepo
    set -l gitns
    set -l wsroot $HOME/wrk
    set -l url $argv[1]

    if test (count $argv) -eq 2
        set gitrepo $argv[2]
        switch $argv[1]
            case gh
                set githost github.com
                set url https://$githost/
            case gl
                set githost gitlab.com
                set url https://$githost/
            case '*'
                echo "Unknown git host $argv[1]" >&2
        end
        set url "$url$gitrepo.git"
    else
        if string match -q 'http*' $url
            set -l urlparts (string split / $url)
            set githost $urlparts[3]
            set gitrepo (string join / $urlparts[4..-1])
        else
            set -l urlparts (string split : $url)
            set githost (string replace --regex '^.*@' '' $urlparts[1])
            set gitrepo $urlparts[2]
        end
        set gitrepo (string replace --regex '\.git$' '' $gitrepo)
    end

    set gitns (string join / (string split / $gitrepo)[1..-2])
    set repodir (string join / $wsroot $githost $gitrepo)
    set nsdir (string join / $wsroot $githost $gitns)

    echo "url: $url"
    echo "githost: $githost"
    echo "gitrepo: $gitrepo (-> $repodir)"
    echo "gitns: $gitns (-> $nsdir)"

    if not test -d $nsdir
        mkdir -p $nsdir
    end
    git clone $url $repodir
end
